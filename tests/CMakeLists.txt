# Catch2 package is already imported from the root CMakeLists.txt

# Include Catch2's CMake helper functions (e.g., catch_discover_tests).
include(Catch)

# Create a single test binary that compiles all test files.
add_executable(rml_tests)

# Add the implementation file
target_sources(rml_tests
  PRIVATE
    rml_t.cpp
)

# Link the test binary
target_link_libraries(rml_tests
  PUBLIC
    rml
    Catch2::Catch2WithMain
)

# allow user to run tests with `make test` or `ctest`
catch_discover_tests(rml_tests
  TEST_PREFIX "rml."
)
