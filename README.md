[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/atomwalk12/rml/ci.yml?branch=main)](https://github.com/atomwalk12/rml/actions/workflows/ci.yml)
[![Documentation Status](https://readthedocs.org/projects/rml/badge/)](https://rml.readthedocs.io/)

# rml

An experimental project that implements common deep learning primitives in C++/CUDA, the library also provides Python bindings to facilitate common usage patterns. Its main long-term purpose is to implement classical CNN architectures such as LeNet, AlexNet, GoogleNet, VGGNet and ResNet from first principles.

## Prerequisites

* A C++23-compliant compiler
* CMake `>= 3.23`
* Doxygen (optional, documentation building is skipped if missing)
* Python `>= 3.10` and `pybind11` package for building Python bindings

## Build

To install the C++/CUDA core library run:

```shell
git clone https://github.com/atomwalk12/rml.git
cd rml
cmake -B build
cmake --build build
```

The build process can be customized with the following CMake variables:

* `rml_BUILD_TESTING`: Include the test suite (default: `ON`)
* `rml_BUILD_DOCS`: Include documentation (default: `ON`)
* `rml_BUILD_PYTHON`: Include Python bindings (default: `ON`)

Example usage:

``` shell
cmake -Drml_BUILD_TESTING=ON -Drml_BUILD_DOCS=OFF -Drml_BUILD_PYTHON=ON -B build
```

To install the Python dependencies run:

```shell
python -m pip install .
```

## Tests

Ensure the library is built with `-Drml_BUILD_TESTING=ON`. Run tests with:

```shell
cd build
ctest

```


The Python tests do not have special dependencies. From the root directory run:

```bash
python -m pip install .
pytest
```

## Documentation

The upstream documentation can be found at [readthedocs.org](https://rml.readthedocs.io). To build it locally, run:

```
pip install -r doc/requirements.txt
cmake --build build --target sphinx-doc
```

Then open `build/doc/sphinx/index.html` using your browser.
