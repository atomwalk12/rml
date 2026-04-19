cmake_minimum_required(VERSION 3.23)

# Set a name and a version number for your project:
project(rml
  VERSION 0.0.1
  LANGUAGES CXX
)

# Set default compilation flags
# Remember to move compile_commands.json from the build to the
# root directory to ensure emacs lsp server works correctly.
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

if(PROJECT_IS_TOP_LEVEL AND CMAKE_EXPORT_COMPILE_COMMANDS)
  add_custom_target(copy_compile_commands ALL
    COMMAND ${CMAKE_COMMAND} -E copy_if_different
            ${CMAKE_BINARY_DIR}/compile_commands.json
            ${CMAKE_SOURCE_DIR}/compile_commands.json
    COMMENT "Copying compile_commands.json to source root"
    VERBATIM
    )
endif()

# Initialize some default paths
include(GNUInstallDirs)

# Define build options
option(rml_BUILD_TESTING "Enable building of tests" OFF)

if(PROJECT_IS_TOP_LEVEL)
  option(rml_BUILD_PYTHON "Enable building of Python bindings" ON)
else()
  option(rml_BUILD_PYTHON "Enable building of Python bindings" OFF)
endif()

if(PROJECT_IS_TOP_LEVEL)
  option(rml_BUILD_DOCS "Enable building of documentation" ON)
else()
  option(rml_BUILD_DOCS "Enable building of documentation" OFF)
endif()

# Compile the library
add_subdirectory(src)


if(PROJECT_IS_TOP_LEVEL)
  # Compile the application executable
  add_subdirectory(experiments)
endif()

if(PROJECT_IS_TOP_LEVEL)
  # Compile the tests
  include(CTest)
  if(rml_BUILD_TESTING)
    add_subdirectory(ext/Catch2)
    add_subdirectory(tests)
  endif()
endif()

# Add the documentation
if(PROJECT_IS_TOP_LEVEL AND rml_BUILD_DOCS)
  add_subdirectory(doc)
endif()

# Add Python bindings
if(PROJECT_IS_TOP_LEVEL AND rml_BUILD_PYTHON)
  # Enable PIC for Python bindings
  set_target_properties(rml
    PROPERTIES
      POSITION_INDEPENDENT_CODE ON
  )

  set(PYBIND11_FINDPYTHON ON)
  find_package(pybind11 REQUIRED)
  # Compile the Pybind11 module
  pybind11_add_module(_rml python/rml/_rml.cpp)
  target_link_libraries(_rml
    PUBLIC
      rml
  )

  # Install the Python module shared library
  install(TARGETS _rml DESTINATION .)
endif()

# Add an alias target for use if this project is included as a subproject in another project
add_library(rml::rml ALIAS rml)

# Install the target and headers
install(
  TARGETS rml
  EXPORT rmlTargets
  FILE_SET HEADERS
)

# Install the exported targets (this creates rmlTargets.cmake)
install(
  EXPORT rmlTargets
  DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/rml
  NAMESPACE rml::
)

# Include helpers for calling configure_package_config_file
include(CMakePackageConfigHelpers)

# Generate the rmlConfig.cmake file
configure_package_config_file(
  ${CMAKE_CURRENT_LIST_DIR}/cmake/rmlConfig.cmake.in
  ${CMAKE_CURRENT_BINARY_DIR}/rmlConfig.cmake
  INSTALL_DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/rml
)

# Install the generated Config file
install(
  FILES
    ${CMAKE_CURRENT_BINARY_DIR}/rmlConfig.cmake
  DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/rml
)

# Generate a version file
write_basic_package_version_file(
  ${CMAKE_CURRENT_BINARY_DIR}/rmlConfigVersion.cmake
  VERSION ${PROJECT_VERSION}
  COMPATIBILITY SameMajorVersion
)

# Install the version file
install(
  FILES
    ${CMAKE_CURRENT_BINARY_DIR}/rmlConfigVersion.cmake
  DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/rml
)

# This prints a summary of found dependencies
include(FeatureSummary)
feature_summary(WHAT ALL)
