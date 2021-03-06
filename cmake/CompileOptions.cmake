# Common compile options for C++

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# https://clang.llvm.org/docs/DiagnosticsReference.html
add_compile_options(-Wall -Wextra -Wpedantic -g -fno-omit-frame-pointer)

# Turn warnings into errors
# add_compile_options(-Werror -Wno-language-extension-token)

# add_compile_options(-Wno-error=unused-command-line-argument)

message(STATUS "C++ standard: ${CMAKE_CXX_STANDARD}")
