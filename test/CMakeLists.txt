enable_testing()

add_executable(test_message test_message.cpp)
target_link_libraries(test_message PRIVATE messagelib)
add_test(NAME MessageTest COMMAND test_message)

add_executable(test_hello test_hello.cpp)
target_link_libraries(test_hello PRIVATE hellolib)
add_test(NAME HelloTest COMMAND test_hello)
