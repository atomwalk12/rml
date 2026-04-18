# Welcome to rml

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/atomwalk12/rml/ci.yml?branch=main)](https://github.com/atomwalk12/rml/actions/workflows/ci.yml)
[![PyPI Release](https://img.shields.io/pypi/v/rml.svg)](https://pypi.org/project/rml)
[![Documentation Status](https://readthedocs.org/projects/rml/badge/)](https://rml.readthedocs.io/)

RML is an experimental project that implements common deep learning primitives in C++/CUDA, comprising also of bindings for Python use.

# Prerequisites

Building rml requires the following software installed:

* A C++23-compliant compiler
* CMake `>= 3.23`
* Doxygen (optional, documentation building is skipped if missing)
* Python `>= 3.10` for building Python bindings

# Building rml

The following sequence of commands builds rml.
It assumes that your current working directory is the top-level directory
of the freshly cloned repository:

```
cmake -B build
cmake --build build
```

The build process can be customized with the following CMake variables,
which can be set by adding `-D<var>={ON, OFF}` to the `cmake` call:

* `rml_BUILD_TESTING`: Enable building of the test suite (default: `ON`)
* `rml_BUILD_DOCS`: Enable building the documentation (default: `ON`)
* `rml_BUILD_PYTHON`: Enable building the Python bindings (default: `ON`)


If you wish to build and install the project as a Python project without
having access to C++ build artifacts like libraries and executables, you
can do so using `pip` from the root directory:

```
python -m pip install .
```

# Testing rml

When built according to the above explanation (with `-Drml_BUILD_TESTING=ON`),
the C++ test suite of `rml` can be run using
`ctest` from the build directory:

```
cd build
ctest
```

The Python test suite can be run by first `pip`-installing the Python package
and then running `pytest` from the top-level directory:

```
python -m pip install .
pytest
```

# Documentation

rml provides a Sphinx-based documentation, that can
be browsed [online at readthedocs.org](https://rml.readthedocs.io).
To build it locally, first ensure the requirements are installed by running this command from the top-level source directory:

```
pip install -r doc/requirements.txt
```

Then build the sphinx documentation from the top-level directory:

```
cmake --build build --target sphinx-doc
```

The web documentation can then be browsed by opening `build/doc/sphinx/index.html` in your browser.
## Acknowledgments

This repository was set up using the [SSC Cookiecutter for C++ Packages](https://github.com/ssciwr/cookiecutter-cpp-project).
