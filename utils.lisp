
(defpackage :things.utils
  (:documentation "Various useful and useless utils.")
  (:use #:cl)
  (:export #:qpush #:qpop #:qmake))

(in-package :things.utils)

(defun qmake ()
  (list nil))

(defun qpush (queue item)
  "Pushes a value into a queue."
  (unless queue
    (error "Queue cannot be NIL."))
  
  (let ((new-item (cons item nil)))
    (if (car queue)
        (setf (cddr queue) new-item
              (cdr queue) new-item)
        (setf (car queue) new-item
              (cdr queue) new-item)))
  queue)

(defun qpop (queue)
  "Pops a value from a queue."
  (pop (car queue)))

(defun qlength (queue)
  "Returns the size of the queue."
  (length (car queue)))
