#!/usr/bin/env python

import rospy, mido, time, random, vocal
import numpy as np
from nlu.msg import midi, midiNote, midiCC
from mido import Message

from std_msgs.msg import Float32


def callback(data = []):
    #global intens, voc, cn, n, vel, ccc, ctrl, val, track
    aro = np.around(data.arousal, 1)
    vale = np.around(data.valence, 1)
    voc = data.vocal
    cn = data.note.channel
    n = data.note.note
    vel = data.note.velocity
    ccc = data.control.channel
    ctrl = data.control.control
    val = data.control.value
    
    rospy.loginfo("Arousal: %f", aro)
    rospy.loginfo("Valence: %f", vale)
    print " "

    rospy.loginfo("%s", voc)
    print " "

    rospy.loginfo("Note")
    rospy.loginfo("Channel: %d", cn)
    rospy.loginfo("Note: %d", n)
    rospy.loginfo("Velocity: %d", vel)
    print " "

    rospy.loginfo("CC")
    rospy.loginfo("Channel: " + str(ccc))
    rospy.loginfo("Control: " + str(ctrl))
    rospy.loginfo("Value: " + str(val))
    print " "
    print " "
   
    outport = mido.open_output() # Open default outport

    track = ccc[0]
    select = val[0]

    # Positive

    if track == 0:
        if select in range (0, 32): # Yuhuu
            msg_on, msg_off, track, track_off1, track_off2, sel, transp, rate, length, rep, pitch, decay = vocal.Set_midi(cn, n, vel, ccc, ctrl, val).knob() 
            yuhuu = vocal.Utterance(outport, msg_on, msg_off, track, track_off1, track_off2, sel, transp, rate, None, length, rep, pitch, decay, None, None).yuhuu()

        '''elif select in range(96, 128): # Calm (chatter)
            msg_on, msg_off, track, track_off1, track_off2, sel, transp, rate, length, pitch = vocal.Set_midi(cn, n, vel, ccc, ctrl, val).knob()
            calm = vocal.Utterance(outport, msg_on, msg_off, track, track_off1, track_off2, sel, transp, rate, None, length, None, pitch, None, None, None).calm()'''

    # Neutral

    elif track == 1:
        if select in range(0, 32): # Doubt
            msg_on, msg_off, track, track_off1, track_off2, sel, transp, rate = vocal.Set_midi(cn, n, vel, ccc, ctrl, val).knob()
            doubt = vocal.Utterance(outport, msg_on, msg_off, track, track_off1, track_off2, sel, transp, rate, None, None, None, None, None, None, None).doubt()

    # Negative
            
    elif track == 2: 
        if select in range(0, 43): # Disgust
            msg_on, msg_off, track, track_off1, track_off2, sel, amount, rate, length, pitch, freq, tone = vocal.Set_midi(cn, n, vel, ccc, ctrl, val).knob()
            disgust = vocal.Utterance(outport, msg_on, msg_off, track, track_off1, track_off2, sel, None, rate, amount, length, None, pitch, None, freq, tone).disgust()
        if select in range(43, 85): # Fear (the same as disgust)
            msg_on, msg_off, track, track_off1, track_off2, sel, amount, rate, length, pitch, freq, tone = vocal.Set_midi(cn, n, vel, ccc, ctrl, val).knob()
            fear = vocal.Utterance(outport, msg_on, msg_off, track, track_off1, track_off2, sel, None, rate, amount, length, None, pitch, None, freq, tone).fear()
        if select in range(85, 127): # Sadness (the same as disgust)
            msg_on, msg_off, track, track_off1, track_off2, sel, amount, rate, length, pitch, freq, tone = vocal.Set_midi(cn, n, vel, ccc, ctrl, val).knob()
            sad = vocal.Utterance(outport, msg_on, msg_off, track, track_off1, track_off2, sel, None, rate, amount, length, None, pitch, None, freq, tone).sad()
    outport.close() # Close default self.outport

def node():
    rospy.init_node('effector', anonymous=True)
    rospy.Subscriber('link', midi, callback)
    rospy.spin() # Keeps python from exiting until this node is stopped
        
if __name__ == '__main__':
    try:
        node()
    except rospy.ROSInterruptException:
        pass