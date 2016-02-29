; Auto-generated. Do not edit!


(cl:in-package nlu-msg)


;//! \htmlinclude midiCC.msg.html

(cl:defclass <midiCC> (roslisp-msg-protocol:ros-message)
  ((channel
    :reader channel
    :initarg :channel
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0))
   (control
    :reader control
    :initarg :control
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0))
   (value
    :reader value
    :initarg :value
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0)))
)

(cl:defclass midiCC (<midiCC>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <midiCC>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'midiCC)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name nlu-msg:<midiCC> is deprecated: use nlu-msg:midiCC instead.")))

(cl:ensure-generic-function 'channel-val :lambda-list '(m))
(cl:defmethod channel-val ((m <midiCC>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nlu-msg:channel-val is deprecated.  Use nlu-msg:channel instead.")
  (channel m))

(cl:ensure-generic-function 'control-val :lambda-list '(m))
(cl:defmethod control-val ((m <midiCC>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nlu-msg:control-val is deprecated.  Use nlu-msg:control instead.")
  (control m))

(cl:ensure-generic-function 'value-val :lambda-list '(m))
(cl:defmethod value-val ((m <midiCC>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nlu-msg:value-val is deprecated.  Use nlu-msg:value instead.")
  (value m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <midiCC>) ostream)
  "Serializes a message object of type '<midiCC>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'channel))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) ele) ostream))
   (cl:slot-value msg 'channel))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'control))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) ele) ostream))
   (cl:slot-value msg 'control))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'value))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    ))
   (cl:slot-value msg 'value))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <midiCC>) istream)
  "Deserializes a message object of type '<midiCC>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'channel) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'channel)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:aref vals i)) (cl:read-byte istream)))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'control) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'control)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:aref vals i)) (cl:read-byte istream)))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'value) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'value)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<midiCC>)))
  "Returns string type for a message object of type '<midiCC>"
  "nlu/midiCC")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'midiCC)))
  "Returns string type for a message object of type 'midiCC"
  "nlu/midiCC")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<midiCC>)))
  "Returns md5sum for a message object of type '<midiCC>"
  "0aa03c0d63d3de89de98b89232fcb63f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'midiCC)))
  "Returns md5sum for a message object of type 'midiCC"
  "0aa03c0d63d3de89de98b89232fcb63f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<midiCC>)))
  "Returns full string definition for message of type '<midiCC>"
  (cl:format cl:nil "uint16[]  channel~%uint16[]  control~%int16[]   value~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'midiCC)))
  "Returns full string definition for message of type 'midiCC"
  (cl:format cl:nil "uint16[]  channel~%uint16[]  control~%int16[]   value~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <midiCC>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'channel) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'control) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'value) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <midiCC>))
  "Converts a ROS message object to a list"
  (cl:list 'midiCC
    (cl:cons ':channel (channel msg))
    (cl:cons ':control (control msg))
    (cl:cons ':value (value msg))
))
