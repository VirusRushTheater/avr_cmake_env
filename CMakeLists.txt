cmake_minimum_required (VERSION 3.9)

# Use the "include" folder naturally
message (STATUS "PROJECT_SOURCE_DIR: ${CMAKE_CURRENT_SOURCE_DIR}")
include_directories (${CMAKE_CURRENT_SOURCE_DIR}/include)

# Deploy to the base "bin" and "lib" folders.
# set (CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/bin)
# set (CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/lib)
# set (CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/lib)

# Set things for compiling to ARMv7, Linux OS.
set (CMAKE_SYSTEM_NAME          Generic)
set (CMAKE_SYSTEM_PROCESSOR     avr)

# Toolkit variables
# set (TOOLS_DIR                  /usr/bin)
# set (CMAKE_ASM_COMPILER         ${TOOLS_DIR}/avr-as)
# set (CMAKE_C_COMPILER           ${TOOLS_DIR}/avr-gcc)
# set (CMAKE_CXX_COMPILER         ${TOOLS_DIR}/avr-g++)
# set (CMAKE_LINKER               ${TOOLS_DIR}/avr-gcc)

# Variables required by cmake_modules/generic-gcc-avr.cmake
set (AVR_UPLOADTOOL             avrdude)
set (AVR_MCU                    attiny85)
set (AVR_PROGRAMMER             stk500v1)       # Arduino as ISP
set (AVR_UPLOADTOOL_PORT        /dev/ttyACM0)   # USB port
set (F_CPU                      8000000UL)      # CPU freq

# For more info on fuses: http://www.engbedded.com/fusecalc
set (AVR_L_FUSE                 0xe2)
set (AVR_H_FUSE                 0xdf)

# Programmer options
set (AVR_UPLOADTOOL_BAUDRATE    19200)

# AVR libraries
set (AVR_TOOLKITS               /usr/lib/avr)
include_directories (${AVR_TOOLKITS}/include)

# Include everything in the cmake-modules folder
include ("${CMAKE_SOURCE_DIR}/cmake-modules/generic-gcc-avr.cmake")

project (attiny_programs)

# Compiler definitions: CPU type, CPU freq (for delays), programmer bauds
# and warnings
# add_definitions("-Os")                  # Necessary for "delays" to work properly.
# add_definitions("-DF_CPU=${F_CPU}")     # idem
# add_definitions("-mmcu=${AVR_MCU}")
# add_definitions("-DBAUD=${PRG_BAUD}")
# add_definitions("-Wall")

# Recurse to the shared library...
add_subdirectory (src)

# And executables.
add_subdirectory (demos)