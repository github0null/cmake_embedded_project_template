# Name of the target
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR cortex-m7)

set(MCU_ARCH "cortex_m7")
set(MCU_TOOLCHAIN "gnu")

if("${MCU_MFPU_TYPE}" EQUAL "none")
    set(VFP_FLAGS "-mfloat-abi=soft")
elseif("${MCU_MFPU_TYPE}" EQUAL "sp")
    set(VFP_FLAGS "-mfpu=fpv5-sp-d16 -mfloat-abi=hard")
elseif("${MCU_MFPU_TYPE}" EQUAL "dp")
    set(VFP_FLAGS "-mfpu=fpv5-d16 -mfloat-abi=hard")
else()
    set(VFP_FLAGS "-mfpu=fpv5-d16 -mfloat-abi=softfp")
    message(STATUS "Use default vfp params: ${VFP_FLAGS}")
endif()

set(MCPU_FLAGS "-mthumb -mcpu=cortex-m7")
set(SPEC_FLAGS "--specs=nano.specs --specs=nosys.specs")
# set(LD_FLAGS "-nostartfiles")

include(${CMAKE_CURRENT_LIST_DIR}/toolchain.cmake)