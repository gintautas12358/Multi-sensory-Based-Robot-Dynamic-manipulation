
(cl:in-package :asdf)

(defsystem "control_core_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "AngularState" :depends-on ("_package_AngularState"))
    (:file "_package_AngularState" :depends-on ("_package"))
    (:file "AngularStateStamped" :depends-on ("_package_AngularStateStamped"))
    (:file "_package_AngularStateStamped" :depends-on ("_package"))
    (:file "CartesianState" :depends-on ("_package_CartesianState"))
    (:file "_package_CartesianState" :depends-on ("_package"))
    (:file "CartesianStateStamped" :depends-on ("_package_CartesianStateStamped"))
    (:file "_package_CartesianStateStamped" :depends-on ("_package"))
    (:file "CartesianStateTrajectory" :depends-on ("_package_CartesianStateTrajectory"))
    (:file "_package_CartesianStateTrajectory" :depends-on ("_package"))
    (:file "JointState" :depends-on ("_package_JointState"))
    (:file "_package_JointState" :depends-on ("_package"))
    (:file "JointStateStamped" :depends-on ("_package_JointStateStamped"))
    (:file "_package_JointStateStamped" :depends-on ("_package"))
    (:file "JointStateTrajectory" :depends-on ("_package_JointStateTrajectory"))
    (:file "_package_JointStateTrajectory" :depends-on ("_package"))
    (:file "LinearState" :depends-on ("_package_LinearState"))
    (:file "_package_LinearState" :depends-on ("_package"))
    (:file "LinearStateStamped" :depends-on ("_package_LinearStateStamped"))
    (:file "_package_LinearStateStamped" :depends-on ("_package"))
    (:file "LinearStateTrajectory" :depends-on ("_package_LinearStateTrajectory"))
    (:file "_package_LinearStateTrajectory" :depends-on ("_package"))
    (:file "Vector" :depends-on ("_package_Vector"))
    (:file "_package_Vector" :depends-on ("_package"))
    (:file "VectorStamped" :depends-on ("_package_VectorStamped"))
    (:file "_package_VectorStamped" :depends-on ("_package"))
  ))