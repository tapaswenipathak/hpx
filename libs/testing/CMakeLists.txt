# Copyright (c) 2019 The STE||AR-Group
#
# Distributed under the Boost Software License, Version 1.0. (See accompanying
# file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

cmake_minimum_required(VERSION 3.3.2 FATAL_ERROR)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

# Default location is $HPX_ROOT/libs/testing/include
set(testing_headers
  hpx/testing.hpp
)

# Default location is $HPX_ROOT/libs/testing/include_compatibility
set(testing_compat_headers
  hpx/util/lightweight_test.hpp
)

# Default location is $HPX_ROOT/libs/testing/src
set(testing_sources
  testing.cpp
)

include(HPX_AddModule)
add_hpx_module(testing
    COMPATIBILITY_HEADERS ON    # Added in 1.4.0
    DEPRECATION_WARNINGS
    FORCE_LINKING_GEN
    GLOBAL_HEADER_GEN OFF
    SOURCES ${testing_sources}
    HEADERS ${testing_headers}
    COMPAT_HEADERS ${testing_compat_headers}
    DEPENDENCIES hpx_assertion hpx_config
    CMAKE_SUBDIRS examples tests
)

