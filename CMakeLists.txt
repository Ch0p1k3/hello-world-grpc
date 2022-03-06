cmake_minimum_required(VERSION 3.14)
project(mafia)

set(EXECUTABLE_OUTPUT_PATH ${CMAKE_CURRENT_SOURCE_DIR}/bin)

include(cmake/Ccache.cmake)
include(cmake/CheckCompiler.cmake)
include(cmake/CompileOptions.cmake)
include(cmake/Sanitize.cmake)
include(cmake/Development.cmake)

add_subdirectory(src)
