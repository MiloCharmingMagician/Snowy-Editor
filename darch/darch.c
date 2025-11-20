#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <windows.h>

typedef unsigned char byte;
typedef unsigned int  dword;

#define MAX_NAME 512

typedef struct {
    char name[MAX_NAME];
    dword offset;
    dword size;
    byte key;
} FileEntry;

/* XOR buffer with a key (can be 1 or 4 bytes) */
void xor_buffer(byte *buf, dword size, byte *key, dword keylen) {
    dword i;
    for (i = 0; i < size; i++) {
        buf[i] ^= key[i % keylen];
    }
}

/* Read 32-bit little-endian */
dword read_long(FILE *f) {
    byte b[4];
    if (fread(b, 1, 4, f) != 4) return 0;
    return (dword)b[0] | ((dword)b[1] << 8) | ((dword)b[2] << 16) | ((dword)b[3] << 24);
}

/* Read single byte */
byte read_byte(FILE *f) {
    byte b;
    if (fread(&b, 1, 1, f) != 1) return 0;
    return b;
}

/* Create directories recursively using Windows API */
void create_dirs_for_file(const char *path) {
    char tmp[MAX_NAME];
    char *p;
    strncpy(tmp, path, MAX_NAME-1);
    tmp[MAX_NAME-1] = 0;

    for (p = tmp + 1; *p; p++) {
        if (*p == '\\' || *p == '/') {
            *p = 0;
            CreateDirectory(tmp, NULL);
            *p = '\\';
        }
    }
}

/* ARF unpacker */
int unpack_arf(const char *filename) {
    FILE *f;
    dword magic, files_count, entries_offset;
    byte key[4];
    FileEntry *entries;
    char **names;
    dword i;

    f = fopen(filename, "rb");
    if (!f) { printf("Cannot open file %s\n", filename); return 1; }

    /* Header */
    magic = read_long(f);
    files_count = read_long(f);
    key[0] = read_byte(f);
    key[1] = read_byte(f);
    key[2] = read_byte(f);
    key[3] = read_byte(f);
    entries_offset = read_long(f);

    printf("Header: magic=0x%08X, files=%u, key=[%u,%u,%u,%u], entries_offset=%u\n",
           magic, files_count, key[0], key[1], key[2], key[3], entries_offset);

    /* Allocate arrays */
    names = (char **)malloc(files_count * sizeof(char *));
    entries = (FileEntry *)malloc(files_count * sizeof(FileEntry));
    if (!names || !entries) { fclose(f); return 1; }

    for (i = 0; i < files_count; i++) {
        names[i] = (char *)malloc(MAX_NAME);
        if (!names[i]) { fclose(f); return 1; }
        names[i][0] = 0;
    }

    /* Read and decrypt filenames with 4-byte padding like QuickBMS */
    for (i = 0; i < files_count; i++) {
        byte namesz;
        dword padded_sz;
        byte *buf;

        namesz = read_byte(f);
        padded_sz = (namesz + 3) & ~3; /* round up to multiple of 4 */

        buf = (byte *)malloc(padded_sz);
        if (!buf) { fclose(f); return 1; }
        memset(buf, 0, padded_sz);

        if (fread(buf, 1, namesz, f) != namesz) { free(buf); fclose(f); return 1; }

        xor_buffer(buf, padded_sz, key, 4); /* XOR full padded block */
        memcpy(names[i], buf, namesz);
        names[i][namesz] = 0;

        free(buf);
        printf("[DEBUG] Filename %u: '%s'\n", i, names[i]);
    }

    /* Read file entries */
    fseek(f, entries_offset, SEEK_SET);
    for (i = 0; i < files_count; i++) {
        dword tmpid, keyval;
        tmpid = read_long(f); /* unused */
        entries[i].offset = read_long(f);
        entries[i].size = read_long(f);
        keyval = read_long(f);
        entries[i].key = (byte)(keyval & 0xFF);
        strncpy(entries[i].name, names[i], MAX_NAME-1);
        entries[i].name[MAX_NAME-1] = 0;

        printf("[DEBUG] Entry %u: name='%s', offset=%u, size=%u, key=%02X\n",
               i, entries[i].name, entries[i].offset, entries[i].size, entries[i].key);
    }

    /* Extract files following QuickBMS XOR rules */
    for (i = 0; i < files_count; i++) {
        FILE *out;
        byte *buf;
        dword tmp_size = 0x14;
        dword offset = entries[i].offset;
        dword size   = entries[i].size;

        if (size == 0) continue;

        create_dirs_for_file(entries[i].name);

        fseek(f, offset, SEEK_SET);

        if (entries[i].key == 0) {
            /* key == 0 -> just read normally */
            buf = (byte *)malloc(size);
            if (!buf) continue;
            fread(buf, 1, size, f);
            out = fopen(entries[i].name, "wb");
            if (out) { fwrite(buf, 1, size, out); fclose(out); }
            free(buf);
        } else {
            /* key != 0 -> XOR first 0x14 bytes */
            if (size < tmp_size) tmp_size = size;

            buf = (byte *)malloc(tmp_size);
            if (!buf) continue;
            fread(buf, 1, tmp_size, f);
            xor_buffer(buf, tmp_size, &entries[i].key, 1);
            out = fopen(entries[i].name, "wb");
            if (out) { fwrite(buf, 1, tmp_size, out); fclose(out); }
            free(buf);

            offset += tmp_size;
            size   -= tmp_size;

            /* write remaining bytes unmodified */
            if (size > 0) {
                buf = (byte *)malloc(size);
                if (!buf) continue;
                fseek(f, offset, SEEK_SET);
                fread(buf, 1, size, f);
                out = fopen(entries[i].name, "ab"); /* append */
                if (out) { fwrite(buf, 1, size, out); fclose(out); }
                free(buf);
            }
        }
    }

    /* Cleanup */
    for (i = 0; i < files_count; i++) free(names[i]);
    free(names);
    free(entries);
    fclose(f);

    printf("Unpacking complete.\n");
    return 0;
}

int main(void) {
    unpack_arf("customdata.arf");
    system("pause");
    return 0;
}