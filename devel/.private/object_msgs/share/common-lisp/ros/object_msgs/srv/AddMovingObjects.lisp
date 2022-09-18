; Auto-generated. Do not edit!


(cl:in-package object_msgs-srv)


;//! \htmlinclude AddMovingObjects-request.msg.html

(cl:defclass <AddMovingObjects-request> (roslisp-msg-protocol:ros-message)
  ((num
    :reader num
    :initarg :num
    :type cl:integer
    :initform 0))
)

(cl:defclass AddMovingObjects-request (<AddMovingObjects-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AddMovingObjects-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AddMovingObjects-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name object_msgs-srv:<AddMovingObjects-request> is deprecated: use object_msgs-srv:AddMovingObjects-request instead.")))

(cl:ensure-generic-function 'num-val :lambda-list '(m))
(cl:defmethod num-val ((m <AddMovingObjects-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader object_msgs-srv:num-val is deprecated.  Use object_msgs-srv:num instead.")
  (num m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AddMovingObjects-request>) ostream)
  "Serializes a message object of type '<AddMovingObjects-request>"
  (cl:let* ((signed (cl:slot-value msg 'num)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AddMovingObjects-request>) istream)
  "Deserializes a message object of type '<AddMovingObjects-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'num) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AddMovingObjects-request>)))
  "Returns string type for a service object of type '<AddMovingObjects-request>"
  "object_msgs/AddMovingObjectsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AddMovingObjects-request)))
  "Returns string type for a service object of type 'AddMovingObjects-request"
  "object_msgs/AddMovingObjectsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AddMovingObjects-request>)))
  "Returns md5sum for a message object of type '<AddMovingObjects-request>"
  "54b3c80efd6fae6e6ffff8a4b9facd69")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AddMovingObjects-request)))
  "Returns md5sum for a message object of type 'AddMovingObjects-request"
  "54b3c80efd6fae6e6ffff8a4b9facd69")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AddMovingObjects-request>)))
  "Returns full string definition for message of type '<AddMovingObjects-request>"
  (cl:format cl:nil "# Add n moving object~%int32 num~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AddMovingObjects-request)))
  "Returns full string definition for message of type 'AddMovingObjects-request"
  (cl:format cl:nil "# Add n moving object~%int32 num~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AddMovingObjects-request>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AddMovingObjects-request>))
  "Converts a ROS message object to a list"
  (cl:list 'AddMovingObjects-request
    (cl:cons ':num (num msg))
))
;//! \htmlinclude AddMovingObjects-response.msg.html

(cl:defclass <AddMovingObjects-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass AddMovingObjects-response (<AddMovingObjects-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AddMovingObjects-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AddMovingObjects-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name object_msgs-srv:<AddMovingObjects-response> is deprecated: use object_msgs-srv:AddMovingObjects-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AddMovingObjects-response>) ostream)
  "Serializes a message object of type '<AddMovingObjects-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AddMovingObjects-response>) istream)
  "Deserializes a message object of type '<AddMovingObjects-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AddMovingObjects-response>)))
  "Returns string type for a service object of type '<AddMovingObjects-response>"
  "object_msgs/AddMovingObjectsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AddMovingObjects-response)))
  "Returns string type for a service object of type 'AddMovingObjects-response"
  "object_msgs/AddMovingObjectsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AddMovingObjects-response>)))
  "Returns md5sum for a message object of type '<AddMovingObjects-response>"
  "54b3c80efd6fae6e6ffff8a4b9facd69")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AddMovingObjects-response)))
  "Returns md5sum for a message object of type 'AddMovingObjects-response"
  "54b3c80efd6fae6e6ffff8a4b9facd69")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AddMovingObjects-response>)))
  "Returns full string definition for message of type '<AddMovingObjects-response>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AddMovingObjects-response)))
  "Returns full string definition for message of type 'AddMovingObjects-response"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AddMovingObjects-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AddMovingObjects-response>))
  "Converts a ROS message object to a list"
  (cl:list 'AddMovingObjects-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'AddMovingObjects)))
  'AddMovingObjects-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'AddMovingObjects)))
  'AddMovingObjects-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AddMovingObjects)))
  "Returns string type for a service object of type '<AddMovingObjects>"
  "object_msgs/AddMovingObjects")