cmake_minimum_required(VERSION 3.20.0 FATAL_ERROR)

# Set up project name
set(PRJ_NAME "cmake_project_demo")

# Set up compiler and mcu arch 
set(COMPILER_NAME "arm-none-eabi")
set(MCU_ARCH_NAME "cortex_m7")
#set(MCU_MFPU_TYPE "sp") # options: 'sp', 'dp', 'none', 'default'

# Set up the project
include(${CMAKE_CURRENT_LIST_DIR}/cmake/${COMPILER_NAME}/${MCU_ARCH_NAME}.cmake)
project(${PRJ_NAME}
    VERSION "0.1.0"
    LANGUAGES C ASM CXX)

# Set up project sources
add_subdirectory(test/h7_demo)
