((c++-mode
  . ((quickrun-option-cmd-alist
      . ((:command . "cmake")
         (:exec . ("%c --build ../build --target toy_network"
                   "../build/experiments/toy_network %a"))
         (:compile-only . "%c --build ../build --target toy_network")
         (:tempfile . nil)
         (:description . "Build and run the CMake toy_network target")))))
 (c++-ts-mode
  . ((quickrun-option-cmd-alist
      . ((:command . "cmake")
         (:exec . ("%c --build ../build --target toy_network"
                   "../build/experiments/toy_network %a"))
         (:compile-only . "%c --build ../build --target toy_network")
         (:tempfile . nil)
         (:description . "Build and run the CMake toy_network target"))))))
