# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/fvera/cardionomous2/Felipe/cdn-devs/devices/attiny85/programs

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/fvera/cardionomous2/Felipe/cdn-devs/devices/attiny85/programs/build

# Utility rule file for upload_avr01-blink.

# Include the progress variables for this target.
include demos/avr01-blink/CMakeFiles/upload_avr01-blink.dir/progress.make

demos/avr01-blink/CMakeFiles/upload_avr01-blink: demos/avr01-blink/avr01-blink-attiny85.hex
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/fvera/cardionomous2/Felipe/cdn-devs/devices/attiny85/programs/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Uploading avr01-blink-attiny85.hex to attiny85 using stk500v1"
	cd /home/fvera/cardionomous2/Felipe/cdn-devs/devices/attiny85/programs/build/demos/avr01-blink && avrdude -p attiny85 -c stk500v1 -b 19200 -U flash:w:avr01-blink-attiny85.hex -P /dev/ttyACM0 -v

demos/avr01-blink/avr01-blink-attiny85.hex: demos/avr01-blink/avr01-blink-attiny85.elf
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/fvera/cardionomous2/Felipe/cdn-devs/devices/attiny85/programs/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Generating avr01-blink-attiny85.hex"
	cd /home/fvera/cardionomous2/Felipe/cdn-devs/devices/attiny85/programs/build/demos/avr01-blink && /usr/bin/avr-objcopy -j .text -j .data -O ihex avr01-blink-attiny85.elf avr01-blink-attiny85.hex
	cd /home/fvera/cardionomous2/Felipe/cdn-devs/devices/attiny85/programs/build/demos/avr01-blink && /usr/bin/avr-size -C --mcu=attiny85 avr01-blink-attiny85.elf

upload_avr01-blink: demos/avr01-blink/CMakeFiles/upload_avr01-blink
upload_avr01-blink: demos/avr01-blink/avr01-blink-attiny85.hex
upload_avr01-blink: demos/avr01-blink/CMakeFiles/upload_avr01-blink.dir/build.make

.PHONY : upload_avr01-blink

# Rule to build all files generated by this target.
demos/avr01-blink/CMakeFiles/upload_avr01-blink.dir/build: upload_avr01-blink

.PHONY : demos/avr01-blink/CMakeFiles/upload_avr01-blink.dir/build

demos/avr01-blink/CMakeFiles/upload_avr01-blink.dir/clean:
	cd /home/fvera/cardionomous2/Felipe/cdn-devs/devices/attiny85/programs/build/demos/avr01-blink && $(CMAKE_COMMAND) -P CMakeFiles/upload_avr01-blink.dir/cmake_clean.cmake
.PHONY : demos/avr01-blink/CMakeFiles/upload_avr01-blink.dir/clean

demos/avr01-blink/CMakeFiles/upload_avr01-blink.dir/depend:
	cd /home/fvera/cardionomous2/Felipe/cdn-devs/devices/attiny85/programs/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/fvera/cardionomous2/Felipe/cdn-devs/devices/attiny85/programs /home/fvera/cardionomous2/Felipe/cdn-devs/devices/attiny85/programs/demos/avr01-blink /home/fvera/cardionomous2/Felipe/cdn-devs/devices/attiny85/programs/build /home/fvera/cardionomous2/Felipe/cdn-devs/devices/attiny85/programs/build/demos/avr01-blink /home/fvera/cardionomous2/Felipe/cdn-devs/devices/attiny85/programs/build/demos/avr01-blink/CMakeFiles/upload_avr01-blink.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : demos/avr01-blink/CMakeFiles/upload_avr01-blink.dir/depend

