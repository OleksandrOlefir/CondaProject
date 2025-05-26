#include "message.h"
#include <nlohmann/json.hpp>

using json = nlohmann::json;

std::string getMessage() {
    json j;
    j["message"] = "I want to work at SoftServe!";
    return j["message"];
}
