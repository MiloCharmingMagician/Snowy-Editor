#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define THP_MAGIC 18516
#define THP_FIXED 16
#define TH3_MAGIC 13140

#define MAX_LEVELS   1000
#define MAX_CONFIG   7
#define MAX_LAYERS   2
#define MAP_FLAG_MAX 100
#define MAP_FLAG2_MAX 5300

#define MAX_WIDTH 40
#define MAX_HEIGHT 30

typedef unsigned char  u8;
typedef unsigned short u16;
typedef unsigned long  u32;

u32 levelCount;
u16 worldType[MAX_LEVELS];
u16 mapConfig[MAX_LEVELS][MAX_CONFIG];
u16 mapWidth[MAX_LEVELS];
u16 mapHeight[MAX_LEVELS];

u16 mapData[MAX_LEVELS][MAX_WIDTH][MAX_HEIGHT][MAX_LAYERS];
u32 mapFlags[MAX_LEVELS][MAP_FLAG_MAX];
u16 mapFlags2[MAX_LEVELS][MAP_FLAG2_MAX];

void init()
{
    /* Clear all arrays (SO WE DON'T GET -1s IN TH3) */
	levelCount = 0;
    memset(worldType, 0, sizeof(worldType));
    memset(mapConfig, 0, sizeof(mapConfig));
    memset(mapWidth,  0, sizeof(mapWidth));
    memset(mapHeight, 0, sizeof(mapHeight));
    memset(mapData,   0, sizeof(mapData));
    memset(mapFlags,  0, sizeof(mapFlags));
    memset(mapFlags2, 0, sizeof(mapFlags2));
}

void loadPack(const char* filename)
{
    FILE* file;
    int i, j, x, y;
    u32 magic;
    u32 fixed;

    /* Open file */
    file = fopen(filename, "rb");
    if (file == NULL)
        return;

    /* Read header */
    fread(&magic, sizeof(magic), 1, file);
    fread(&fixed, sizeof(fixed), 1, file);
    fread(&levelCount, sizeof(levelCount), 1, file);

    /* Validate header */
    if (magic != THP_MAGIC || fixed != THP_FIXED)
    {
        fclose(file);
        return;
    }

    /* Read each level */
    for (i = 0; i < (int)levelCount; i++)
    {
        /* worldType */
        fread(&worldType[i], sizeof(worldType[i]), 1, file);

		printf("WorldType: %hu\n", worldType[i]);

        /* mapConfig 0..6 */
        for (j = 0; j < MAX_CONFIG; j++)
        {
            fread(&mapConfig[i][j], sizeof(mapConfig[i][j]), 1, file);
			printf("MapConfig: %hu\n", mapConfig[i][j]);
        }

        /* width and height */
        fread(&mapWidth[i], sizeof(mapWidth[i]), 1, file);
        fread(&mapHeight[i], sizeof(mapHeight[i]), 1, file);

		printf("MapWidth: %hu\n", mapWidth[i]);
		printf("MapHeight: %hu\n", mapHeight[i]);

        /* Tiles layer 0 */
        for (x = 0; x < (int)mapHeight[i]; x++)
        {
            for (y = 0; y < (int)mapWidth[i]; y++)
            {
                fread(&mapData[i][y][x][0], sizeof(mapData[i][y][x][0]), 1, file);
            }
        }

        /* Objects layer 1 */
        for (x = 0; x < (int)mapHeight[i]; x++)
        {
            for (y = 0; y < (int)mapWidth[i]; y++)
            {
                fread(&mapData[i][y][x][1], sizeof(mapData[i][y][x][1]), 1, file);
            }
        }
    }

    fclose(file);
}

void savePack(const char* filename)
{
    FILE* file;
    int i, j, x, y;
    u16 dmy_u16 = 0;
    u32 magic = TH3_MAGIC;
    u32 fixed = THP_FIXED; /* you used this */

    file = fopen(filename, "wb");
    if (file == NULL)
        return;

    /* Header */
    fwrite(&magic, sizeof(magic), 1, file);
    fwrite(&fixed, sizeof(fixed), 1, file);
    fwrite(&levelCount, sizeof(levelCount), 1, file);

    for (i = 0; i < (int)levelCount; i++)
    {
        /* you force new size */
        mapWidth[i]  = 40;
        mapHeight[i] = 30;
		worldType[i] = 2;

        /* worldType */
        fwrite(&worldType[i], sizeof(worldType[i]), 1, file);

        /* config0 only */
        fwrite(&dmy_u16, sizeof(dmy_u16), 1, file);

        /* dummy width/height */
        fwrite(&dmy_u16, sizeof(dmy_u16), 1, file);
        fwrite(&dmy_u16, sizeof(dmy_u16), 1, file);

        /* Background Flags */
        for (j = 0; j < MAP_FLAG_MAX; j++)
        {
            fwrite(&mapFlags[i][j], sizeof(mapFlags[i][j]), 1, file);
        }

        /* Tiles layer 0 */
        for (x = 0; x < (int)mapHeight[i]; x++)
        {
            for (y = 0; y < (int)mapWidth[i]; y++)
            {
                fwrite(&mapData[i][y][x][0], sizeof(mapData[i][x][y][0]), 1, file);
            }
        }

        /* Objects layer 1 */
        for (x = 0; x < (int)mapHeight[i]; x++)
        {
            for (y = 0; y < (int)mapWidth[i]; y++)
            {
                fwrite(&mapData[i][y][x][1], sizeof(mapData[i][x][y][1]), 1, file);
            }
        }

        /* Flags2 */
        for (j = 0; j < MAP_FLAG2_MAX; j++)
        {
            fwrite(&mapFlags2[i][j], sizeof(mapFlags2[i][j]), 1, file);
        }
    }

    fclose(file);
}

int main()
{
	init();
    loadPack("3.thp");
    savePack("3.th3");
	system("pause");
    return 0;
}