# Copyright (c) 2019 The STE||AR-Group
#
# Distributed under the Boost Software License, Version 1.0. (See accompanying
# file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

cmake_minimum_required(VERSION 3.3.2 FATAL_ERROR)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

# Default location is $HPX_ROOT/libs/assertion/include
set(assertion_headers
  hpx/assertion.hpp
  hpx/assertion/current_function.hpp
  hpx/assertion/evaluate_assert.hpp
  hpx/assertion/force_linking.hpp
  hpx/assertion/source_location.hpp
)

# Default location is $HPX_ROOT/libs/assertion/include_compatibility
set(assertion_compat_headers
  hpx/util/assert.hpp
)

# Default location is $HPX_ROOT/libs/assertion/src
set(assertion_sources
  assertion.cpp
  force_linking.cpp
  source_location.cpp
)

include(HPX_AddModule)
add_hpx_module(assertion
    COMPATIBILITY_HEADERS ON    # Added in 1.4.0
    DEPRECATION_WARNINGS
    GLOBAL_HEADER_GEN OFF
    SOURCES ${assertion_sources}
    HEADERS ${assertion_headers}
    COMPAT_HEADERS ${assertion_compat_headers}
    DEPENDENCIES hpx_config hpx_preprocessor
    CMAKE_SUBDIRS examples tests
)
