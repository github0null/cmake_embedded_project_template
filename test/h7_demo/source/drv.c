#include "app.h"
#include "fatfs.h"
#include "stdlib.h"

/*************************** sdmmc drv *****************************/

FATFS fs __at_ram_axi__();

void drv_fs_init()
{
    /* mount disk immediately, and check mount status */
    assert_expr(f_mount(&fs, "0:/", 1) == FR_OK);

    /* run some test */
    DIR root;
    FILINFO f_info;
    assert_expr(f_findfirst(&root, &f_info, "0:/", "*.*") == FR_OK);
}
