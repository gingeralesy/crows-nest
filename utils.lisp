
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
  
  (let ((newItem (cons item nil)))
    (if (car queue)
        (setf (cddr queue) newItem
              (cdr queue) newItem)
        (setf (car queue) newItem
              (cdr queue) newItem)))
  queue)

(defun qpop (queue)
  "Pops a value from a queue."
  (unless queue
    (error "Queue cannot be NIL."))

  (let ((value (pop (car queue))))
    (unless (caar queue)
      (setf (cdr queue) nil))
    value))

(defun qlength (queue)
  "Returns the size of the queue."
  (length (car queue)))
