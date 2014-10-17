
(defpackage :things
  (:documentation "Main things of experimentations")
  (:use #:cl #:things.t-sdl #:things.t-qt #:things.generics)
  (:export #:main))

(in-package :things)

;; Main

(defun main (&optional name)
  "Starts up the SDL experiment program"
  (let ((thing (make-instance (if (string= name "qt") 't-qt 't-sdl))))
    (startup thing)))

