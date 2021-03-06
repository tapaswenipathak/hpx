# Copyright (c) 2019 The STE||AR-Group
#
# Distributed under the Boost Software License, Version 1.0. (See accompanying
# file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

if (HPX_WITH_TESTS_UNIT)
  add_hpx_pseudo_target(tests.unit.components.io_counters)
  add_hpx_pseudo_dependencies(tests.unit.components tests.unit.components.io_counters)
  add_subdirectory(unit)
endif()

if (HPX_WITH_TESTS_REGRESSIONS)
  add_hpx_pseudo_target(tests.regressions.components.io_counters)
  add_hpx_pseudo_dependencies(tests.regressions.components
    tests.regressions.components.io_counters)
  add_subdirectory(regressions)
endif()

if (HPX_WITH_TESTS_BENCHMARKS)
  add_hpx_pseudo_target(tests.performance.components.io_counters)
  add_hpx_pseudo_dependencies(tests.performance.components
    tests.performance.components.io_counters)
  add_subdirectory(performance)
endif()

if (HPX_WITH_TESTS_HEADERS)
  add_hpx_header_tests("components.io_counters"
    HEADERS ${io_counters_headers}
    HEADER_ROOT "${PROJECT_SOURCE_DIR}/include"
    COMPONENT_DEPENDENCIES io_counters)
endif()
