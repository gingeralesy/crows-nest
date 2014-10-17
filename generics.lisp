
(defpackage :things.generics
  (:documentation "Generics for things")
  (:use #:cl)
  (:export #:handler #:startup))

(in-package :things.generics)

;; Generics

(defclass handler ()
  ()
  (:documentation "An abstract handler class"))

(defgeneric startup (handler)
  (:documentation "Starts up the handler."))

(defmethod startup (handler)
  "Does nothing.")
