(in-package :cl-user)

#|

0. Start slime in Emacs:

   M-x slime

1. Evaluate interactively (requires quicklisp to have been installed) by selecting this and typing C-c C-c:

   (ql:quickload :hunchentoot)

2. Compile/load this file:

   C-c C-k with this as current buffer

3. Evaluate interactively (C-c C-c)or in slime repl:

   (mini-go) or simply: go

4. To regenerate standalone (and incidentally kill your slime repl) evaluate:

   (save-application "mini-web"
                  :prepend-kernel t)

   Note that specifying mini-go as the toplevel-function to save-app
   produces an executable that starts the server and then exits, bringing
   the server down with it. Not good. WIP.

|#

(tbnl:define-easy-handler (hi-mom :uri "/") ()
  #|
  following code shows setters being used
  to alter the header of the reply instance,
  which FYI is bound to special variable tbnl::*reply*
  |#

 (setf (tbnl:content-type*) "text/plain")
 (let ((content (format nil "~&~%hi mom!~%~%")))
   (setf (tbnl:content-length*) (length content))
   content))

(defun mini-go (&optional (port 8080))
  (tbnl:start
   (make-instance 'tbnl:easy-acceptor :port port))
  (format t "~&Now serving port ~d.~%~%Enter (quit) to exit.")
  (values))

(format t "~%~%~%Enter (mini-go) or simply go at the prompt and press ENTER. ~%~%~%")

(define-symbol-macro go (mini-go))


