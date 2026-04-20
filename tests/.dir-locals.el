((c++-mode
  . ((quickrun-option-cmd-alist
      . ((:command . "cmake")
         (:exec . ("%c --build ../build --target rml_tests"
                   "ctest --test-dir ../build --output-on-failure"))
         (:compile-only . "%c --build ../build --target rml_tests")
         (:tempfile . nil)
         (:description . "Run all unit tests included in the rml_tests target")))))
 (c++-ts-mode
  . ((quickrun-option-cmd-alist
      . ((:command . "cmake")
         (:exec . ("%c --build ../build --target rml_tests"
                   "ctest --test-dir ../build --output-on-failure"))
         (:compile-only . "%c --build ../build --target rml_tests")
         (:tempfile . nil)
         (:description . "Run all unit tests included in the rml_tests target")))))
 (python-mode
  . ((quickrun-option-cmd-alist
      . ((:command . "/usr/bin/python3")
         (:exec . ("cd %d/../.. && cmake --build build --target _rml"
                   "cd %d/../.. && PYTHONPATH=python:build %c -m pytest %d/%s"))
         (:compile-only . "cd %d/../.. && cmake --build build --target _rml")
         (:tempfile . nil)
         (:description . "Build the pybind11 module and run the current pytest file")))))
 (python-ts-mode
  . ((quickrun-option-cmd-alist
      . ((:command . "/usr/bin/python3")
         (:exec . ("cd %d/../.. && cmake --build build --target _rml"
                   "cd %d/../.. && PYTHONPATH=python:build %c -m pytest %d/%s"))
         (:compile-only . "cd %d/../.. && cmake --build build --target _rml")
         (:tempfile . nil)
         (:description . "Build the pybind11 module and run the current pytest file"))))))
