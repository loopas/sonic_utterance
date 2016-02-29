;; Auto-generated. Do not edit!


(when (boundp 'nlu::midiCC)
  (if (not (find-package "NLU"))
    (make-package "NLU"))
  (shadow 'midiCC (find-package "NLU")))
(unless (find-package "NLU::MIDICC")
  (make-package "NLU::MIDICC"))

(in-package "ROS")
;;//! \htmlinclude midiCC.msg.html


(defclass nlu::midiCC
  :super ros::object
  :slots (_channel _control _value ))

(defmethod nlu::midiCC
  (:init
   (&key
    ((:channel __channel) (make-array 0 :initial-element 0 :element-type :integer))
    ((:control __control) (make-array 0 :initial-element 0 :element-type :integer))
    ((:value __value) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _channel __channel)
   (setq _control __control)
   (setq _value __value)
   self)
  (:channel
   (&optional __channel)
   (if __channel (setq _channel __channel)) _channel)
  (:control
   (&optional __control)
   (if __control (setq _control __control)) _control)
  (:value
   (&optional __value)
   (if __value (setq _value __value)) _value)
  (:serialization-length
   ()
   (+
    ;; uint16[] _channel
    (* 2    (length _channel)) 4
    ;; uint16[] _control
    (* 2    (length _control)) 4
    ;; int16[] _value
    (* 2    (length _value)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint16[] _channel
     (write-long (length _channel) s)
     (dotimes (i (length _channel))
       (write-word (elt _channel i) s)
       )
     ;; uint16[] _control
     (write-long (length _control) s)
     (dotimes (i (length _control))
       (write-word (elt _control i) s)
       )
     ;; int16[] _value
     (write-long (length _value) s)
     (dotimes (i (length _value))
       (write-word (elt _value i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint16[] _channel
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _channel (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _channel i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     ))
   ;; uint16[] _control
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _control (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _control i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     ))
   ;; int16[] _value
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _value (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _value i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     ))
   ;;
   self)
  )

(setf (get nlu::midiCC :md5sum-) "0aa03c0d63d3de89de98b89232fcb63f")
(setf (get nlu::midiCC :datatype-) "nlu/midiCC")
(setf (get nlu::midiCC :definition-)
      "uint16[]  channel
uint16[]  control
int16[]   value

")



(provide :nlu/midiCC "0aa03c0d63d3de89de98b89232fcb63f")


