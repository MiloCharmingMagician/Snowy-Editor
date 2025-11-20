#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <windows.h>  /* for _mkdir */

typedef unsigned char byte;
typedef unsigned int  dword;

#define MAX_NAME 512

typedef struct {
    char name[MAX_NAME];
    dword offset;
    dword size;
    byte key;
} FileEntry;

/* XOR a buffer with repeated 4-byte key */
void xor_buffer(byte *buf, dword size, byte *key) {
    dword i;
    for (i = 0; i < size; i++) {
        buf[i] ^= key[i % 4];
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

/* Recursively create directories for a given path */
void create_dirs_for_file(const char *path) {
    char tmp[MAX_NAME];
    char *p;
    size_t len;

    strncpy(tmp, path, MAX_NAME - 1);
    tmp[MAX_NAME - 1] = 0;
    len = strlen(tmp);

    for (p = tmp + 1; *p; p++) {
        if (*p == '\\' || *p == '/') {
            *p = 0;
            _mkdir(tmp);  /* create intermediate folder */
            *p = '\\';
        }
    }
    /* No need to create final folder if it's a file */
}

/* Unpack .arf archive */
int unpack_arf(const char *filename) {
    FILE *f;
    dword magic;
    dword files_count;
    byte tmp1, tmp2, tmp3, tmp4;
    byte key[4];
    dword offset;
    char **names;
    FileEntry *entries;
    dword i;

    f = fopen(filename, "rb");
    if (!f) {
        printf("Cannot open file %s\n", filename);
        return 1;
    }

    /* Header */
    magic = read_long(f);
    files_count = read_long(f);
    tmp1 = read_byte(f);
    tmp2 = read_byte(f);
    tmp3 = read_byte(f);
    tmp4 = read_byte(f);
    key[0] = tmp1; key[1] = tmp2; key[2] = tmp3; key[3] = tmp4;
    offset = read_long(f);

    /* Heap allocation for names */
    names = (char **)malloc(files_count * sizeof(char *));
    if (!names) { fclose(f); return 1; }
    for (i = 0; i < files_count; i++) {
        names[i] = (char *)malloc(MAX_NAME);
        if (!names[i]) { fclose(f); return 1; }
        names[i][0] = 0;
    }

    /* Heap allocation for entries */
    entries = (FileEntry *)malloc(files_count * sizeof(FileEntry));
    if (!entries) { fclose(f); return 1; }

    /* Read and decrypt filenames */
    for (i = 0; i < files_count; i++) {
        byte namesz;
        dword tmp_size;
        byte *namebuf;

        namesz = read_byte(f);
        tmp_size = (namesz + 3) & ~3;  /* round up to multiple of 4 */

        namebuf = (byte *)malloc(tmp_size);
        if (!namebuf) { fclose(f); return 1; }

        if (fread(namebuf, 1, tmp_size, f) != tmp_size) {
            free(namebuf);
            fclose(f);
            return 1;
        }

        xor_buffer(namebuf, tmp_size, key);

        /* Copy only actual name bytes */
        memcpy(names[i], namebuf, namesz);
        names[i][namesz] = 0;

        free(namebuf);

        /* Skip padding (TMP - namesz) */
        if (tmp_size > namesz) {
            fseek(f, tmp_size - namesz, SEEK_CUR);
        }
    }

    /* Read file entries */
    fseek(f, offset, SEEK_SET);
    for (i = 0; i < files_count; i++) {
        dword id, keyval;

        id = read_long(f); /* unused */
        entries[i].offset = read_long(f);
        entries[i].size = read_long(f);
        keyval = read_long(f);
        entries[i].key = (byte)(keyval & 0xFF);

        strncpy(entries[i].name, names[i], MAX_NAME - 1);
        entries[i].name[MAX_NAME - 1] = 0;
    }

    /* Extract files and create folders */
    for (i = 0; i < files_count; i++) {
        FILE *out;
        byte *buf;
        dword xorlen;

        if (entries[i].size > 0) {
            /* It's a file: create parent directories */
            create_dirs_for_file(entries[i].name);

            fseek(f, entries[i].offset, SEEK_SET);
            buf = (byte *)malloc(entries[i].size);
            if (!buf) continue;

            fread(buf, 1, entries[i].size, f);

            if (entries[i].key != 0) {
                xorlen = (entries[i].size < 0x14) ? entries[i].size : 0x14;
                xor_buffer(buf, xorlen, &entries[i].key);
            }

            out = fopen(entries[i].name, "wb");
            if (out) {
                fwrite(buf, 1, entries[i].size, out);
                fclose(out);
            }
            free(buf);
        } else {
            /* It's a folder: just create the directories */
            create_dirs_for_file(entries[i].name);
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