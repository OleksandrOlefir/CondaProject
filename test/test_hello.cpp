#include <cassert>
#include "../libs/hellolib/hello.h"

int main() {
    assert(getHello() == "Hello! My name is Oleksandr!");
    return 0;
}
