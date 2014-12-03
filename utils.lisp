
(defpackage :things.utils
  (:documentation "Various useful and useless utils.")
  (:use #:cl)
  (:export #:qpush #:qpop))

(in-package :things.utils)

(defun qpush (queue item)
  "Pushes a value into a queue."
  (if (and queue (car queue))
      (let ((n (list item)))
        (setf (cddr queue) n)
        (setf (cdr queue) (cddr queue)))
      (let ((l (list item)))
        (if queue
            (progn
              (setf (car queue) l)
              (setf (cdr queue) l))
            (setf queue (cons l l)))))
  queue)

(defun qpop (queue)
  "Pops a value from a queue."
  (let ((v (caar queue)))
    (setf (car queue) (cdar queue))
    (unless (car queue)
      (setf (cdr queue) nil))
    v))

(defun qlength (queue)
  "Returns the size of the queue."
  (length (car queue)))
