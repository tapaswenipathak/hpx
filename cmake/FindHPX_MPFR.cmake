# Copyright (c) 2007-2009 Hartmut Kaiser
# Copyright (c) 2011      Bryce Lelbach
#
# Distributed under the Boost Software License, Version 1.0. (See accompanying 
# file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

#  MPFR_FOUND        True if MPFR was found
#  MPFR_INCLUDE_DIR  The path to the MPFR include directory
#  MPFR_LIBRARY      The name(s) of the MPFR library 
#  MPFR_ROOT         MPFR main path.

################################################################################
# C++-style include guard to prevent multiple searches in the same build
if(NOT MPFR_SEARCHED)
set(MPFR_SEARCHED ON CACHE INTERNAL "Found MPFR library")

if(NOT CMAKE_ALLOW_LOOSE_LOOP_CONSTRUCT)
  set(CMAKE_ALLOW_LOOSE_LOOP_CONSTRUCTS TRUE)
endif()

################################################################################
# Check if MPFR_ROOT is defined and use that path first.
if (NOT MPFR_ROOT AND NOT $ENV{MPFR_ROOT} STREQUAL "")
    set(MPFR_ROOT $ENV{MPFR_ROOT})
endif(NOT MPFR_ROOT AND NOT $ENV{MPFR_ROOT} STREQUAL "")

if(MPFR_ROOT)
    find_path(MPFR_INCLUDE_DIR mpfr.h PATHS ${MPFR_ROOT}/include NO_DEFAULT_PATH)
    find_library(MPFR_LIBRARY mpfr PATHS ${MPFR_ROOT}/lib NO_DEFAULT_PATH)

    if(NOT MPFR_LIBRARY)
        message(WARNING "MPFR not found in ${MPFR_ROOT}.")
        unset(MPFR_ROOT)
    endif(NOT MPFR_LIBRARY)
endif(MPFR_ROOT)

find_path(MPFR_INCLUDE_DIR mpfr.h)
find_library(MPFR_LIBRARY NAMES mpfr)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(MPFR DEFAULT_MSG MPFR_LIBRARY MPFR_INCLUDE_DIR)

if(MPFR_FOUND)
    get_filename_component(MPFR_ROOT ${MPFR_INCLUDE_DIR} PATH)
    set(MPFR_FOUND ${MPFR_FOUND} CACHE BOOL "Found MPFR.")
    set(MPFR_ROOT ${MPFR_ROOT} CACHE PATH "MPFR root directory.")
    set(MPFR_INCLUDE_DIR ${MPFR_INCLUDE_DIR} CACHE PATH "MPFR include directory.")
    set(MPFR_LIBRARY ${MPFR_LIBRARY} CACHE FILEPATH "MPFR shared library.")
endif()

################################################################################

endif()

