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
include tests/server/CMakeFiles/sws.dir/depend.make

# Include the progress variables for this target.
include tests/server/CMakeFiles/sws.dir/progress.make

# Include the compile flags for this target's objects.
include tests/server/CMakeFiles/sws.dir/flags.make

tests/server/CMakeFiles/sws.dir/__/__/lib/mprintf.c.o: tests/server/CMakeFiles/sws.dir/flags.make
tests/server/CMakeFiles/sws.dir/__/__/lib/mprintf.c.o: lib/mprintf.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object tests/server/CMakeFiles/sws.dir/__/__/lib/mprintf.c.o"
	cd /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/server && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/sws.dir/__/__/lib/mprintf.c.o   -c /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/lib/mprintf.c

tests/server/CMakeFiles/sws.dir/__/__/lib/mprintf.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/sws.dir/__/__/lib/mprintf.c.i"
	cd /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/server && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/lib/mprintf.c > CMakeFiles/sws.dir/__/__/lib/mprintf.c.i

tests/server/CMakeFiles/sws.dir/__/__/lib/mprintf.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/sws.dir/__/__/lib/mprintf.c.s"
	cd /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/server && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/lib/mprintf.c -o CMakeFiles/sws.dir/__/__/lib/mprintf.c.s

tests/server/CMakeFiles/sws.dir/__/__/lib/mprintf.c.o.requires:
.PHONY : tests/server/CMakeFiles/sws.dir/__/__/lib/mprintf.c.o.requires

tests/server/CMakeFiles/sws.dir/__/__/lib/mprintf.c.o.provides: tests/server/CMakeFiles/sws.dir/__/__/lib/mprintf.c.o.requires
	$(MAKE) -f tests/server/CMakeFiles/sws.dir/build.make tests/server/CMakeFiles/sws.dir/__/__/lib/mprintf.c.o.provides.build
.PHONY : tests/server/CMakeFiles/sws.dir/__/__/lib/mprintf.c.o.provides

tests/server/CMakeFiles/sws.dir/__/__/lib/mprintf.c.o.provides.build: tests/server/CMakeFiles/sws.dir/__/__/lib/mprintf.c.o

tests/server/CMakeFiles/sws.dir/__/__/lib/nonblock.c.o: tests/server/CMakeFiles/sws.dir/flags.make
tests/server/CMakeFiles/sws.dir/__/__/lib/nonblock.c.o: lib/nonblock.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object tests/server/CMakeFiles/sws.dir/__/__/lib/nonblock.c.o"
	cd /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/server && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/sws.dir/__/__/lib/nonblock.c.o   -c /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/lib/nonblock.c

tests/server/CMakeFiles/sws.dir/__/__/lib/nonblock.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/sws.dir/__/__/lib/nonblock.c.i"
	cd /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/server && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/lib/nonblock.c > CMakeFiles/sws.dir/__/__/lib/nonblock.c.i

tests/server/CMakeFiles/sws.dir/__/__/lib/nonblock.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/sws.dir/__/__/lib/nonblock.c.s"
	cd /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/server && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/lib/nonblock.c -o CMakeFiles/sws.dir/__/__/lib/nonblock.c.s

tests/server/CMakeFiles/sws.dir/__/__/lib/nonblock.c.o.requires:
.PHONY : tests/server/CMakeFiles/sws.dir/__/__/lib/nonblock.c.o.requires

tests/server/CMakeFiles/sws.dir/__/__/lib/nonblock.c.o.provides: tests/server/CMakeFiles/sws.dir/__/__/lib/nonblock.c.o.requires
	$(MAKE) -f tests/server/CMakeFiles/sws.dir/build.make tests/server/CMakeFiles/sws.dir/__/__/lib/nonblock.c.o.provides.build
.PHONY : tests/server/CMakeFiles/sws.dir/__/__/lib/nonblock.c.o.provides

tests/server/CMakeFiles/sws.dir/__/__/lib/nonblock.c.o.provides.build: tests/server/CMakeFiles/sws.dir/__/__/lib/nonblock.c.o

tests/server/CMakeFiles/sws.dir/__/__/lib/strequal.c.o: tests/server/CMakeFiles/sws.dir/flags.make
tests/server/CMakeFiles/sws.dir/__/__/lib/strequal.c.o: lib/strequal.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object tests/server/CMakeFiles/sws.dir/__/__/lib/strequal.c.o"
	cd /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/server && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/sws.dir/__/__/lib/strequal.c.o   -c /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/lib/strequal.c

tests/server/CMakeFiles/sws.dir/__/__/lib/strequal.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/sws.dir/__/__/lib/strequal.c.i"
	cd /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/server && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/lib/strequal.c > CMakeFiles/sws.dir/__/__/lib/strequal.c.i

tests/server/CMakeFiles/sws.dir/__/__/lib/strequal.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/sws.dir/__/__/lib/strequal.c.s"
	cd /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/server && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/lib/strequal.c -o CMakeFiles/sws.dir/__/__/lib/strequal.c.s

tests/server/CMakeFiles/sws.dir/__/__/lib/strequal.c.o.requires:
.PHONY : tests/server/CMakeFiles/sws.dir/__/__/lib/strequal.c.o.requires

tests/server/CMakeFiles/sws.dir/__/__/lib/strequal.c.o.provides: tests/server/CMakeFiles/sws.dir/__/__/lib/strequal.c.o.requires
	$(MAKE) -f tests/server/CMakeFiles/sws.dir/build.make tests/server/CMakeFiles/sws.dir/__/__/lib/strequal.c.o.provides.build
.PHONY : tests/server/CMakeFiles/sws.dir/__/__/lib/strequal.c.o.provides

tests/server/CMakeFiles/sws.dir/__/__/lib/strequal.c.o.provides.build: tests/server/CMakeFiles/sws.dir/__/__/lib/strequal.c.o

tests/server/CMakeFiles/sws.dir/__/__/lib/strtoofft.c.o: tests/server/CMakeFiles/sws.dir/flags.make
tests/server/CMakeFiles/sws.dir/__/__/lib/strtoofft.c.o: lib/strtoofft.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/CMakeFiles $(CMAKE_PROGRESS_4)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object tests/server/CMakeFiles/sws.dir/__/__/lib/strtoofft.c.o"
	cd /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/server && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/sws.dir/__/__/lib/strtoofft.c.o   -c /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/lib/strtoofft.c

tests/server/CMakeFiles/sws.dir/__/__/lib/strtoofft.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/sws.dir/__/__/lib/strtoofft.c.i"
	cd /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/server && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/lib/strtoofft.c > CMakeFiles/sws.dir/__/__/lib/strtoofft.c.i

tests/server/CMakeFiles/sws.dir/__/__/lib/strtoofft.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/sws.dir/__/__/lib/strtoofft.c.s"
	cd /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/server && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/lib/strtoofft.c -o CMakeFiles/sws.dir/__/__/lib/strtoofft.c.s

tests/server/CMakeFiles/sws.dir/__/__/lib/strtoofft.c.o.requires:
.PHONY : tests/server/CMakeFiles/sws.dir/__/__/lib/strtoofft.c.o.requires

tests/server/CMakeFiles/sws.dir/__/__/lib/strtoofft.c.o.provides: tests/server/CMakeFiles/sws.dir/__/__/lib/strtoofft.c.o.requires
	$(MAKE) -f tests/server/CMakeFiles/sws.dir/build.make tests/server/CMakeFiles/sws.dir/__/__/lib/strtoofft.c.o.provides.build
.PHONY : tests/server/CMakeFiles/sws.dir/__/__/lib/strtoofft.c.o.provides

tests/server/CMakeFiles/sws.dir/__/__/lib/strtoofft.c.o.provides.build: tests/server/CMakeFiles/sws.dir/__/__/lib/strtoofft.c.o

tests/server/CMakeFiles/sws.dir/__/__/lib/timeval.c.o: tests/server/CMakeFiles/sws.dir/flags.make
tests/server/CMakeFiles/sws.dir/__/__/lib/timeval.c.o: lib/timeval.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/CMakeFiles $(CMAKE_PROGRESS_5)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object tests/server/CMakeFiles/sws.dir/__/__/lib/timeval.c.o"
	cd /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/server && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/sws.dir/__/__/lib/timeval.c.o   -c /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/lib/timeval.c

tests/server/CMakeFiles/sws.dir/__/__/lib/timeval.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/sws.dir/__/__/lib/timeval.c.i"
	cd /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/server && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/lib/timeval.c > CMakeFiles/sws.dir/__/__/lib/timeval.c.i

tests/server/CMakeFiles/sws.dir/__/__/lib/timeval.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/sws.dir/__/__/lib/timeval.c.s"
	cd /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/server && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/lib/timeval.c -o CMakeFiles/sws.dir/__/__/lib/timeval.c.s

tests/server/CMakeFiles/sws.dir/__/__/lib/timeval.c.o.requires:
.PHONY : tests/server/CMakeFiles/sws.dir/__/__/lib/timeval.c.o.requires

tests/server/CMakeFiles/sws.dir/__/__/lib/timeval.c.o.provides: tests/server/CMakeFiles/sws.dir/__/__/lib/timeval.c.o.requires
	$(MAKE) -f tests/server/CMakeFiles/sws.dir/build.make tests/server/CMakeFiles/sws.dir/__/__/lib/timeval.c.o.provides.build
.PHONY : tests/server/CMakeFiles/sws.dir/__/__/lib/timeval.c.o.provides

tests/server/CMakeFiles/sws.dir/__/__/lib/timeval.c.o.provides.build: tests/server/CMakeFiles/sws.dir/__/__/lib/timeval.c.o

tests/server/CMakeFiles/sws.dir/__/__/lib/warnless.c.o: tests/server/CMakeFiles/sws.dir/flags.make
tests/server/CMakeFiles/sws.dir/__/__/lib/warnless.c.o: lib/warnless.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/CMakeFiles $(CMAKE_PROGRESS_6)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object tests/server/CMakeFiles/sws.dir/__/__/lib/warnless.c.o"
	cd /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/server && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/sws.dir/__/__/lib/warnless.c.o   -c /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/lib/warnless.c

tests/server/CMakeFiles/sws.dir/__/__/lib/warnless.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/sws.dir/__/__/lib/warnless.c.i"
	cd /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/server && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/lib/warnless.c > CMakeFiles/sws.dir/__/__/lib/warnless.c.i

tests/server/CMakeFiles/sws.dir/__/__/lib/warnless.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/sws.dir/__/__/lib/warnless.c.s"
	cd /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/server && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/lib/warnless.c -o CMakeFiles/sws.dir/__/__/lib/warnless.c.s

tests/server/CMakeFiles/sws.dir/__/__/lib/warnless.c.o.requires:
.PHONY : tests/server/CMakeFiles/sws.dir/__/__/lib/warnless.c.o.requires

tests/server/CMakeFiles/sws.dir/__/__/lib/warnless.c.o.provides: tests/server/CMakeFiles/sws.dir/__/__/lib/warnless.c.o.requires
	$(MAKE) -f tests/server/CMakeFiles/sws.dir/build.make tests/server/CMakeFiles/sws.dir/__/__/lib/warnless.c.o.provides.build
.PHONY : tests/server/CMakeFiles/sws.dir/__/__/lib/warnless.c.o.provides

tests/server/CMakeFiles/sws.dir/__/__/lib/warnless.c.o.provides.build: tests/server/CMakeFiles/sws.dir/__/__/lib/warnless.c.o

tests/server/CMakeFiles/sws.dir/getpart.c.o: tests/server/CMakeFiles/sws.dir/flags.make
tests/server/CMakeFiles/sws.dir/getpart.c.o: tests/server/getpart.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/CMakeFiles $(CMAKE_PROGRESS_7)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object tests/server/CMakeFiles/sws.dir/getpart.c.o"
	cd /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/server && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/sws.dir/getpart.c.o   -c /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/server/getpart.c

tests/server/CMakeFiles/sws.dir/getpart.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/sws.dir/getpart.c.i"
	cd /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/server && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/server/getpart.c > CMakeFiles/sws.dir/getpart.c.i

tests/server/CMakeFiles/sws.dir/getpart.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/sws.dir/getpart.c.s"
	cd /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/server && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/server/getpart.c -o CMakeFiles/sws.dir/getpart.c.s

tests/server/CMakeFiles/sws.dir/getpart.c.o.requires:
.PHONY : tests/server/CMakeFiles/sws.dir/getpart.c.o.requires

tests/server/CMakeFiles/sws.dir/getpart.c.o.provides: tests/server/CMakeFiles/sws.dir/getpart.c.o.requires
	$(MAKE) -f tests/server/CMakeFiles/sws.dir/build.make tests/server/CMakeFiles/sws.dir/getpart.c.o.provides.build
.PHONY : tests/server/CMakeFiles/sws.dir/getpart.c.o.provides

tests/server/CMakeFiles/sws.dir/getpart.c.o.provides.build: tests/server/CMakeFiles/sws.dir/getpart.c.o

tests/server/CMakeFiles/sws.dir/__/__/lib/base64.c.o: tests/server/CMakeFiles/sws.dir/flags.make
tests/server/CMakeFiles/sws.dir/__/__/lib/base64.c.o: lib/base64.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/CMakeFiles $(CMAKE_PROGRESS_8)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object tests/server/CMakeFiles/sws.dir/__/__/lib/base64.c.o"
	cd /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/server && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/sws.dir/__/__/lib/base64.c.o   -c /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/lib/base64.c

tests/server/CMakeFiles/sws.dir/__/__/lib/base64.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/sws.dir/__/__/lib/base64.c.i"
	cd /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/server && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/lib/base64.c > CMakeFiles/sws.dir/__/__/lib/base64.c.i

tests/server/CMakeFiles/sws.dir/__/__/lib/base64.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/sws.dir/__/__/lib/base64.c.s"
	cd /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/server && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/lib/base64.c -o CMakeFiles/sws.dir/__/__/lib/base64.c.s

tests/server/CMakeFiles/sws.dir/__/__/lib/base64.c.o.requires:
.PHONY : tests/server/CMakeFiles/sws.dir/__/__/lib/base64.c.o.requires

tests/server/CMakeFiles/sws.dir/__/__/lib/base64.c.o.provides: tests/server/CMakeFiles/sws.dir/__/__/lib/base64.c.o.requires
	$(MAKE) -f tests/server/CMakeFiles/sws.dir/build.make tests/server/CMakeFiles/sws.dir/__/__/lib/base64.c.o.provides.build
.PHONY : tests/server/CMakeFiles/sws.dir/__/__/lib/base64.c.o.provides

tests/server/CMakeFiles/sws.dir/__/__/lib/base64.c.o.provides.build: tests/server/CMakeFiles/sws.dir/__/__/lib/base64.c.o

tests/server/CMakeFiles/sws.dir/__/__/lib/memdebug.c.o: tests/server/CMakeFiles/sws.dir/flags.make
tests/server/CMakeFiles/sws.dir/__/__/lib/memdebug.c.o: lib/memdebug.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/CMakeFiles $(CMAKE_PROGRESS_9)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object tests/server/CMakeFiles/sws.dir/__/__/lib/memdebug.c.o"
	cd /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/server && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/sws.dir/__/__/lib/memdebug.c.o   -c /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/lib/memdebug.c

tests/server/CMakeFiles/sws.dir/__/__/lib/memdebug.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/sws.dir/__/__/lib/memdebug.c.i"
	cd /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/server && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/lib/memdebug.c > CMakeFiles/sws.dir/__/__/lib/memdebug.c.i

tests/server/CMakeFiles/sws.dir/__/__/lib/memdebug.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/sws.dir/__/__/lib/memdebug.c.s"
	cd /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/server && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/lib/memdebug.c -o CMakeFiles/sws.dir/__/__/lib/memdebug.c.s

tests/server/CMakeFiles/sws.dir/__/__/lib/memdebug.c.o.requires:
.PHONY : tests/server/CMakeFiles/sws.dir/__/__/lib/memdebug.c.o.requires

tests/server/CMakeFiles/sws.dir/__/__/lib/memdebug.c.o.provides: tests/server/CMakeFiles/sws.dir/__/__/lib/memdebug.c.o.requires
	$(MAKE) -f tests/server/CMakeFiles/sws.dir/build.make tests/server/CMakeFiles/sws.dir/__/__/lib/memdebug.c.o.provides.build
.PHONY : tests/server/CMakeFiles/sws.dir/__/__/lib/memdebug.c.o.provides

tests/server/CMakeFiles/sws.dir/__/__/lib/memdebug.c.o.provides.build: tests/server/CMakeFiles/sws.dir/__/__/lib/memdebug.c.o

tests/server/CMakeFiles/sws.dir/util.c.o: tests/server/CMakeFiles/sws.dir/flags.make
tests/server/CMakeFiles/sws.dir/util.c.o: tests/server/util.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/CMakeFiles $(CMAKE_PROGRESS_10)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object tests/server/CMakeFiles/sws.dir/util.c.o"
	cd /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/server && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/sws.dir/util.c.o   -c /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/server/util.c

tests/server/CMakeFiles/sws.dir/util.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/sws.dir/util.c.i"
	cd /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/server && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/server/util.c > CMakeFiles/sws.dir/util.c.i

tests/server/CMakeFiles/sws.dir/util.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/sws.dir/util.c.s"
	cd /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/server && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/server/util.c -o CMakeFiles/sws.dir/util.c.s

tests/server/CMakeFiles/sws.dir/util.c.o.requires:
.PHONY : tests/server/CMakeFiles/sws.dir/util.c.o.requires

tests/server/CMakeFiles/sws.dir/util.c.o.provides: tests/server/CMakeFiles/sws.dir/util.c.o.requires
	$(MAKE) -f tests/server/CMakeFiles/sws.dir/build.make tests/server/CMakeFiles/sws.dir/util.c.o.provides.build
.PHONY : tests/server/CMakeFiles/sws.dir/util.c.o.provides

tests/server/CMakeFiles/sws.dir/util.c.o.provides.build: tests/server/CMakeFiles/sws.dir/util.c.o

tests/server/CMakeFiles/sws.dir/sws.c.o: tests/server/CMakeFiles/sws.dir/flags.make
tests/server/CMakeFiles/sws.dir/sws.c.o: tests/server/sws.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/CMakeFiles $(CMAKE_PROGRESS_11)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object tests/server/CMakeFiles/sws.dir/sws.c.o"
	cd /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/server && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/sws.dir/sws.c.o   -c /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/server/sws.c

tests/server/CMakeFiles/sws.dir/sws.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/sws.dir/sws.c.i"
	cd /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/server && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/server/sws.c > CMakeFiles/sws.dir/sws.c.i

tests/server/CMakeFiles/sws.dir/sws.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/sws.dir/sws.c.s"
	cd /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/server && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/server/sws.c -o CMakeFiles/sws.dir/sws.c.s

tests/server/CMakeFiles/sws.dir/sws.c.o.requires:
.PHONY : tests/server/CMakeFiles/sws.dir/sws.c.o.requires

tests/server/CMakeFiles/sws.dir/sws.c.o.provides: tests/server/CMakeFiles/sws.dir/sws.c.o.requires
	$(MAKE) -f tests/server/CMakeFiles/sws.dir/build.make tests/server/CMakeFiles/sws.dir/sws.c.o.provides.build
.PHONY : tests/server/CMakeFiles/sws.dir/sws.c.o.provides

tests/server/CMakeFiles/sws.dir/sws.c.o.provides.build: tests/server/CMakeFiles/sws.dir/sws.c.o

tests/server/CMakeFiles/sws.dir/__/__/lib/inet_pton.c.o: tests/server/CMakeFiles/sws.dir/flags.make
tests/server/CMakeFiles/sws.dir/__/__/lib/inet_pton.c.o: lib/inet_pton.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/CMakeFiles $(CMAKE_PROGRESS_12)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object tests/server/CMakeFiles/sws.dir/__/__/lib/inet_pton.c.o"
	cd /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/server && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/sws.dir/__/__/lib/inet_pton.c.o   -c /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/lib/inet_pton.c

tests/server/CMakeFiles/sws.dir/__/__/lib/inet_pton.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/sws.dir/__/__/lib/inet_pton.c.i"
	cd /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/server && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/lib/inet_pton.c > CMakeFiles/sws.dir/__/__/lib/inet_pton.c.i

tests/server/CMakeFiles/sws.dir/__/__/lib/inet_pton.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/sws.dir/__/__/lib/inet_pton.c.s"
	cd /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/server && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/lib/inet_pton.c -o CMakeFiles/sws.dir/__/__/lib/inet_pton.c.s

tests/server/CMakeFiles/sws.dir/__/__/lib/inet_pton.c.o.requires:
.PHONY : tests/server/CMakeFiles/sws.dir/__/__/lib/inet_pton.c.o.requires

tests/server/CMakeFiles/sws.dir/__/__/lib/inet_pton.c.o.provides: tests/server/CMakeFiles/sws.dir/__/__/lib/inet_pton.c.o.requires
	$(MAKE) -f tests/server/CMakeFiles/sws.dir/build.make tests/server/CMakeFiles/sws.dir/__/__/lib/inet_pton.c.o.provides.build
.PHONY : tests/server/CMakeFiles/sws.dir/__/__/lib/inet_pton.c.o.provides

tests/server/CMakeFiles/sws.dir/__/__/lib/inet_pton.c.o.provides.build: tests/server/CMakeFiles/sws.dir/__/__/lib/inet_pton.c.o

# Object files for target sws
sws_OBJECTS = \
"CMakeFiles/sws.dir/__/__/lib/mprintf.c.o" \
"CMakeFiles/sws.dir/__/__/lib/nonblock.c.o" \
"CMakeFiles/sws.dir/__/__/lib/strequal.c.o" \
"CMakeFiles/sws.dir/__/__/lib/strtoofft.c.o" \
"CMakeFiles/sws.dir/__/__/lib/timeval.c.o" \
"CMakeFiles/sws.dir/__/__/lib/warnless.c.o" \
"CMakeFiles/sws.dir/getpart.c.o" \
"CMakeFiles/sws.dir/__/__/lib/base64.c.o" \
"CMakeFiles/sws.dir/__/__/lib/memdebug.c.o" \
"CMakeFiles/sws.dir/util.c.o" \
"CMakeFiles/sws.dir/sws.c.o" \
"CMakeFiles/sws.dir/__/__/lib/inet_pton.c.o"

# External object files for target sws
sws_EXTERNAL_OBJECTS =

tests/server/sws: tests/server/CMakeFiles/sws.dir/__/__/lib/mprintf.c.o
tests/server/sws: tests/server/CMakeFiles/sws.dir/__/__/lib/nonblock.c.o
tests/server/sws: tests/server/CMakeFiles/sws.dir/__/__/lib/strequal.c.o
tests/server/sws: tests/server/CMakeFiles/sws.dir/__/__/lib/strtoofft.c.o
tests/server/sws: tests/server/CMakeFiles/sws.dir/__/__/lib/timeval.c.o
tests/server/sws: tests/server/CMakeFiles/sws.dir/__/__/lib/warnless.c.o
tests/server/sws: tests/server/CMakeFiles/sws.dir/getpart.c.o
tests/server/sws: tests/server/CMakeFiles/sws.dir/__/__/lib/base64.c.o
tests/server/sws: tests/server/CMakeFiles/sws.dir/__/__/lib/memdebug.c.o
tests/server/sws: tests/server/CMakeFiles/sws.dir/util.c.o
tests/server/sws: tests/server/CMakeFiles/sws.dir/sws.c.o
tests/server/sws: tests/server/CMakeFiles/sws.dir/__/__/lib/inet_pton.c.o
tests/server/sws: tests/server/CMakeFiles/sws.dir/build.make
tests/server/sws: /usr/lib/i386-linux-gnu/libssl.so
tests/server/sws: /usr/lib/i386-linux-gnu/libcrypto.so
tests/server/sws: /usr/lib/i386-linux-gnu/libz.so
tests/server/sws: tests/server/CMakeFiles/sws.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C executable sws"
	cd /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/server && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/sws.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/server/CMakeFiles/sws.dir/build: tests/server/sws
.PHONY : tests/server/CMakeFiles/sws.dir/build

tests/server/CMakeFiles/sws.dir/requires: tests/server/CMakeFiles/sws.dir/__/__/lib/mprintf.c.o.requires
tests/server/CMakeFiles/sws.dir/requires: tests/server/CMakeFiles/sws.dir/__/__/lib/nonblock.c.o.requires
tests/server/CMakeFiles/sws.dir/requires: tests/server/CMakeFiles/sws.dir/__/__/lib/strequal.c.o.requires
tests/server/CMakeFiles/sws.dir/requires: tests/server/CMakeFiles/sws.dir/__/__/lib/strtoofft.c.o.requires
tests/server/CMakeFiles/sws.dir/requires: tests/server/CMakeFiles/sws.dir/__/__/lib/timeval.c.o.requires
tests/server/CMakeFiles/sws.dir/requires: tests/server/CMakeFiles/sws.dir/__/__/lib/warnless.c.o.requires
tests/server/CMakeFiles/sws.dir/requires: tests/server/CMakeFiles/sws.dir/getpart.c.o.requires
tests/server/CMakeFiles/sws.dir/requires: tests/server/CMakeFiles/sws.dir/__/__/lib/base64.c.o.requires
tests/server/CMakeFiles/sws.dir/requires: tests/server/CMakeFiles/sws.dir/__/__/lib/memdebug.c.o.requires
tests/server/CMakeFiles/sws.dir/requires: tests/server/CMakeFiles/sws.dir/util.c.o.requires
tests/server/CMakeFiles/sws.dir/requires: tests/server/CMakeFiles/sws.dir/sws.c.o.requires
tests/server/CMakeFiles/sws.dir/requires: tests/server/CMakeFiles/sws.dir/__/__/lib/inet_pton.c.o.requires
.PHONY : tests/server/CMakeFiles/sws.dir/requires

tests/server/CMakeFiles/sws.dir/clean:
	cd /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/server && $(CMAKE_COMMAND) -P CMakeFiles/sws.dir/cmake_clean.cmake
.PHONY : tests/server/CMakeFiles/sws.dir/clean

tests/server/CMakeFiles/sws.dir/depend:
	cd /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0 /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/server /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0 /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/server /home/ubuntu/R1S-MT7621/user/uhttpd/curl/curl-7.46.0/tests/server/CMakeFiles/sws.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/server/CMakeFiles/sws.dir/depend

