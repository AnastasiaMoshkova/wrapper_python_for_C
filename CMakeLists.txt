cmake_minimum_required(VERSION 3.14)
 
set(PROJECT_NAME myProject)
project(${PROJECT_NAME})

set(LIBRARY_OUTPUT_PATH ${PROJECT_BINARY_DIR}/lib)

list(APPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/wrapper")
link_directories(${LIBRARY_OUTPUT_PATH})
add_subdirectory(wrapper)

set(LIB_NAME mylib)
add_library(${LIB_NAME} STATIC sources/test.c)
target_include_directories(${LIB_NAME} PUBLIC ${CMAKE_CURRENT_LIST_DIR}/headers)
target_link_libraries(${LIB_NAME})

build_command(bldcmd)
file(WRITE "${CMAKE_BINARY_DIR}/build.cmd"
    "cd ${CMAKE_BINARY_DIR}\n"
    ${bldcmd})
