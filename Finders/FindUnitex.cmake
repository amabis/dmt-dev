# =============================================================================
# FindUnitex.cmake
# This module can find/handle the Unitex library
# =============================================================================
# requirements:
# - CMake >= 2.8.7 (for new version of find_package_handle_standard_args)
# - CobaltoSimpleFindLibrary.cmake: Cobalto's simple find library macro
#
# the following variables will be defined for your use:
# - UNITEX_FOUND             : were all Unitex library found
# - UNITEX_INCLUDE_DIR       : Unitex include directory
# - UNITEX_LIBRARY           : Unitex library
# - UNITEX_VERSION           : complete version of Unitex (#.#)
# - UNITEX_MAJOR_VERSION     : major version of Unitex
# - UNITEX_MINOR_VERSION     : minor version of Unitex
# =============================================================================
# How to use:
#  1) Copy FindUnitex.cmake in the root of your project source directory
#  2) Then, tell CMake to search this non-standard module in your project
#     directory by adding to your CMakeLists.txt:
#     set(cmake_module_path ${project_source_dir})
#  3) Finally, call find_package(Unitex) once
# =============================================================================
include(CobaltoSimpleFindLibrary)

# Find Unitex dependencies

# Unitex depends on TRE
# Find TRE
COBALTO_SIMPLE_FIND_LIBRARY (
  NAME                TRE
  PATH_NAMES          tre/tre.h
  LIBRARY_NAMES       tre libtre.a libtre.so
  PATH_SUFFIXES       tre
)

# Find Unitex
COBALTO_SIMPLE_FIND_LIBRARY (
  NAME                Unitex
  PATH_NAMES          UnitexTool.h
  LIBRARY_NAMES       unitex libunitex libunitexjni libunitexstatic
  PATH_SUFFIXES       unitex
  VERSION_HEADER      Copyright.h
  MAJOR_VERSION_REGEX ".*# *define *UNITEX_MAJOR_VERSION_NUMBER *([0-9]+).*"
  MINOR_VERSION_REGEX ".*# *define *UNITEX_MINOR_VERSION_NUMBER *([0-9]+).*"
)

set(UNITEX_INCLUDE_DIRS ${UNITEX_INCLUDE_DIRS};${UNITEX_INCLUDE_DIR};${TRE_INCLUDE_DIR})
set(UNITEX_LIBRARIES    ${UNITEX_LIBRARIES};${UNITEX_LIBRARY};${TRE_LIBRARY})
