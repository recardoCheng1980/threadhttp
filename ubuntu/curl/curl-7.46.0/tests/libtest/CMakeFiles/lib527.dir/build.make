# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

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
CMAKE_SOURCE_DIR = /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0

# Include any dependencies generated for this target.
include tests/libtest/CMakeFiles/lib527.dir/depend.make

# Include the progress variables for this target.
include tests/libtest/CMakeFiles/lib527.dir/progress.make

# Include the compile flags for this target's objects.
include tests/libtest/CMakeFiles/lib527.dir/flags.make

tests/libtest/CMakeFiles/lib527.dir/lib526.c.o: tests/libtest/CMakeFiles/lib527.dir/flags.make
tests/libtest/CMakeFiles/lib527.dir/lib526.c.o: tests/libtest/lib526.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object tests/libtest/CMakeFiles/lib527.dir/lib526.c.o"
	cd /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/libtest && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/lib527.dir/lib526.c.o   -c /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/libtest/lib526.c

tests/libtest/CMakeFiles/lib527.dir/lib526.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/lib527.dir/lib526.c.i"
	cd /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/libtest && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/libtest/lib526.c > CMakeFiles/lib527.dir/lib526.c.i

tests/libtest/CMakeFiles/lib527.dir/lib526.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/lib527.dir/lib526.c.s"
	cd /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/libtest && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/libtest/lib526.c -o CMakeFiles/lib527.dir/lib526.c.s

tests/libtest/CMakeFiles/lib527.dir/lib526.c.o.requires:
.PHONY : tests/libtest/CMakeFiles/lib527.dir/lib526.c.o.requires

tests/libtest/CMakeFiles/lib527.dir/lib526.c.o.provides: tests/libtest/CMakeFiles/lib527.dir/lib526.c.o.requires
	$(MAKE) -f tests/libtest/CMakeFiles/lib527.dir/build.make tests/libtest/CMakeFiles/lib527.dir/lib526.c.o.provides.build
.PHONY : tests/libtest/CMakeFiles/lib527.dir/lib526.c.o.provides

tests/libtest/CMakeFiles/lib527.dir/lib526.c.o.provides.build: tests/libtest/CMakeFiles/lib527.dir/lib526.c.o

tests/libtest/CMakeFiles/lib527.dir/first.c.o: tests/libtest/CMakeFiles/lib527.dir/flags.make
tests/libtest/CMakeFiles/lib527.dir/first.c.o: tests/libtest/first.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object tests/libtest/CMakeFiles/lib527.dir/first.c.o"
	cd /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/libtest && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/lib527.dir/first.c.o   -c /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/libtest/first.c

tests/libtest/CMakeFiles/lib527.dir/first.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/lib527.dir/first.c.i"
	cd /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/libtest && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/libtest/first.c > CMakeFiles/lib527.dir/first.c.i

tests/libtest/CMakeFiles/lib527.dir/first.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/lib527.dir/first.c.s"
	cd /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/libtest && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/libtest/first.c -o CMakeFiles/lib527.dir/first.c.s

tests/libtest/CMakeFiles/lib527.dir/first.c.o.requires:
.PHONY : tests/libtest/CMakeFiles/lib527.dir/first.c.o.requires

tests/libtest/CMakeFiles/lib527.dir/first.c.o.provides: tests/libtest/CMakeFiles/lib527.dir/first.c.o.requires
	$(MAKE) -f tests/libtest/CMakeFiles/lib527.dir/build.make tests/libtest/CMakeFiles/lib527.dir/first.c.o.provides.build
.PHONY : tests/libtest/CMakeFiles/lib527.dir/first.c.o.provides

tests/libtest/CMakeFiles/lib527.dir/first.c.o.provides.build: tests/libtest/CMakeFiles/lib527.dir/first.c.o

tests/libtest/CMakeFiles/lib527.dir/testutil.c.o: tests/libtest/CMakeFiles/lib527.dir/flags.make
tests/libtest/CMakeFiles/lib527.dir/testutil.c.o: tests/libtest/testutil.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object tests/libtest/CMakeFiles/lib527.dir/testutil.c.o"
	cd /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/libtest && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/lib527.dir/testutil.c.o   -c /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/libtest/testutil.c

tests/libtest/CMakeFiles/lib527.dir/testutil.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/lib527.dir/testutil.c.i"
	cd /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/libtest && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/libtest/testutil.c > CMakeFiles/lib527.dir/testutil.c.i

tests/libtest/CMakeFiles/lib527.dir/testutil.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/lib527.dir/testutil.c.s"
	cd /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/libtest && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/libtest/testutil.c -o CMakeFiles/lib527.dir/testutil.c.s

tests/libtest/CMakeFiles/lib527.dir/testutil.c.o.requires:
.PHONY : tests/libtest/CMakeFiles/lib527.dir/testutil.c.o.requires

tests/libtest/CMakeFiles/lib527.dir/testutil.c.o.provides: tests/libtest/CMakeFiles/lib527.dir/testutil.c.o.requires
	$(MAKE) -f tests/libtest/CMakeFiles/lib527.dir/build.make tests/libtest/CMakeFiles/lib527.dir/testutil.c.o.provides.build
.PHONY : tests/libtest/CMakeFiles/lib527.dir/testutil.c.o.provides

tests/libtest/CMakeFiles/lib527.dir/testutil.c.o.provides.build: tests/libtest/CMakeFiles/lib527.dir/testutil.c.o

tests/libtest/CMakeFiles/lib527.dir/__/__/lib/warnless.c.o: tests/libtest/CMakeFiles/lib527.dir/flags.make
tests/libtest/CMakeFiles/lib527.dir/__/__/lib/warnless.c.o: lib/warnless.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/CMakeFiles $(CMAKE_PROGRESS_4)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object tests/libtest/CMakeFiles/lib527.dir/__/__/lib/warnless.c.o"
	cd /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/libtest && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/lib527.dir/__/__/lib/warnless.c.o   -c /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/lib/warnless.c

tests/libtest/CMakeFiles/lib527.dir/__/__/lib/warnless.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/lib527.dir/__/__/lib/warnless.c.i"
	cd /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/libtest && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/lib/warnless.c > CMakeFiles/lib527.dir/__/__/lib/warnless.c.i

tests/libtest/CMakeFiles/lib527.dir/__/__/lib/warnless.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/lib527.dir/__/__/lib/warnless.c.s"
	cd /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/libtest && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/lib/warnless.c -o CMakeFiles/lib527.dir/__/__/lib/warnless.c.s

tests/libtest/CMakeFiles/lib527.dir/__/__/lib/warnless.c.o.requires:
.PHONY : tests/libtest/CMakeFiles/lib527.dir/__/__/lib/warnless.c.o.requires

tests/libtest/CMakeFiles/lib527.dir/__/__/lib/warnless.c.o.provides: tests/libtest/CMakeFiles/lib527.dir/__/__/lib/warnless.c.o.requires
	$(MAKE) -f tests/libtest/CMakeFiles/lib527.dir/build.make tests/libtest/CMakeFiles/lib527.dir/__/__/lib/warnless.c.o.provides.build
.PHONY : tests/libtest/CMakeFiles/lib527.dir/__/__/lib/warnless.c.o.provides

tests/libtest/CMakeFiles/lib527.dir/__/__/lib/warnless.c.o.provides.build: tests/libtest/CMakeFiles/lib527.dir/__/__/lib/warnless.c.o

# Object files for target lib527
lib527_OBJECTS = \
"CMakeFiles/lib527.dir/lib526.c.o" \
"CMakeFiles/lib527.dir/first.c.o" \
"CMakeFiles/lib527.dir/testutil.c.o" \
"CMakeFiles/lib527.dir/__/__/lib/warnless.c.o"

# External object files for target lib527
lib527_EXTERNAL_OBJECTS =

tests/libtest/lib527: tests/libtest/CMakeFiles/lib527.dir/lib526.c.o
tests/libtest/lib527: tests/libtest/CMakeFiles/lib527.dir/first.c.o
tests/libtest/lib527: tests/libtest/CMakeFiles/lib527.dir/testutil.c.o
tests/libtest/lib527: tests/libtest/CMakeFiles/lib527.dir/__/__/lib/warnless.c.o
tests/libtest/lib527: tests/libtest/CMakeFiles/lib527.dir/build.make
tests/libtest/lib527: lib/libcurl.so
tests/libtest/lib527: /usr/lib/i386-linux-gnu/libssl.so
tests/libtest/lib527: /usr/lib/i386-linux-gnu/libcrypto.so
tests/libtest/lib527: /usr/lib/i386-linux-gnu/libz.so
tests/libtest/lib527: tests/libtest/CMakeFiles/lib527.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C executable lib527"
	cd /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/libtest && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/lib527.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/libtest/CMakeFiles/lib527.dir/build: tests/libtest/lib527
.PHONY : tests/libtest/CMakeFiles/lib527.dir/build

tests/libtest/CMakeFiles/lib527.dir/requires: tests/libtest/CMakeFiles/lib527.dir/lib526.c.o.requires
tests/libtest/CMakeFiles/lib527.dir/requires: tests/libtest/CMakeFiles/lib527.dir/first.c.o.requires
tests/libtest/CMakeFiles/lib527.dir/requires: tests/libtest/CMakeFiles/lib527.dir/testutil.c.o.requires
tests/libtest/CMakeFiles/lib527.dir/requires: tests/libtest/CMakeFiles/lib527.dir/__/__/lib/warnless.c.o.requires
.PHONY : tests/libtest/CMakeFiles/lib527.dir/requires

tests/libtest/CMakeFiles/lib527.dir/clean:
	cd /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/libtest && $(CMAKE_COMMAND) -P CMakeFiles/lib527.dir/cmake_clean.cmake
.PHONY : tests/libtest/CMakeFiles/lib527.dir/clean

tests/libtest/CMakeFiles/lib527.dir/depend:
	cd /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0 /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/libtest /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0 /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/libtest /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/libtest/CMakeFiles/lib527.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/libtest/CMakeFiles/lib527.dir/depend

