# Copyright (c) 2007-2015 Hartmut Kaiser
# Copyright (c) 2013,2016 Maciej Brodowicz
#
# Distributed under the Boost Software License, Version 1.0. (See accompanying
# file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

set(tests
    papi_counters_active_interface
    papi_counters_basic_functions
    papi_counters_segfault_1890)

foreach(test ${tests})
  set(sources
      ${test}.cpp)

  source_group("Source Files" FILES ${sources})

  add_hpx_executable(${test}_test
                     SOURCES ${sources}
                     COMPONENT_DEPENDENCIES papi_counters
                     ${${test}_FLAGS}
                     EXCLUDE_FROM_ALL
                     HPX_PREFIX ${HPX_BUILD_PREFIX}
                     FOLDER "Tests/Regressions/Components")

  add_hpx_regression_test("components.papi_counters" ${test} ${${test}_PARAMETERS})
endforeach()

