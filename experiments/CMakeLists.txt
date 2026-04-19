# Declare an executable target
add_executable(toy_network)

# Add source files to the executable target
target_sources(toy_network
  PRIVATE
    toy_network.cpp
)

# Link the executable against the library
target_link_libraries(toy_network
  PRIVATE
    rml
)
