
(defsystem "things"
  :name "Experiments"
  :author "Janne"
  :long-description "This is experiments with the windowing systems in Lisp"
  :description "Experiments with CL"
  :components ((:file "generics")
               (:file "t-qt" :depends-on ("generics"))
               (:file "things" 
                :depends-on ("t-qt")
                :depends-on ("generics")))
  :depends-on (:qtools :things-headless))

