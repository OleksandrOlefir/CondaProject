#include <iostream>
#include "libs/hellolib/hello.h"
#include "libs/messagelib/message.h"

int main() {
    std::cout << getHello() << std::endl;
    std::cout << getMessage() << std::endl;
    return 0;
}
