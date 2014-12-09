
(defpackage :things.utils
  (:documentation "Various useful and useless utils.")
  (:use #:cl)
  (:export #:qpush #:qpop #:qmake))

(in-package :things.utils)

(defun qmake ()
  (cons nil nil))

(defun qpush (queue item)
  "Pushes a value into a queue."
  (let ((new-item (cons item nil)))
    (setf (cdr queue)
          (if (car queue)
              (setf (cddr queue) new-item)
              (setf (car queue) new-item))))
  queue)

(defun qpop (queue)
  "Pops a value from a queue."
  (pop (car queue)))

(defun qlength (queue)
  "Returns the size of the queue."
  (length (car queue)))
