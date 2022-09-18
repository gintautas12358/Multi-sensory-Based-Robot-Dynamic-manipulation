
(cl:in-package :asdf)

(defsystem "object_msgs-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "AddMovingObjects" :depends-on ("_package_AddMovingObjects"))
    (:file "_package_AddMovingObjects" :depends-on ("_package"))
  ))