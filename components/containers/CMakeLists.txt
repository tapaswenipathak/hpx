# Copyright (c) 2007-2015 Hartmut Kaiser
# Copyright (c)      2011 Bryce Lelbach
# Copyright (c)      2013 Jeroen Habraken
#
# Distributed under the Boost Software License, Version 1.0. (See accompanying
# file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

set(components
  unordered
  partitioned_vector
)

foreach(component ${components})
  add_hpx_pseudo_target(components.containers.${component})
  add_subdirectory(${component})
  add_hpx_pseudo_dependencies(components.containers
    components.containers.${component})
endforeach()
