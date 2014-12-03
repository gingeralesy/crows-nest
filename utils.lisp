
(defpackage :things.utils
  (:documentation "Various useful and useless utils.")
  (:use #:cl)
  (:export #:qpush #:qpop))

(in-package :things.utils)

(defun qpush (queue item)
  "Pushes a value into a queue."
  (if queue
      (let ((n (list item)))
        (setf (cddr queue) n)
        (setf (cdr queue) (cddr queue)))
      (let ((l (list item)))
        (setf queue (cons l l))))
  queue)

(defun qpop (queue)
  "Pops a value from a queue."
  (let ((v (car (car queue))))
    (setf (car queue) (cdr (car queue)))
    v))

(defun qlength (queue)
  "Returns the size of the queue."
  (length (car queue)))
