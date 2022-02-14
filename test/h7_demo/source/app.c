#include "app.h"

void task_main(void)
{
    /* init file system */
    drv_fs_init();

    while (1)
    {
#ifdef DEBUG
        HAL_GPIO_TogglePin(LED_E3_GPIO_Port, LED_E3_Pin);
#else
        HAL_GPIO_TogglePin(LED_E3_GPIO_Port, LED_E3_Pin);
#endif // DEBUG
        osDelay(500);
    }
}
