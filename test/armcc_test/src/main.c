/*
 * ************************************************
 * 
 * STM32 blink demo
 * 
 * CPU:     STM32F103C8
 * PIN:     PA1
 * 
 * ************************************************
*/

#include "stm32f10x.h"

#define LED_PERIPH RCC_APB2Periph_GPIOA
#define LED_PORT GPIOA
#define LED_PIN GPIO_Pin_1

void delay(int x)
{
    for (int i = 0; i < x; i++)
    {
        for (int j = 0; j < 1000; j++)
            __NOP();
    }
}

int main()
{
    GPIO_InitTypeDef gpioDef;
    RCC_APB2PeriphClockCmd(LED_PERIPH, ENABLE);
    gpioDef.GPIO_Mode = GPIO_Mode_Out_PP;
    gpioDef.GPIO_Pin = LED_PIN;
    gpioDef.GPIO_Speed = GPIO_Speed_10MHz;
    GPIO_Init(LED_PORT, &gpioDef);

    while (1)
    {
        GPIO_WriteBit(LED_PORT, LED_PIN, (BitAction)!GPIO_ReadInputDataBit(LED_PORT, LED_PIN));
        delay(5000);
    }
}
