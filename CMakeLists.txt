cmake_minimum_required(VERSION 3.20.0 FATAL_ERROR)

# Set up compiler and mcu arch 
set(COMPILER_TYPE "arm-none-eabi") # options: 'armcc' or 'arm-none-eabi'
set(MCU_ARCH_TYPE "cortex_m7") # options: 'cortex_m0', 'cortex_m3' ...
set(MCU_MFPU_TYPE "default") # options: 'sp', 'dp', 'none', 'default'

# Include toolchain config
include(${CMAKE_SOURCE_DIR}/cmake/${COMPILER_TYPE}/${MCU_ARCH_TYPE}.cmake)

# Set up project name
set(PRJ_NAME "cmake_project_demo")

# Set up the project
project(${PRJ_NAME}
    VERSION "0.1.0"
    LANGUAGES C ASM CXX)

# Build test project
#add_subdirectory(test/armcc_test)
add_subdirectory(test/gcc_test)
