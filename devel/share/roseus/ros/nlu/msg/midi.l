;; Auto-generated. Do not edit!


(when (boundp 'nlu::midi)
  (if (not (find-package "NLU"))
    (make-package "NLU"))
  (shadow 'midi (find-package "NLU")))
(unless (find-package "NLU::MIDI")
  (make-package "NLU::MIDI"))

(in-package "ROS")
;;//! \htmlinclude midi.msg.html


(defclass nlu::midi
  :super ros::object
  :slots (_midi_msg _arousal _valence _vocal _note _control ))

(defmethod nlu::midi
  (:init
   (&key
    ((:midi_msg __midi_msg) "")
    ((:arousal __arousal) 0.0)
    ((:valence __valence) 0.0)
    ((:vocal __vocal) "")
    ((:note __note) (instance nlu::midiNote :init))
    ((:control __control) (instance nlu::midiCC :init))
    )
   (send-super :init)
   (setq _midi_msg (string __midi_msg))
   (setq _arousal (float __arousal))
   (setq _valence (float __valence))
   (setq _vocal (string __vocal))
   (setq _note __note)
   (setq _control __control)
   self)
  (:midi_msg
   (&optional __midi_msg)
   (if __midi_msg (setq _midi_msg __midi_msg)) _midi_msg)
  (:arousal
   (&optional __arousal)
   (if __arousal (setq _arousal __arousal)) _arousal)
  (:valence
   (&optional __valence)
   (if __valence (setq _valence __valence)) _valence)
  (:vocal
   (&optional __vocal)
   (if __vocal (setq _vocal __vocal)) _vocal)
  (:note
   (&rest __note)
   (if (keywordp (car __note))
       (send* _note __note)
     (progn
       (if __note (setq _note (car __note)))
       _note)))
  (:control
   (&rest __control)
   (if (keywordp (car __control))
       (send* _control __control)
     (progn
       (if __control (setq _control (car __control)))
       _control)))
  (:serialization-length
   ()
   (+
    ;; string _midi_msg
    4 (length _midi_msg)
    ;; float32 _arousal
    4
    ;; float32 _valence
    4
    ;; string _vocal
    4 (length _vocal)
    ;; nlu/midiNote _note
    (send _note :serialization-length)
    ;; nlu/midiCC _control
    (send _control :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _midi_msg
       (write-long (length _midi_msg) s) (princ _midi_msg s)
     ;; float32 _arousal
       (sys::poke _arousal (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _valence
       (sys::poke _valence (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; string _vocal
       (write-long (length _vocal) s) (princ _vocal s)
     ;; nlu/midiNote _note
       (send _note :serialize s)
     ;; nlu/midiCC _control
       (send _control :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _midi_msg
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _midi_msg (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float32 _arousal
     (setq _arousal (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _valence
     (setq _valence (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; string _vocal
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _vocal (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; nlu/midiNote _note
     (send _note :deserialize buf ptr-) (incf ptr- (send _note :serialization-length))
   ;; nlu/midiCC _control
     (send _control :deserialize buf ptr-) (incf ptr- (send _control :serialization-length))
   ;;
   self)
  )

(setf (get nlu::midi :md5sum-) "89ac7e18db078d2e326de3ebee350de8")
(setf (get nlu::midi :datatype-) "nlu/midi")
(setf (get nlu::midi :definition-)
      "string    midi_msg
float32   arousal
float32   valence
string    vocal
midiNote  note
midiCC  control


================================================================================
MSG: nlu/midiNote
uint8   channel
uint8   note
uint8   velocity


================================================================================
MSG: nlu/midiCC
uint16[]  channel
uint16[]  control
int16[]   value

")



(provide :nlu/midi "89ac7e18db078d2e326de3ebee350de8")


