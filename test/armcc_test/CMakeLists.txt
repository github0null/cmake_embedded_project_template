set(PRJ_NAME "f1_demo")

aux_source_directory(hal/STM32F10x_StdPeriph_Driver Drivers_SRCS)
aux_source_directory(hal/STM32F10x_StdPeriph_Driver/src Drivers_SRCS)
aux_source_directory(src Main_SRCS)

add_executable(${PRJ_NAME}
    ${Drivers_SRCS}
    ${Main_SRCS}
    src/startup_stm32f10x_md.s)

target_include_directories(${PRJ_NAME} PUBLIC 
    hal/STM32F10x_StdPeriph_Driver
    hal/STM32F10x_StdPeriph_Driver/inc
    lib/cmsis
    src)

target_compile_definitions(${PRJ_NAME} PRIVATE
    USE_STDPERIPH_DRIVER
    STM32F10X_MD)

target_link_options(${PRJ_NAME} PRIVATE
    --scatter "${CMAKE_CURRENT_LIST_DIR}/linker_script.sct"
    --list "${CMAKE_BINARY_DIR}/${PRJ_NAME}.map")

output_binary_files(${PRJ_NAME})