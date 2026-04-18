# Declare a new library target
add_library(rml)

# Add the implementation file and mark the public headers that belong to this library
target_sources(rml
  PRIVATE
    rml.cpp

  PUBLIC
    FILE_SET HEADERS
    BASE_DIRS ../include
    FILES
      ../include/rml/rml.hpp
)

# Request a minimum C++ standard for this target
target_compile_features(rml
  PUBLIC
    cxx_std_23
)
