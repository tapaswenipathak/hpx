# Copyright (c) 2011 Bryce Lelbach
#
# Distributed under the Boost Software License, Version 1.0. (See accompanying 
# file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

################################################################################
# C++-style include guard to prevent multiple searches in the same build
if(NOT HPX_SEARCHED)
set(HPX_SEARCHED ON CACHE INTERNAL "Found HPX libraries")

if(NOT CMAKE_ALLOW_LOOSE_LOOP_CONSTRUCT)
  set(CMAKE_ALLOW_LOOSE_LOOP_CONSTRUCTS TRUE)
endif()

include(HPX_Utils)

################################################################################
# search code

# TODO:

################################################################################

endif()

