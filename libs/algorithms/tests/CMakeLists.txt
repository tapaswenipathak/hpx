# Copyright (c) 2019 The STE||AR-Group
#
# Distributed under the Boost Software License, Version 1.0. (See accompanying
# file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

include(HPX_Option)

if (NOT HPX_WITH_TESTS AND HPX_TOP_LEVEL)
  hpx_set_option(HPX_ALGORITHMS_WITH_TESTS VALUE OFF FORCE)
  return()
endif()
if (NOT HPX_ALGORITHMS_WITH_TESTS)
  message(STATUS "Tests for algorithms disabled")
  return()
endif()

if (HPX_WITH_TESTS_UNIT)
  add_hpx_pseudo_target(tests.unit.modules.algorithms)
  add_hpx_pseudo_dependencies(tests.unit.modules tests.unit.modules.algorithms)
  add_subdirectory(unit)
endif()

if (HPX_WITH_TESTS_REGRESSIONS)
  add_hpx_pseudo_target(tests.regressions.modules.algorithms)
  add_hpx_pseudo_dependencies(tests.regressions.modules tests.regressions.modules.algorithms)
  add_subdirectory(regressions)
endif()

if (HPX_WITH_TESTS_BENCHMARKS)
  add_hpx_pseudo_target(tests.performance.modules.algorithms)
  add_hpx_pseudo_dependencies(tests.performance.modules tests.performance.modules.algorithms)
  add_subdirectory(performance)
endif()

if (HPX_WITH_TESTS_HEADERS)
  add_hpx_header_tests(
    modules.algorithms
    HEADERS ${algorithms_headers}
    HEADER_ROOT ${PROJECT_SOURCE_DIR}/include
    DEPENDENCIES hpx_algorithms)
endif()
