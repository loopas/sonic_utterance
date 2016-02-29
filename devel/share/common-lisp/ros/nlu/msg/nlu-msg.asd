
(cl:in-package :asdf)

(defsystem "nlu-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "midi" :depends-on ("_package_midi"))
    (:file "_package_midi" :depends-on ("_package"))
    (:file "aroval" :depends-on ("_package_aroval"))
    (:file "_package_aroval" :depends-on ("_package"))
    (:file "midiCC" :depends-on ("_package_midiCC"))
    (:file "_package_midiCC" :depends-on ("_package"))
    (:file "midiNote" :depends-on ("_package_midiNote"))
    (:file "_package_midiNote" :depends-on ("_package"))
    (:file "croaches" :depends-on ("_package_croaches"))
    (:file "_package_croaches" :depends-on ("_package"))
  ))