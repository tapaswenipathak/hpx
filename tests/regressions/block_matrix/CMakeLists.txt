# Copyright (c) 2013 Erik Schnetter
#
# Distributed under the Boost Software License, Version 1.0. (See accompanying
# file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

if(HPX_WITH_CXX11_DEFAULTED_FUNCTIONS)

  set(tests block_matrix)

  set(sources
      algorithms.cc block_matrix.cc main.cc matrix.cc matrix_hpx.cc tests.cc)

  source_group("Source Files" FILES ${sources})

  add_hpx_executable(block_matrix_test
                     SOURCES ${sources}
                     ${block_matrix_FLAGS}
                     EXCLUDE_FROM_ALL
                     HPX_PREFIX ${HPX_BUILD_PREFIX}
                     FOLDER "Tests/Regressions/Block-Matrix")

  add_hpx_regression_test("block_matrix" block_matrix ${block_matrix_PARAMETERS})

endif()
