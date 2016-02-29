;; Auto-generated. Do not edit!


(when (boundp 'nlu::croaches)
  (if (not (find-package "NLU"))
    (make-package "NLU"))
  (shadow 'croaches (find-package "NLU")))
(unless (find-package "NLU::CROACHES")
  (make-package "NLU::CROACHES"))

(in-package "ROS")
;;//! \htmlinclude croaches.msg.html


(defclass nlu::croaches
  :super ros::object
  :slots (_event _frequency _number_killed _number_created _time_stamp _life ))

(defmethod nlu::croaches
  (:init
   (&key
    ((:event __event) 0)
    ((:frequency __frequency) 0.0)
    ((:number_killed __number_killed) 0)
    ((:number_created __number_created) 0)
    ((:time_stamp __time_stamp) 0)
    ((:life __life) 0)
    )
   (send-super :init)
   (setq _event (round __event))
   (setq _frequency (float __frequency))
   (setq _number_killed (round __number_killed))
   (setq _number_created (round __number_created))
   (setq _time_stamp (round __time_stamp))
   (setq _life (round __life))
   self)
  (:event
   (&optional __event)
   (if __event (setq _event __event)) _event)
  (:frequency
   (&optional __frequency)
   (if __frequency (setq _frequency __frequency)) _frequency)
  (:number_killed
   (&optional __number_killed)
   (if __number_killed (setq _number_killed __number_killed)) _number_killed)
  (:number_created
   (&optional __number_created)
   (if __number_created (setq _number_created __number_created)) _number_created)
  (:time_stamp
   (&optional __time_stamp)
   (if __time_stamp (setq _time_stamp __time_stamp)) _time_stamp)
  (:life
   (&optional __life)
   (if __life (setq _life __life)) _life)
  (:serialization-length
   ()
   (+
    ;; int32 _event
    4
    ;; float32 _frequency
    4
    ;; int32 _number_killed
    4
    ;; int32 _number_created
    4
    ;; int32 _time_stamp
    4
    ;; int32 _life
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _event
       (write-long _event s)
     ;; float32 _frequency
       (sys::poke _frequency (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int32 _number_killed
       (write-long _number_killed s)
     ;; int32 _number_created
       (write-long _number_created s)
     ;; int32 _time_stamp
       (write-long _time_stamp s)
     ;; int32 _life
       (write-long _life s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _event
     (setq _event (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32 _frequency
     (setq _frequency (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int32 _number_killed
     (setq _number_killed (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _number_created
     (setq _number_created (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _time_stamp
     (setq _time_stamp (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _life
     (setq _life (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get nlu::croaches :md5sum-) "ac9bc09e5adba2f5d3b5afafdfe74769")
(setf (get nlu::croaches :datatype-) "nlu/croaches")
(setf (get nlu::croaches :definition-)
      "int32    event
float32    frequency
int32    number_killed
int32    number_created
int32    time_stamp
int32    life 
")



(provide :nlu/croaches "ac9bc09e5adba2f5d3b5afafdfe74769")


