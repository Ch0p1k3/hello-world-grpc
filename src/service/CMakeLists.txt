include("../library/GRPC.cmake")

get_filename_component(proto "protos/service.proto" ABSOLUTE)
get_filename_component(proto_path "${proto}" PATH)

set(proto_srcs "${CMAKE_CURRENT_BINARY_DIR}/service.pb.cc")
set(proto_hdrs "${CMAKE_CURRENT_BINARY_DIR}/service.pb.h")
set(grpc_srcs "${CMAKE_CURRENT_BINARY_DIR}/service.grpc.pb.cc")
set(grpc_hdrs "${CMAKE_CURRENT_BINARY_DIR}/service.grpc.pb.h")

message(STATUS "Generate proto in ${CMAKE_CURRENT_BINARY_DIR}")
add_custom_command(
    OUTPUT "${proto_srcs}" "${proto_hdrs}" "${grpc_srcs}" "${grpc_hdrs}"
    COMMAND ${_PROTOBUF_PROTOC}
    ARGS --grpc_out "${CMAKE_CURRENT_BINARY_DIR}"
         --cpp_out "${CMAKE_CURRENT_BINARY_DIR}"
         -I "${proto_path}"
         --plugin=protoc-gen-grpc="${_GRPC_CPP_PLUGIN_EXECUTABLE}"
         "${proto}"
    DEPENDS "${proto}"
)

include_directories("${CMAKE_CURRENT_BINARY_DIR}")

add_library(
    service
    ${grpc_srcs}
    ${grpc_hdrs}
    ${proto_srcs}
    ${proto_hdrs}
)
target_link_libraries(
    service
    ${_REFLECTION}
    ${_GRPC_GRPCPP}
    ${_PROTOBUF_LIBPROTOBUF}
)
