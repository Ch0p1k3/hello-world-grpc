add_subdirectory(service)

include("library/GRPC.cmake")

include_directories("${CMAKE_CURRENT_BINARY_DIR}")

# --------------------------------------------------------------------
# server

add_executable(server server.cpp)
target_link_libraries(
    server
    service
    ${_REFLECTION}
    ${_GRPC_GRPCPP}
    ${_PROTOBUF_LIBPROTOBUF}
)

# --------------------------------------------------------------------

# --------------------------------------------------------------------
# client

add_executable(client client.cpp)
target_link_libraries(
    client
    service
    ${_REFLECTION}
    ${_GRPC_GRPCPP}
    ${_PROTOBUF_LIBPROTOBUF}
)

# --------------------------------------------------------------------
