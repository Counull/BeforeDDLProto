#!/bin/bash

# 创建输出目录（如果不存在）
mkdir -p cpp_out
mkdir -p csharp_out

# 遍历当前目录及其子目录下的所有 .proto 文件
find . -name "*.proto" | while read proto_file; do
  # 生成 C++ 文件
  protoc -I=$(dirname "$proto_file") --cpp_out=cpp_out --grpc_out=cpp_out --plugin=protoc-gen-grpc=$(which grpc_cpp_plugin) "$proto_file"
  
  # 生成 C# 文件
  protoc -I=$(dirname "$proto_file") --csharp_out=csharp_out --grpc_out=csharp_out --plugin=protoc-gen-grpc=$(which grpc_csharp_plugin) "$proto_file"
done