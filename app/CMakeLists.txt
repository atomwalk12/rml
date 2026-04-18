# Declare an executable target
add_executable(rml_app)

# Add source files to the executable target
target_sources(rml_app
  PRIVATE
    rml_app.cpp
)

# Link the executable against the library
target_link_libraries(rml_app
  PRIVATE
    rml
)
