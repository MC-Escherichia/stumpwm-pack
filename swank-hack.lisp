; swank.lisp -*- Mode: Lisp -*-
(in-package :stumpwm)
;;

(ql:quickload :clx)
(ql:quickload :cl-ppcre)
(ql:quickload :swank)


(let ((server-running nil)
      (first-time t))
  (defcommand swank () ()
    "Toggle the swank server on/off."
    (if server-running
        (progn
           (swank:stop-server 4004)
          (echo-string
           (current-screen)
           "Stopping swank.")
          (setf server-running nil))
        (progn
          (swank:create-server :port 4004
                               :style :spawn
                               :dont-close t)
	  (if first-time
              (progn  (message "%s"
                               (current-screen)
                               "Starting Swank.")
                      (setf first-time nil))
              (echo-string
               (current-screen)
               "Re-starting swank."))
          (setf server-running t)))))

(swank)
