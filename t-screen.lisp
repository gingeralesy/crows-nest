
(defpackage :things.t-qt
  (:documentation "Screen handler for QT things")
  (:use #:cl #:qt #:things.generics)
  (:export #:t-qt))

(in-package :things.t-qt)

;; T-QT class

(named-readtables:in-readtable :qt)

(defclass t-qt (handler)
  ()
  (:documentation "This is the main handler for the QT experiment screen."))

(defmethod startup ((handler t-qt))
  "Starts up the QT handler."
  (with-main-window (window (make-instance 't-screen))
                    (#_setGeometry window 2000 100 800 600)))

;; T-Screen class

(defclass t-screen ()
  ()
  (:documentation "This is the main handler for the QT experiment screen.")
  (:metaclass qt-class)
  (:qt-superclass "QWidget"))

(defmethod initialize-instance :after ((instance t-screen) &key parent)
  "Initializes the QWidget"
  (if parent
      (new instance parent)
      (new instance))
  (with-objects ((font (#_new QFont "Times" 18 (#_Bold "QFont"))))
    (let ((quit (#_new QPushButton "&Quit")))
      (#_setFont quit font)
      (connect quit "clicked()" *qapplication* "quit()")
      (let ((box (#_new QFrame)))
        (#_setFrameStyle box
                         (logior (enum-value (#_WinPanel "QFrame"))
                                 (enum-value (#_Sunken "QFrame"))))
        
        (with-objects ((key (#_new QKeySequence (#_CTRL "Qt") (#_Key_Q "Qt"))))
          (#_new QShortcut key instance (QSLOT "close()")))

        (let ((left-layout (#_new QVBoxLayout))
              (top-layout (#_new QHBoxLayout))
              (grid (#_new QGridLayout)))
          (#_addStretch top-layout 1)
          
          (#_addWidget grid quit 0 0)
          (#_addLayout grid top-layout 0 1)
          (#_addLayout grid left-layout 1 0)
          (#_setColumnStretch grid 1 10)
          (#_setLayout instance grid))))))
