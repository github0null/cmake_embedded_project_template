#include "main.h"
#include "cmsis_os.h"

/******************** define mem blocks *********************/

/* heap 1, max size: 256KB */
uint8_t ucHeap[configTOTAL_HEAP_SIZE] __at_ram_axi__();

/******************** override 'stdlib' funcs *********************/

#include <stdlib.h>
#include <string.h>

void *__wrap_malloc(size_t size) 
{
    return pvPortMalloc(size);
}

void __wrap_free(void *ptr) 
{
    vPortFree(ptr);
}

void *__wrap_calloc(size_t num, size_t ele_size)
{
    return memset(malloc((num) * (ele_size)), 0, (num) * (ele_size));
}

void *__wrap_realloc(void *ptr, size_t size)
{
    void *nptr = malloc(size);
    memcpy(nptr, ptr, size);
    free(ptr);
    return nptr;
}
