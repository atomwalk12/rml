#include "rml/rml.hpp"
#include <iostream>

int main()
{
  int result = rml::add_one(1);
  std::cout << "1 + 1 = " << result << std::endl;
}
