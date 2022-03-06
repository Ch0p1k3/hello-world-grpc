include(FetchContent)

set(FETCHCONTENT_QUIET OFF)

message(STATUS "FetchContent: grpc")

# Libraries

# --------------------------------------------------------------------
# gRPC

FetchContent_Declare(
    gRPC
    GIT_REPOSITORY https://github.com/grpc/grpc
    GIT_TAG        v1.44.0
    GIT_PROGRESS   TRUE
    USES_TERMINAL_DOWNLOAD TRUE
)
FetchContent_MakeAvailable(gRPC)
set(_PROTOBUF_LIBPROTOBUF libprotobuf)
set(_REFLECTION grpc++_reflection)
set(_PROTOBUF_PROTOC $<TARGET_FILE:protoc>)
set(_GRPC_GRPCCPP grpc++)
if(CMAKE_CROSSCOMPILING)
    find_program(_GRPC_CPP_PLUGIN_EXECUTABLE grpc_cpp_plugin)
else()
    set(_GRPC_CPP_PLUGIN_EXECUTABLE $<TARGET_FILE:grpc_cpp_plugin>)
endif()

# --------------------------------------------------------------------
