
(defsystem "things"
  :name "Experiments"
  :author "Janne"
  :long-description "This is experiments with the windowing systems in Lisp"
  :description "Experiments with CL"
  :components ((:file "utils")
               (:file "generics")
               (:file "t-screen" :depends-on ("generics"))
               (:file "t-sdl" :depends-on ("generics"))
               (:file "things" 
                :depends-on ("t-screen")
                :depends-on ("t-sdl")
                :depends-on ("generics")))
  :depends-on (:lispbuilder-sdl :qt))

