; Auto-generated. Do not edit!


(cl:in-package nlu-msg)


;//! \htmlinclude croaches.msg.html

(cl:defclass <croaches> (roslisp-msg-protocol:ros-message)
  ((event
    :reader event
    :initarg :event
    :type cl:integer
    :initform 0)
   (frequency
    :reader frequency
    :initarg :frequency
    :type cl:float
    :initform 0.0)
   (number_killed
    :reader number_killed
    :initarg :number_killed
    :type cl:integer
    :initform 0)
   (number_created
    :reader number_created
    :initarg :number_created
    :type cl:integer
    :initform 0)
   (time_stamp
    :reader time_stamp
    :initarg :time_stamp
    :type cl:integer
    :initform 0)
   (life
    :reader life
    :initarg :life
    :type cl:integer
    :initform 0))
)

(cl:defclass croaches (<croaches>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <croaches>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'croaches)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name nlu-msg:<croaches> is deprecated: use nlu-msg:croaches instead.")))

(cl:ensure-generic-function 'event-val :lambda-list '(m))
(cl:defmethod event-val ((m <croaches>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nlu-msg:event-val is deprecated.  Use nlu-msg:event instead.")
  (event m))

(cl:ensure-generic-function 'frequency-val :lambda-list '(m))
(cl:defmethod frequency-val ((m <croaches>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nlu-msg:frequency-val is deprecated.  Use nlu-msg:frequency instead.")
  (frequency m))

(cl:ensure-generic-function 'number_killed-val :lambda-list '(m))
(cl:defmethod number_killed-val ((m <croaches>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nlu-msg:number_killed-val is deprecated.  Use nlu-msg:number_killed instead.")
  (number_killed m))

(cl:ensure-generic-function 'number_created-val :lambda-list '(m))
(cl:defmethod number_created-val ((m <croaches>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nlu-msg:number_created-val is deprecated.  Use nlu-msg:number_created instead.")
  (number_created m))

(cl:ensure-generic-function 'time_stamp-val :lambda-list '(m))
(cl:defmethod time_stamp-val ((m <croaches>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nlu-msg:time_stamp-val is deprecated.  Use nlu-msg:time_stamp instead.")
  (time_stamp m))

(cl:ensure-generic-function 'life-val :lambda-list '(m))
(cl:defmethod life-val ((m <croaches>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nlu-msg:life-val is deprecated.  Use nlu-msg:life instead.")
  (life m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <croaches>) ostream)
  "Serializes a message object of type '<croaches>"
  (cl:let* ((signed (cl:slot-value msg 'event)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'frequency))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'number_killed)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'number_created)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'time_stamp)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'life)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <croaches>) istream)
  "Deserializes a message object of type '<croaches>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'event) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'frequency) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'number_killed) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'number_created) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'time_stamp) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'life) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<croaches>)))
  "Returns string type for a message object of type '<croaches>"
  "nlu/croaches")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'croaches)))
  "Returns string type for a message object of type 'croaches"
  "nlu/croaches")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<croaches>)))
  "Returns md5sum for a message object of type '<croaches>"
  "ac9bc09e5adba2f5d3b5afafdfe74769")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'croaches)))
  "Returns md5sum for a message object of type 'croaches"
  "ac9bc09e5adba2f5d3b5afafdfe74769")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<croaches>)))
  "Returns full string definition for message of type '<croaches>"
  (cl:format cl:nil "int32    event~%float32    frequency~%int32    number_killed~%int32    number_created~%int32    time_stamp~%int32    life ~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'croaches)))
  "Returns full string definition for message of type 'croaches"
  (cl:format cl:nil "int32    event~%float32    frequency~%int32    number_killed~%int32    number_created~%int32    time_stamp~%int32    life ~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <croaches>))
  (cl:+ 0
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <croaches>))
  "Converts a ROS message object to a list"
  (cl:list 'croaches
    (cl:cons ':event (event msg))
    (cl:cons ':frequency (frequency msg))
    (cl:cons ':number_killed (number_killed msg))
    (cl:cons ':number_created (number_created msg))
    (cl:cons ':time_stamp (time_stamp msg))
    (cl:cons ':life (life msg))
))
