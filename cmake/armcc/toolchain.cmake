# Toolchain settings
if(CMAKE_HOST_WIN32)
    if("${TOOLCHAIN_DIR}_" STREQUAL "_")
        message(FATAL_ERROR "Please set armcc toolchain path by 'set(TOOLCHAIN_DIR \"xxx\")'")   
    else()
        message(STATUS "armcc path: '${TOOLCHAIN_DIR}'")
    endif()
    set(CMAKE_C_COMPILER    "${TOOLCHAIN_DIR}/armcc.exe")
    set(CMAKE_CXX_COMPILER  "${TOOLCHAIN_DIR}/armcc.exe")
    set(AS                  "${TOOLCHAIN_DIR}/armasm.exe")
    set(AR                  "${TOOLCHAIN_DIR}/armar.exe")
    set(LD                  "${TOOLCHAIN_DIR}/armlink.exe")
    set(OBJCOPY             "${TOOLCHAIN_DIR}/fromelf.exe")
else()
    set(CMAKE_C_COMPILER    "${TOOLCHAIN_DIR}/armcc")
    set(CMAKE_CXX_COMPILER  "${TOOLCHAIN_DIR}/armcc")
    set(AS                  "${TOOLCHAIN_DIR}/armasm")
    set(AR                  "${TOOLCHAIN_DIR}/armar")
    set(LD                  "${TOOLCHAIN_DIR}/armlink")
    set(OBJCOPY             "${TOOLCHAIN_DIR}/fromelf")
endif()

set(CMAKE_C_COMPILER_WORKS TRUE)
set(CMAKE_CXX_COMPILER_WORKS TRUE)

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

# this makes the test compiles use static library option so that we don't need to pre-set linker flags and scripts
#set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

set(CMAKE_C_FLAGS   "-c --apcs=interwork ${MCPU_FLAGS} ${VFP_FLAGS} --c99 --split_sections --diag_suppress=1 --diag_suppress=1295" CACHE INTERNAL "c compiler flags")
set(CMAKE_CXX_FLAGS "-c --cpp --apcs=interwork ${MCPU_FLAGS} ${VFP_FLAGS} --split_sections --diag_suppress=1 --diag_suppress=1295" CACHE INTERNAL "cxx compiler flags")
set(CMAKE_ASM_FLAGS "-c --apcs=interwork ${MCPU_FLAGS} ${VFP_FLAGS}" CACHE INTERNAL "asm compiler flags")
set(CMAKE_EXE_LINKER_FLAGS "${MCPU_FLAGS} --strict --summary_stderr --info summarysizes --map --xref --callgraph --symbols --info sizes --info totals --info unused --info veneers" CACHE INTERNAL "exe link flags")

SET(CMAKE_C_FLAGS_DEBUG "-O0 -g" CACHE INTERNAL "c debug compiler flags")
SET(CMAKE_CXX_FLAGS_DEBUG "-O0 -g" CACHE INTERNAL "cxx debug compiler flags")
SET(CMAKE_ASM_FLAGS_DEBUG "-O0 -g" CACHE INTERNAL "asm debug compiler flags")

SET(CMAKE_C_FLAGS_RELEASE "-O2" CACHE INTERNAL "c release compiler flags")
SET(CMAKE_CXX_FLAGS_RELEASE "-O2" CACHE INTERNAL "cxx release compiler flags")
SET(CMAKE_ASM_FLAGS_RELEASE "" CACHE INTERNAL "asm release compiler flags")

#
# some utility functions
#
function(output_binary_files target_name)    
    add_custom_command(TARGET "${target_name}" POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E echo "output hex, s19, bin ..."
        COMMAND ${OBJCOPY} --i32combined --output "${target_name}.hex" "${target_name}.elf"
        COMMAND ${OBJCOPY} --m32combined --output "${target_name}.s19" "${target_name}.elf"
        COMMAND ${OBJCOPY} --bincombined --output "${target_name}.bin" "${target_name}.elf"
        WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
        VERBATIM)
endfunction()
