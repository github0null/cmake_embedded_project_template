set(PRJ_NAME "h7_demo")

aux_source_directory(CubeMx_Config/Src CubeMx_SRCS)
aux_source_directory(CubeMx_Config/Drivers/STM32H7xx_HAL_Driver/Src Drivers_SRCS)

aux_source_directory(CubeMx_Config/Middlewares/Third_Party/FatFs/src Fatfs_SRCS)
aux_source_directory(CubeMx_Config/Middlewares/Third_Party/FatFs/src/option Fatfs_SRCS)

aux_source_directory(CubeMx_Config/Middlewares/Third_Party/FreeRTOS/Source FreeRTOS_SRCS)
aux_source_directory(CubeMx_Config/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 FreeRTOS_SRCS)
aux_source_directory(CubeMx_Config/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F FreeRTOS_SRCS)
aux_source_directory(CubeMx_Config/Middlewares/Third_Party/FreeRTOS/Source/portable/MemMang FreeRTOS_SRCS)

aux_source_directory(source Main_SRCS)
aux_source_directory(startup Main_SRCS)

add_executable(${PRJ_NAME}
    ${CubeMx_SRCS}
    ${Drivers_SRCS}
    ${Fatfs_SRCS}
    ${FreeRTOS_SRCS}
    ${Main_SRCS}
    startup/startup_stm32h750xx.s)

target_include_directories(${PRJ_NAME} PUBLIC 
    CubeMx_Config
    CubeMx_Config/Src
    CubeMx_Config/Middlewares/Third_Party/FreeRTOS/Source
    CubeMx_Config/Middlewares/Third_Party/FreeRTOS/Source/portable/MemMang
    CubeMx_Config/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F
    CubeMx_Config/Middlewares/Third_Party/FreeRTOS/Source/include
    CubeMx_Config/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2
    CubeMx_Config/Middlewares/Third_Party/FatFs/src
    CubeMx_Config/Middlewares/Third_Party/FatFs/src/option
    CubeMx_Config/Inc
    CubeMx_Config/Drivers/STM32H7xx_HAL_Driver/Src
    CubeMx_Config/Drivers/STM32H7xx_HAL_Driver/Inc
    CubeMx_Config/Drivers/STM32H7xx_HAL_Driver/Inc/Legacy
    CubeMx_Config/Drivers/CMSIS/Include
    CubeMx_Config/Drivers/CMSIS/Device/ST/STM32H7xx/Include
    source)

target_compile_definitions(${PRJ_NAME} PRIVATE
    USE_FULL_LL_DRIVER
    USE_HAL_DRIVER
    STM32H750xx
    DEBUG)

target_link_options(${PRJ_NAME} PRIVATE
    -T "${CMAKE_CURRENT_LIST_DIR}/startup/STM32H750VB_QSPI_FLASH.ld")

output_binary_files(${PRJ_NAME})