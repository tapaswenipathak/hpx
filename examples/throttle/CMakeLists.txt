# Copyright (c) 2007-2012 Hartmut Kaiser
# Copyright (c) 2011      Bryce Lelbach
#
# Distributed under the Boost Software License, Version 1.0. (See accompanying
# file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

# just recurse into all components subdirectories and execute the scripts there
set(subdirs
    throttle)

# TODO: Add non-interactive version that can be tested.

# for all targets specified above
foreach(subdir ${subdirs})
  add_subdirectory(${subdir})

  set(sources
      ${subdir}_client.cpp)

  source_group("Source Files" FILES ${sources})

  # add example executable
  add_hpx_executable(${subdir}_client
    SOURCES ${sources}
    DEPENDENCIES ${subdir}_component
    FOLDER "Examples/Throttle")

  add_hpx_example_target_dependencies("throttle" ${subdir}_client)

endforeach()

add_hpx_executable(spin
  SOURCES spin.cpp
  FOLDER "Examples/Throttle")

add_hpx_example_target_dependencies("throttle" spin)
