# - Find MongoDB C++ bindings
# Once done this will define
#
# MONGODB_INCLUDE_DIR - where to find libkyotocabinet header files, etc.
# MONGODB_LIBRARY - List of libraries when using libkyotocabinet.
# MONGODB_FOUND - True if libkyotocabinet found.
#
FIND_LIBRARY(MONGODB_LIBRARY NAMES kyotocabinet libkyotocabinet HINTS ${MONGODB_LIB_DIR})
FIND_PATH(MONGODB_INCLUDE_DIR /usr/local/include/kyotocabinet/myconfig.h)
# handle the QUIETLY and REQUIRED arguments and set MONGODB_FOUND to TRUE if
# all listed variables are TRUE
INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(KyotoCabinet REQUIRED_VARS MONGODB_LIBRARY MONGODB_INCLUDE_DIR)
MARK_AS_ADVANCED(MONGODB_LIBRARY MONGODB_INCLUDE_DIR)