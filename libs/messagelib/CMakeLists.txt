find_package(nlohmann_json REQUIRED)

add_library(messagelib message.cpp)
target_include_directories(messagelib PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
target_link_libraries(messagelib PUBLIC nlohmann_json::nlohmann_json)
