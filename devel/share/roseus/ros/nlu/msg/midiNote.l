;; Auto-generated. Do not edit!


(when (boundp 'nlu::midiNote)
  (if (not (find-package "NLU"))
    (make-package "NLU"))
  (shadow 'midiNote (find-package "NLU")))
(unless (find-package "NLU::MIDINOTE")
  (make-package "NLU::MIDINOTE"))

(in-package "ROS")
;;//! \htmlinclude midiNote.msg.html


(defclass nlu::midiNote
  :super ros::object
  :slots (_channel _note _velocity ))

(defmethod nlu::midiNote
  (:init
   (&key
    ((:channel __channel) 0)
    ((:note __note) 0)
    ((:velocity __velocity) 0)
    )
   (send-super :init)
   (setq _channel (round __channel))
   (setq _note (round __note))
   (setq _velocity (round __velocity))
   self)
  (:channel
   (&optional __channel)
   (if __channel (setq _channel __channel)) _channel)
  (:note
   (&optional __note)
   (if __note (setq _note __note)) _note)
  (:velocity
   (&optional __velocity)
   (if __velocity (setq _velocity __velocity)) _velocity)
  (:serialization-length
   ()
   (+
    ;; uint8 _channel
    1
    ;; uint8 _note
    1
    ;; uint8 _velocity
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _channel
       (write-byte _channel s)
     ;; uint8 _note
       (write-byte _note s)
     ;; uint8 _velocity
       (write-byte _velocity s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _channel
     (setq _channel (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _note
     (setq _note (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _velocity
     (setq _velocity (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get nlu::midiNote :md5sum-) "b3472d1c37f93be8434bb9e07c11582b")
(setf (get nlu::midiNote :datatype-) "nlu/midiNote")
(setf (get nlu::midiNote :definition-)
      "uint8   channel
uint8   note
uint8   velocity


")



(provide :nlu/midiNote "b3472d1c37f93be8434bb9e07c11582b")


