cmake_minimum_required (VERSION 3.6)
project (CppSample LANGUAGES CXX)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(SRC_LIST "")
list(APPEND SRC_LIST main.cpp)
list(APPEND SRC_LIST Interview/FilesReader.cpp)
add_executable(CppSample "${SRC_LIST}")

