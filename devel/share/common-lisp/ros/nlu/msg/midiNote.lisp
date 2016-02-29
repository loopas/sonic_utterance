; Auto-generated. Do not edit!


(cl:in-package nlu-msg)


;//! \htmlinclude midiNote.msg.html

(cl:defclass <midiNote> (roslisp-msg-protocol:ros-message)
  ((channel
    :reader channel
    :initarg :channel
    :type cl:fixnum
    :initform 0)
   (note
    :reader note
    :initarg :note
    :type cl:fixnum
    :initform 0)
   (velocity
    :reader velocity
    :initarg :velocity
    :type cl:fixnum
    :initform 0))
)

(cl:defclass midiNote (<midiNote>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <midiNote>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'midiNote)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name nlu-msg:<midiNote> is deprecated: use nlu-msg:midiNote instead.")))

(cl:ensure-generic-function 'channel-val :lambda-list '(m))
(cl:defmethod channel-val ((m <midiNote>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nlu-msg:channel-val is deprecated.  Use nlu-msg:channel instead.")
  (channel m))

(cl:ensure-generic-function 'note-val :lambda-list '(m))
(cl:defmethod note-val ((m <midiNote>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nlu-msg:note-val is deprecated.  Use nlu-msg:note instead.")
  (note m))

(cl:ensure-generic-function 'velocity-val :lambda-list '(m))
(cl:defmethod velocity-val ((m <midiNote>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nlu-msg:velocity-val is deprecated.  Use nlu-msg:velocity instead.")
  (velocity m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <midiNote>) ostream)
  "Serializes a message object of type '<midiNote>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'channel)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'note)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'velocity)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <midiNote>) istream)
  "Deserializes a message object of type '<midiNote>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'channel)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'note)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'velocity)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<midiNote>)))
  "Returns string type for a message object of type '<midiNote>"
  "nlu/midiNote")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'midiNote)))
  "Returns string type for a message object of type 'midiNote"
  "nlu/midiNote")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<midiNote>)))
  "Returns md5sum for a message object of type '<midiNote>"
  "b3472d1c37f93be8434bb9e07c11582b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'midiNote)))
  "Returns md5sum for a message object of type 'midiNote"
  "b3472d1c37f93be8434bb9e07c11582b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<midiNote>)))
  "Returns full string definition for message of type '<midiNote>"
  (cl:format cl:nil "uint8   channel~%uint8   note~%uint8   velocity~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'midiNote)))
  "Returns full string definition for message of type 'midiNote"
  (cl:format cl:nil "uint8   channel~%uint8   note~%uint8   velocity~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <midiNote>))
  (cl:+ 0
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <midiNote>))
  "Converts a ROS message object to a list"
  (cl:list 'midiNote
    (cl:cons ':channel (channel msg))
    (cl:cons ':note (note msg))
    (cl:cons ':velocity (velocity msg))
))
