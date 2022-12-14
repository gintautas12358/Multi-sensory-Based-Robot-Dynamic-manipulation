;; Auto-generated. Do not edit!


(when (boundp 'control_core_msgs::VectorStamped)
  (if (not (find-package "CONTROL_CORE_MSGS"))
    (make-package "CONTROL_CORE_MSGS"))
  (shadow 'VectorStamped (find-package "CONTROL_CORE_MSGS")))
(unless (find-package "CONTROL_CORE_MSGS::VECTORSTAMPED")
  (make-package "CONTROL_CORE_MSGS::VECTORSTAMPED"))

(in-package "ROS")
;;//! \htmlinclude VectorStamped.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass control_core_msgs::VectorStamped
  :super ros::object
  :slots (_header _vector ))

(defmethod control_core_msgs::VectorStamped
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:vector __vector) (instance control_core_msgs::Vector :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _vector __vector)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:vector
   (&rest __vector)
   (if (keywordp (car __vector))
       (send* _vector __vector)
     (progn
       (if __vector (setq _vector (car __vector)))
       _vector)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; control_core_msgs/Vector _vector
    (send _vector :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; control_core_msgs/Vector _vector
       (send _vector :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; control_core_msgs/Vector _vector
     (send _vector :deserialize buf ptr-) (incf ptr- (send _vector :serialization-length))
   ;;
   self)
  )

(setf (get control_core_msgs::VectorStamped :md5sum-) "1af1b6b69f442d4a5deaeb506bbdee39")
(setf (get control_core_msgs::VectorStamped :datatype-) "control_core_msgs/VectorStamped")
(setf (get control_core_msgs::VectorStamped :definition-)
      "std_msgs/Header header
Vector vector
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: control_core_msgs/Vector
float64[] data
")



(provide :control_core_msgs/VectorStamped "1af1b6b69f442d4a5deaeb506bbdee39")


