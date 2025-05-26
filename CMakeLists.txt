cmake_minimum_required(VERSION 3.5)
project(CondaHelloProject)

set(CMAKE_CXX_STANDARD 17)

add_subdirectory(libs/messagelib)
add_subdirectory(libs/hellolib)
add_subdirectory(test)

include_directories(libs/messagelib libs/hellolib)

add_executable(conda-project main.cpp)
target_link_libraries(conda-project PRIVATE messagelib hellolib)
