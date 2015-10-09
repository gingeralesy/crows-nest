
(defpackage :things.t-qt
  (:documentation "Screen handler for QT things")
  (:use #:cl+qt #:things.generics)
  (:export #:t-qt))

(in-package :things.t-qt)
(in-readtable :qtools)

;; T-QT class

(defclass t-qt (handler)
  ()
  (:documentation "This is the main handler for the QT experiment screen."))

(defmethod startup ((handler t-qt))
  "Starts up the QT handler."
  ;; Make QApplication and start it up here
  (with-main-window (window (make-instance 'main-window)))
  NIL)

;; Qt specific defines

(define-widget main-window (QWidget)
  ())

(define-subwidget (main-window name) (q+:make-qlineedit main-window)
  (setf (q+:placeholder-text name) "Insert words."))

(define-subwidget (main-window go) (q+:make-qpushbutton "Go." main-window))

(define-subwidget (main-window layout) (q+:make-qhboxlayout main-window)
  (q+:add-widget layout name)
  (q+:add-widget layout go))

(define-signal (main-window name-set) (string))

(define-slot (main-window go) ()
  (declare (connected go (pressed)))
  (declare (connected name (return-pressed)))
  (signal! main-window (name-set string) (q+:text name)))

(define-slot (main-window name-set) ((new-name string))
  (declare (connected main-window (name-set string)))
  (q+:qmessagebox-information main-window "Hello"
                              (format NIL "Said: ~a" new-name)))

(define-override (main-window paint-event) (event)
  (declare (ignore event))
  (with-finalizing ((painter (q+:make-qpainter main-window)))
    (q+:fill-rect painter (q+:rect main-window) (q+:qt.white))))

