((c++-mode
  . ((quickrun-option-cmd-alist
      . ((:command . "cmake")
         (:exec . ("%c --build ../build --target rml_app"
                   "../build/app/rml_app %a"))
         (:compile-only . "%c --build ../build --target rml_app")
         (:tempfile . nil)
         (:description . "Build and run the CMake rml_app target")))))
 (c++-ts-mode
  . ((quickrun-option-cmd-alist
      . ((:command . "cmake")
         (:exec . ("%c --build ../build --target rml_app"
                   "../build/app/rml_app %a"))
         (:compile-only . "%c --build ../build --target rml_app")
         (:tempfile . nil)
         (:description . "Build and run the CMake rml_app target"))))))
