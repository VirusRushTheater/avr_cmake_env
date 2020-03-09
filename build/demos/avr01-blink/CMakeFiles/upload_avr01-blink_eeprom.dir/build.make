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
CMAKE_SOURCE_DIR = /home/fvera/my_git/avr_cmake_env

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/fvera/my_git/avr_cmake_env/build

# Utility rule file for upload_avr01-blink_eeprom.

# Include the progress variables for this target.
include demos/avr01-blink/CMakeFiles/upload_avr01-blink_eeprom.dir/progress.make

demos/avr01-blink/CMakeFiles/upload_avr01-blink_eeprom: demos/avr01-blink/avr01-blink-attiny85-eeprom.hex
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/fvera/my_git/avr_cmake_env/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Uploading avr01-blink-attiny85-eeprom.hex to attiny85 using stk500v1"
	cd /home/fvera/my_git/avr_cmake_env/build/demos/avr01-blink && avrdude -p attiny85 -c stk500v1 -b 19200 -U eeprom:w:avr01-blink-attiny85-eeprom.hex -P /dev/ttyACM0 -v

demos/avr01-blink/avr01-blink-attiny85-eeprom.hex: demos/avr01-blink/avr01-blink-attiny85.elf
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/fvera/my_git/avr_cmake_env/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Generating avr01-blink-attiny85-eeprom.hex"
	cd /home/fvera/my_git/avr_cmake_env/build/demos/avr01-blink && /usr/bin/avr-objcopy -j .eeprom --set-section-flags=.eeprom=alloc,load --change-section-lma .eeprom=0 --no-change-warnings -O ihex avr01-blink-attiny85.elf avr01-blink-attiny85-eeprom.hex

upload_avr01-blink_eeprom: demos/avr01-blink/CMakeFiles/upload_avr01-blink_eeprom
upload_avr01-blink_eeprom: demos/avr01-blink/avr01-blink-attiny85-eeprom.hex
upload_avr01-blink_eeprom: demos/avr01-blink/CMakeFiles/upload_avr01-blink_eeprom.dir/build.make

.PHONY : upload_avr01-blink_eeprom

# Rule to build all files generated by this target.
demos/avr01-blink/CMakeFiles/upload_avr01-blink_eeprom.dir/build: upload_avr01-blink_eeprom

.PHONY : demos/avr01-blink/CMakeFiles/upload_avr01-blink_eeprom.dir/build

demos/avr01-blink/CMakeFiles/upload_avr01-blink_eeprom.dir/clean:
	cd /home/fvera/my_git/avr_cmake_env/build/demos/avr01-blink && $(CMAKE_COMMAND) -P CMakeFiles/upload_avr01-blink_eeprom.dir/cmake_clean.cmake
.PHONY : demos/avr01-blink/CMakeFiles/upload_avr01-blink_eeprom.dir/clean

demos/avr01-blink/CMakeFiles/upload_avr01-blink_eeprom.dir/depend:
	cd /home/fvera/my_git/avr_cmake_env/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/fvera/my_git/avr_cmake_env /home/fvera/my_git/avr_cmake_env/demos/avr01-blink /home/fvera/my_git/avr_cmake_env/build /home/fvera/my_git/avr_cmake_env/build/demos/avr01-blink /home/fvera/my_git/avr_cmake_env/build/demos/avr01-blink/CMakeFiles/upload_avr01-blink_eeprom.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : demos/avr01-blink/CMakeFiles/upload_avr01-blink_eeprom.dir/depend

