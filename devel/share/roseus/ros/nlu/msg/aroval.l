;; Auto-generated. Do not edit!


(when (boundp 'nlu::aroval)
  (if (not (find-package "NLU"))
    (make-package "NLU"))
  (shadow 'aroval (find-package "NLU")))
(unless (find-package "NLU::AROVAL")
  (make-package "NLU::AROVAL"))

(in-package "ROS")
;;//! \htmlinclude aroval.msg.html


(defclass nlu::aroval
  :super ros::object
  :slots (_arousal _valence ))

(defmethod nlu::aroval
  (:init
   (&key
    ((:arousal __arousal) 0.0)
    ((:valence __valence) 0.0)
    )
   (send-super :init)
   (setq _arousal (float __arousal))
   (setq _valence (float __valence))
   self)
  (:arousal
   (&optional __arousal)
   (if __arousal (setq _arousal __arousal)) _arousal)
  (:valence
   (&optional __valence)
   (if __valence (setq _valence __valence)) _valence)
  (:serialization-length
   ()
   (+
    ;; float32 _arousal
    4
    ;; float32 _valence
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _arousal
       (sys::poke _arousal (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _valence
       (sys::poke _valence (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _arousal
     (setq _arousal (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _valence
     (setq _valence (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get nlu::aroval :md5sum-) "deb93fb762dda020985704a2147802dd")
(setf (get nlu::aroval :datatype-) "nlu/aroval")
(setf (get nlu::aroval :definition-)
      "float32   arousal
float32   valence

")



(provide :nlu/aroval "deb93fb762dda020985704a2147802dd")


