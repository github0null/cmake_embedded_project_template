# CMake embedded project template

## Requirements

- cmake >= 3.20
- ninja
- toolchain: `arm-none-eabi` or `armcc`

> **Recommendation**: Use this template with VsCode and `ms-vscode.cmake-tools` extensions

***

## Build Test Project

- **Build arm-none-eabi gcc test project**

  Write `CMakeLists.txt` with following contents:

  ```cmake
  cmake_minimum_required(VERSION 3.20.0 FATAL_ERROR)

  # Set up compiler and mcu arch 
  set(COMPILER_NAME "arm-none-eabi")
  set(MCU_ARCH_NAME "cortex_m7")
  #set(MCU_MFPU_TYPE "sp") # options: 'sp', 'dp', 'none', 'default'
  #set(TOOLCHAIN_DIR "D:/Keil/ARM/ARMCC/bin") # toolchain root folder for armcc

  # Include toolchain config
  include(${CMAKE_SOURCE_DIR}/cmake/${COMPILER_NAME}/${MCU_ARCH_NAME}.cmake)

  # Set up project name
  set(PRJ_NAME "cmake_project_demo")

  # Set up the project
  project(${PRJ_NAME}
      VERSION "0.1.0"
      LANGUAGES C ASM CXX)

  # Build test project
  add_subdirectory(test/gcc_test)
  ```

  then, execute the following commands to build project:

  ```shell
  cmake -B ./build -G Ninja
  cmake --build ./build --target all -j 14
  ```

- **Build armcc test project**

  Write `CMakeLists.txt` with following contents (**Please set `TOOLCHAIN_DIR` for armcc before build**):

  ```cmake
  cmake_minimum_required(VERSION 3.20.0 FATAL_ERROR)

  # Set up compiler and mcu arch 
  set(COMPILER_NAME "armcc")
  set(MCU_ARCH_NAME "cortex_m3")
  #set(MCU_MFPU_TYPE "sp") # options: 'sp', 'dp', 'none', 'default'
  set(TOOLCHAIN_DIR "D:/Keil/ARM/ARMCC/bin") # toolchain root folder for armcc

  # Include toolchain config
  include(${CMAKE_SOURCE_DIR}/cmake/${COMPILER_NAME}/${MCU_ARCH_NAME}.cmake)

  # Set up project name
  set(PRJ_NAME "cmake_project_demo")

  # Set up the project
  project(${PRJ_NAME}
      VERSION "0.1.0"
      LANGUAGES C ASM CXX)

  # Build test project
  add_subdirectory(test/armcc_test)
  ```

  then, execute the following commands to build project:

  ```shell
  cmake -B ./build -G Ninja
  cmake --build ./build --target all -j 14
  ```