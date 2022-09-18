;; Auto-generated. Do not edit!


(when (boundp 'object_msgs::Object)
  (if (not (find-package "OBJECT_MSGS"))
    (make-package "OBJECT_MSGS"))
  (shadow 'Object (find-package "OBJECT_MSGS")))
(unless (find-package "OBJECT_MSGS::OBJECT")
  (make-package "OBJECT_MSGS::OBJECT"))

(in-package "ROS")
;;//! \htmlinclude Object.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(intern "*TYPE_SPHERE*" (find-package "OBJECT_MSGS::OBJECT"))
(shadow '*TYPE_SPHERE* (find-package "OBJECT_MSGS::OBJECT"))
(defconstant object_msgs::Object::*TYPE_SPHERE* 0)
(intern "*TYPE_CUBE*" (find-package "OBJECT_MSGS::OBJECT"))
(shadow '*TYPE_CUBE* (find-package "OBJECT_MSGS::OBJECT"))
(defconstant object_msgs::Object::*TYPE_CUBE* 1)

(defun object_msgs::Object-to-symbol (const)
  (cond
        ((= const 0) 'object_msgs::Object::*TYPE_SPHERE*)
        ((= const 1) 'object_msgs::Object::*TYPE_CUBE*)
        (t nil)))

(defclass object_msgs::Object
  :super ros::object
  :slots (_position _velocity _acceleration _type _id ))

(defmethod object_msgs::Object
  (:init
   (&key
    ((:position __position) (instance geometry_msgs::Pose :init))
    ((:velocity __velocity) (instance geometry_msgs::Twist :init))
    ((:acceleration __acceleration) (instance geometry_msgs::Accel :init))
    ((:type __type) 0)
    ((:id __id) 0)
    )
   (send-super :init)
   (setq _position __position)
   (setq _velocity __velocity)
   (setq _acceleration __acceleration)
   (setq _type (round __type))
   (setq _id (round __id))
   self)
  (:position
   (&rest __position)
   (if (keywordp (car __position))
       (send* _position __position)
     (progn
       (if __position (setq _position (car __position)))
       _position)))
  (:velocity
   (&rest __velocity)
   (if (keywordp (car __velocity))
       (send* _velocity __velocity)
     (progn
       (if __velocity (setq _velocity (car __velocity)))
       _velocity)))
  (:acceleration
   (&rest __acceleration)
   (if (keywordp (car __acceleration))
       (send* _acceleration __acceleration)
     (progn
       (if __acceleration (setq _acceleration (car __acceleration)))
       _acceleration)))
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Pose _position
    (send _position :serialization-length)
    ;; geometry_msgs/Twist _velocity
    (send _velocity :serialization-length)
    ;; geometry_msgs/Accel _acceleration
    (send _acceleration :serialization-length)
    ;; uint8 _type
    1
    ;; uint8 _id
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Pose _position
       (send _position :serialize s)
     ;; geometry_msgs/Twist _velocity
       (send _velocity :serialize s)
     ;; geometry_msgs/Accel _acceleration
       (send _acceleration :serialize s)
     ;; uint8 _type
       (write-byte _type s)
     ;; uint8 _id
       (write-byte _id s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Pose _position
     (send _position :deserialize buf ptr-) (incf ptr- (send _position :serialization-length))
   ;; geometry_msgs/Twist _velocity
     (send _velocity :deserialize buf ptr-) (incf ptr- (send _velocity :serialization-length))
   ;; geometry_msgs/Accel _acceleration
     (send _acceleration :deserialize buf ptr-) (incf ptr- (send _acceleration :serialization-length))
   ;; uint8 _type
     (setq _type (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _id
     (setq _id (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get object_msgs::Object :md5sum-) "d07a5bb69ec16a74d424be15350de986")
(setf (get object_msgs::Object :datatype-) "object_msgs/Object")
(setf (get object_msgs::Object :definition-)
      "# Message Type for a Single Object

geometry_msgs/Pose position
geometry_msgs/Twist velocity
geometry_msgs/Accel acceleration

uint8 TYPE_SPHERE=0
uint8 TYPE_CUBE=1
uint8 type
uint8 id

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

================================================================================
MSG: geometry_msgs/Twist
# This expresses velocity in free space broken into its linear and angular parts.
Vector3  linear
Vector3  angular

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
================================================================================
MSG: geometry_msgs/Accel
# This expresses acceleration in free space broken into its linear and angular parts.
Vector3  linear
Vector3  angular

")



(provide :object_msgs/Object "d07a5bb69ec16a74d424be15350de986")


