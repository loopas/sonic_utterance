; Auto-generated. Do not edit!


(cl:in-package nlu-msg)


;//! \htmlinclude midi.msg.html

(cl:defclass <midi> (roslisp-msg-protocol:ros-message)
  ((midi_msg
    :reader midi_msg
    :initarg :midi_msg
    :type cl:string
    :initform "")
   (arousal
    :reader arousal
    :initarg :arousal
    :type cl:float
    :initform 0.0)
   (valence
    :reader valence
    :initarg :valence
    :type cl:float
    :initform 0.0)
   (vocal
    :reader vocal
    :initarg :vocal
    :type cl:string
    :initform "")
   (note
    :reader note
    :initarg :note
    :type nlu-msg:midiNote
    :initform (cl:make-instance 'nlu-msg:midiNote))
   (control
    :reader control
    :initarg :control
    :type nlu-msg:midiCC
    :initform (cl:make-instance 'nlu-msg:midiCC)))
)

(cl:defclass midi (<midi>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <midi>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'midi)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name nlu-msg:<midi> is deprecated: use nlu-msg:midi instead.")))

(cl:ensure-generic-function 'midi_msg-val :lambda-list '(m))
(cl:defmethod midi_msg-val ((m <midi>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nlu-msg:midi_msg-val is deprecated.  Use nlu-msg:midi_msg instead.")
  (midi_msg m))

(cl:ensure-generic-function 'arousal-val :lambda-list '(m))
(cl:defmethod arousal-val ((m <midi>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nlu-msg:arousal-val is deprecated.  Use nlu-msg:arousal instead.")
  (arousal m))

(cl:ensure-generic-function 'valence-val :lambda-list '(m))
(cl:defmethod valence-val ((m <midi>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nlu-msg:valence-val is deprecated.  Use nlu-msg:valence instead.")
  (valence m))

(cl:ensure-generic-function 'vocal-val :lambda-list '(m))
(cl:defmethod vocal-val ((m <midi>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nlu-msg:vocal-val is deprecated.  Use nlu-msg:vocal instead.")
  (vocal m))

(cl:ensure-generic-function 'note-val :lambda-list '(m))
(cl:defmethod note-val ((m <midi>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nlu-msg:note-val is deprecated.  Use nlu-msg:note instead.")
  (note m))

(cl:ensure-generic-function 'control-val :lambda-list '(m))
(cl:defmethod control-val ((m <midi>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nlu-msg:control-val is deprecated.  Use nlu-msg:control instead.")
  (control m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <midi>) ostream)
  "Serializes a message object of type '<midi>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'midi_msg))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'midi_msg))
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
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'vocal))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'vocal))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'note) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'control) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <midi>) istream)
  "Deserializes a message object of type '<midi>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'midi_msg) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'midi_msg) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
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
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'vocal) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'vocal) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'note) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'control) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<midi>)))
  "Returns string type for a message object of type '<midi>"
  "nlu/midi")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'midi)))
  "Returns string type for a message object of type 'midi"
  "nlu/midi")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<midi>)))
  "Returns md5sum for a message object of type '<midi>"
  "89ac7e18db078d2e326de3ebee350de8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'midi)))
  "Returns md5sum for a message object of type 'midi"
  "89ac7e18db078d2e326de3ebee350de8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<midi>)))
  "Returns full string definition for message of type '<midi>"
  (cl:format cl:nil "string    midi_msg~%float32   arousal~%float32   valence~%string    vocal~%midiNote  note~%midiCC  control~%~%~%================================================================================~%MSG: nlu/midiNote~%uint8   channel~%uint8   note~%uint8   velocity~%~%~%================================================================================~%MSG: nlu/midiCC~%uint16[]  channel~%uint16[]  control~%int16[]   value~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'midi)))
  "Returns full string definition for message of type 'midi"
  (cl:format cl:nil "string    midi_msg~%float32   arousal~%float32   valence~%string    vocal~%midiNote  note~%midiCC  control~%~%~%================================================================================~%MSG: nlu/midiNote~%uint8   channel~%uint8   note~%uint8   velocity~%~%~%================================================================================~%MSG: nlu/midiCC~%uint16[]  channel~%uint16[]  control~%int16[]   value~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <midi>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'midi_msg))
     4
     4
     4 (cl:length (cl:slot-value msg 'vocal))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'note))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'control))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <midi>))
  "Converts a ROS message object to a list"
  (cl:list 'midi
    (cl:cons ':midi_msg (midi_msg msg))
    (cl:cons ':arousal (arousal msg))
    (cl:cons ':valence (valence msg))
    (cl:cons ':vocal (vocal msg))
    (cl:cons ':note (note msg))
    (cl:cons ':control (control msg))
))
