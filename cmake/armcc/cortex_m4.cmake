# Name of the target
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR cortex-m4)

if("${MCU_MFPU_TYPE}" STREQUAL "none")
    set(MCPU_FLAGS "--cpu Cortex-M4 --fpu=SoftVFP")
elseif("${MCU_MFPU_TYPE}" STREQUAL "sp")
    set(MCPU_FLAGS "--cpu Cortex-M4.fp")
else()
    set(MCPU_FLAGS "--cpu Cortex-M4.fp")
    message(STATUS "Use default vfp params: ${MCPU_FLAGS}")
endif()

include(${CMAKE_CURRENT_LIST_DIR}/toolchain.cmake)
