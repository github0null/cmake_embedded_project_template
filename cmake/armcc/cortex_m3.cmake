# Name of the target
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR cortex-m3)

set(MCU_ARCH "cortex_m3")
set(MCU_TOOLCHAIN "armcc")

set(MCPU_FLAGS "--cpu Cortex-M3")
set(VFP_FLAGS "")

include(${CMAKE_CURRENT_LIST_DIR}/toolchain.cmake)
