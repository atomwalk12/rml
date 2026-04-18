find_package(Doxygen REQUIRED)
set(DOXYGEN_EXCLUDE_PATTERNS "${CMAKE_SOURCE_DIR}/ext/*")
set(DOXYGEN_SHORT_NAMES YES)
set(DOXYGEN_GENERATE_XML YES)

doxygen_add_docs(rml-doxygen
  ${CMAKE_SOURCE_DIR}/include
  ${CMAKE_SOURCE_DIR}/src
  WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
  COMMENT Building doxygen documentation...
)

add_custom_target(rml-sphinx-doc
  COMMAND
    sphinx-build -b html
    -Dbreathe_projects.rml="${CMAKE_CURRENT_BINARY_DIR}/xml"
    -c ${CMAKE_CURRENT_SOURCE_DIR}
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${CMAKE_CURRENT_BINARY_DIR}/sphinx
  WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
  COMMENT "Generating documentation with Sphinx..."
)
add_dependencies(rml-sphinx-doc rml-doxygen)