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

# Include any dependencies generated for this target.
include demos/avr01-blink/CMakeFiles/avr01-blink-attiny85.elf.dir/depend.make

# Include the progress variables for this target.
include demos/avr01-blink/CMakeFiles/avr01-blink-attiny85.elf.dir/progress.make

# Include the compile flags for this target's objects.
include demos/avr01-blink/CMakeFiles/avr01-blink-attiny85.elf.dir/flags.make

demos/avr01-blink/CMakeFiles/avr01-blink-attiny85.elf.dir/avr01-blink.c.obj: demos/avr01-blink/CMakeFiles/avr01-blink-attiny85.elf.dir/flags.make
demos/avr01-blink/CMakeFiles/avr01-blink-attiny85.elf.dir/avr01-blink.c.obj: ../demos/avr01-blink/avr01-blink.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/fvera/my_git/avr_cmake_env/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object demos/avr01-blink/CMakeFiles/avr01-blink-attiny85.elf.dir/avr01-blink.c.obj"
	cd /home/fvera/my_git/avr_cmake_env/build/demos/avr01-blink && /usr/bin/avr-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/avr01-blink-attiny85.elf.dir/avr01-blink.c.obj   -c /home/fvera/my_git/avr_cmake_env/demos/avr01-blink/avr01-blink.c

demos/avr01-blink/CMakeFiles/avr01-blink-attiny85.elf.dir/avr01-blink.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/avr01-blink-attiny85.elf.dir/avr01-blink.c.i"
	cd /home/fvera/my_git/avr_cmake_env/build/demos/avr01-blink && /usr/bin/avr-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/fvera/my_git/avr_cmake_env/demos/avr01-blink/avr01-blink.c > CMakeFiles/avr01-blink-attiny85.elf.dir/avr01-blink.c.i

demos/avr01-blink/CMakeFiles/avr01-blink-attiny85.elf.dir/avr01-blink.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/avr01-blink-attiny85.elf.dir/avr01-blink.c.s"
	cd /home/fvera/my_git/avr_cmake_env/build/demos/avr01-blink && /usr/bin/avr-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/fvera/my_git/avr_cmake_env/demos/avr01-blink/avr01-blink.c -o CMakeFiles/avr01-blink-attiny85.elf.dir/avr01-blink.c.s

demos/avr01-blink/CMakeFiles/avr01-blink-attiny85.elf.dir/avr01-blink.c.obj.requires:

.PHONY : demos/avr01-blink/CMakeFiles/avr01-blink-attiny85.elf.dir/avr01-blink.c.obj.requires

demos/avr01-blink/CMakeFiles/avr01-blink-attiny85.elf.dir/avr01-blink.c.obj.provides: demos/avr01-blink/CMakeFiles/avr01-blink-attiny85.elf.dir/avr01-blink.c.obj.requires
	$(MAKE) -f demos/avr01-blink/CMakeFiles/avr01-blink-attiny85.elf.dir/build.make demos/avr01-blink/CMakeFiles/avr01-blink-attiny85.elf.dir/avr01-blink.c.obj.provides.build
.PHONY : demos/avr01-blink/CMakeFiles/avr01-blink-attiny85.elf.dir/avr01-blink.c.obj.provides

demos/avr01-blink/CMakeFiles/avr01-blink-attiny85.elf.dir/avr01-blink.c.obj.provides.build: demos/avr01-blink/CMakeFiles/avr01-blink-attiny85.elf.dir/avr01-blink.c.obj


# Object files for target avr01-blink-attiny85.elf
avr01__blink__attiny85_elf_OBJECTS = \
"CMakeFiles/avr01-blink-attiny85.elf.dir/avr01-blink.c.obj"

# External object files for target avr01-blink-attiny85.elf
avr01__blink__attiny85_elf_EXTERNAL_OBJECTS =

demos/avr01-blink/avr01-blink-attiny85.elf: demos/avr01-blink/CMakeFiles/avr01-blink-attiny85.elf.dir/avr01-blink.c.obj
demos/avr01-blink/avr01-blink-attiny85.elf: demos/avr01-blink/CMakeFiles/avr01-blink-attiny85.elf.dir/build.make
demos/avr01-blink/avr01-blink-attiny85.elf: demos/avr01-blink/CMakeFiles/avr01-blink-attiny85.elf.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/fvera/my_git/avr_cmake_env/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable avr01-blink-attiny85.elf"
	cd /home/fvera/my_git/avr_cmake_env/build/demos/avr01-blink && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/avr01-blink-attiny85.elf.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
demos/avr01-blink/CMakeFiles/avr01-blink-attiny85.elf.dir/build: demos/avr01-blink/avr01-blink-attiny85.elf

.PHONY : demos/avr01-blink/CMakeFiles/avr01-blink-attiny85.elf.dir/build

demos/avr01-blink/CMakeFiles/avr01-blink-attiny85.elf.dir/requires: demos/avr01-blink/CMakeFiles/avr01-blink-attiny85.elf.dir/avr01-blink.c.obj.requires

.PHONY : demos/avr01-blink/CMakeFiles/avr01-blink-attiny85.elf.dir/requires

demos/avr01-blink/CMakeFiles/avr01-blink-attiny85.elf.dir/clean:
	cd /home/fvera/my_git/avr_cmake_env/build/demos/avr01-blink && $(CMAKE_COMMAND) -P CMakeFiles/avr01-blink-attiny85.elf.dir/cmake_clean.cmake
.PHONY : demos/avr01-blink/CMakeFiles/avr01-blink-attiny85.elf.dir/clean

demos/avr01-blink/CMakeFiles/avr01-blink-attiny85.elf.dir/depend:
	cd /home/fvera/my_git/avr_cmake_env/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/fvera/my_git/avr_cmake_env /home/fvera/my_git/avr_cmake_env/demos/avr01-blink /home/fvera/my_git/avr_cmake_env/build /home/fvera/my_git/avr_cmake_env/build/demos/avr01-blink /home/fvera/my_git/avr_cmake_env/build/demos/avr01-blink/CMakeFiles/avr01-blink-attiny85.elf.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : demos/avr01-blink/CMakeFiles/avr01-blink-attiny85.elf.dir/depend

