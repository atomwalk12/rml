#include <pybind11/pybind11.h>
#include <pybind11/stl.h>

#include "rml/rml.hpp"

namespace py = pybind11;

namespace rml {

PYBIND11_MODULE(_rml, m)
{
  m.doc() = "Python Bindings for rml";
  m.def("add_one", &add_one, "Increments an integer value");
}

} // namespace rml
