;; Auto-generated. Do not edit!


(when (boundp 'object_msgs::AddMovingObjects)
  (if (not (find-package "OBJECT_MSGS"))
    (make-package "OBJECT_MSGS"))
  (shadow 'AddMovingObjects (find-package "OBJECT_MSGS")))
(unless (find-package "OBJECT_MSGS::ADDMOVINGOBJECTS")
  (make-package "OBJECT_MSGS::ADDMOVINGOBJECTS"))
(unless (find-package "OBJECT_MSGS::ADDMOVINGOBJECTSREQUEST")
  (make-package "OBJECT_MSGS::ADDMOVINGOBJECTSREQUEST"))
(unless (find-package "OBJECT_MSGS::ADDMOVINGOBJECTSRESPONSE")
  (make-package "OBJECT_MSGS::ADDMOVINGOBJECTSRESPONSE"))

(in-package "ROS")





(defclass object_msgs::AddMovingObjectsRequest
  :super ros::object
  :slots (_num ))

(defmethod object_msgs::AddMovingObjectsRequest
  (:init
   (&key
    ((:num __num) 0)
    )
   (send-super :init)
   (setq _num (round __num))
   self)
  (:num
   (&optional __num)
   (if __num (setq _num __num)) _num)
  (:serialization-length
   ()
   (+
    ;; int32 _num
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _num
       (write-long _num s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _num
     (setq _num (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass object_msgs::AddMovingObjectsResponse
  :super ros::object
  :slots ())

(defmethod object_msgs::AddMovingObjectsResponse
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass object_msgs::AddMovingObjects
  :super ros::object
  :slots ())

(setf (get object_msgs::AddMovingObjects :md5sum-) "54b3c80efd6fae6e6ffff8a4b9facd69")
(setf (get object_msgs::AddMovingObjects :datatype-) "object_msgs/AddMovingObjects")
(setf (get object_msgs::AddMovingObjects :request) object_msgs::AddMovingObjectsRequest)
(setf (get object_msgs::AddMovingObjects :response) object_msgs::AddMovingObjectsResponse)

(defmethod object_msgs::AddMovingObjectsRequest
  (:response () (instance object_msgs::AddMovingObjectsResponse :init)))

(setf (get object_msgs::AddMovingObjectsRequest :md5sum-) "54b3c80efd6fae6e6ffff8a4b9facd69")
(setf (get object_msgs::AddMovingObjectsRequest :datatype-) "object_msgs/AddMovingObjectsRequest")
(setf (get object_msgs::AddMovingObjectsRequest :definition-)
      "# Add n moving object
int32 num
---
")

(setf (get object_msgs::AddMovingObjectsResponse :md5sum-) "54b3c80efd6fae6e6ffff8a4b9facd69")
(setf (get object_msgs::AddMovingObjectsResponse :datatype-) "object_msgs/AddMovingObjectsResponse")
(setf (get object_msgs::AddMovingObjectsResponse :definition-)
      "# Add n moving object
int32 num
---
")



(provide :object_msgs/AddMovingObjects "54b3c80efd6fae6e6ffff8a4b9facd69")


