# Copyright (c) 2018 Thomas Heller
#
# Distributed under the Boost Software License, Version 1.0. (See accompanying
# file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

set(pipeline emitter worker collector)

foreach(app ${pipeline})
  add_hpx_executable(${app} SOURCES ${app}.cpp FOLDER "Examples/Pipeline")
  add_hpx_example_target_dependencies("pipeline" ${app})
endforeach()
