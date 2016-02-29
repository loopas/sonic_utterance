; Auto-generated. Do not edit!


(cl:in-package nlu-msg)


;//! \htmlinclude aroval.msg.html

(cl:defclass <aroval> (roslisp-msg-protocol:ros-message)
  ((arousal
    :reader arousal
    :initarg :arousal
    :type cl:float
    :initform 0.0)
   (valence
    :reader valence
    :initarg :valence
    :type cl:float
    :initform 0.0))
)

(cl:defclass aroval (<aroval>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <aroval>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'aroval)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name nlu-msg:<aroval> is deprecated: use nlu-msg:aroval instead.")))

(cl:ensure-generic-function 'arousal-val :lambda-list '(m))
(cl:defmethod arousal-val ((m <aroval>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nlu-msg:arousal-val is deprecated.  Use nlu-msg:arousal instead.")
  (arousal m))

(cl:ensure-generic-function 'valence-val :lambda-list '(m))
(cl:defmethod valence-val ((m <aroval>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nlu-msg:valence-val is deprecated.  Use nlu-msg:valence instead.")
  (valence m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <aroval>) ostream)
  "Serializes a message object of type '<aroval>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'arousal))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'valence))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <aroval>) istream)
  "Deserializes a message object of type '<aroval>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'arousal) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'valence) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<aroval>)))
  "Returns string type for a message object of type '<aroval>"
  "nlu/aroval")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'aroval)))
  "Returns string type for a message object of type 'aroval"
  "nlu/aroval")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<aroval>)))
  "Returns md5sum for a message object of type '<aroval>"
  "deb93fb762dda020985704a2147802dd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'aroval)))
  "Returns md5sum for a message object of type 'aroval"
  "deb93fb762dda020985704a2147802dd")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<aroval>)))
  "Returns full string definition for message of type '<aroval>"
  (cl:format cl:nil "float32   arousal~%float32   valence~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'aroval)))
  "Returns full string definition for message of type 'aroval"
  (cl:format cl:nil "float32   arousal~%float32   valence~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <aroval>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <aroval>))
  "Converts a ROS message object to a list"
  (cl:list 'aroval
    (cl:cons ':arousal (arousal msg))
    (cl:cons ':valence (valence msg))
))
