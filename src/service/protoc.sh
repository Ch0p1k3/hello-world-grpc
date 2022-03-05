#! /bin/bash

protoc -I=./protoc --cpp_out=. ./protoc/service.proto
