
(defpackage :things
  (:documentation "Main things of experimentations")
  (:use #:cl #:things.t-qt #:things.generics)
  (:export #:main))

(in-package :things)

;; Main

(defun main (&optional name)
  "Starts up the Qt experiment program"
  (let ((thing (make-instance 't-qt)))
    (startup thing)))

