#!/usr/bin/env python

import rospy, vocal
import numpy as np
from nlu.msg import midi, midiNote, midiCC, aroval

class Controller:
    def __init__(self):
        pass
        
    def callback(self, data):
        arousal = data.arousal
        valence = data.valence
        rospy.loginfo("Arousal: %f", arousal)
        rospy.loginfo("Valence: %f", valence)
        aroval_data = [arousal, valence]
        mid = Set_mid(aroval_data, [0, 0.333, 0.667, 1], [-0.5, -0.167, 0, 0.167, 0.5])
        self.pub.publish(mid.range()) # Publishes the values to the 'link' topic
        rospy.loginfo(mid.range()) # Prints the msgs to screen, and writes them to the Node's log file and to rosout

    def node(self):
        rospy.init_node('controller', anonymous=True)
        rospy.Subscriber("stream2", aroval, self.callback) # Listening from the aro/val node
        self.pub = rospy.Publisher('link', midi, queue_size=1) #Publishing the topic 'link'
        rate = rospy.Rate(1) # 1hz
        rospy.spin()

  # Construct the control method
class Set_mid:
    def __init__(self, aroval_data, limitaro = [], limitval = []): # min and max are the limits of the clusters in aro/val graphic
        self.aroval_data = aroval_data
        self.limitaro = limitaro
        self.limitval = limitval

    def range(self): # The selection of the nlu is up to the val/aro inputs (mapping). The variation of the utterance only relies on the value of the arousal!!!

        if self.limitaro[1] <= self.aroval_data[0] <= self.limitaro[3] and self.limitval[3] <= self.aroval_data[1] <= self.limitval[4]:
            # yuhuu
            ryuhuu = vocal.Rangeparams(0, 6, self.aroval_data, [self.limitaro[1], self.limitaro[3]], [75, 85, 30, 38, 90, 86], [90, 95, 40, 38, 100, 76])
            yuhuu_chan = [0, 3, 4, 5, 6, 8, 9, 10]
            yuhuu_cont = [12, 12, 12, 12, 12, 12, 12, 12]
            yuhuu_val = ryuhuu.get_Pout()
            voc = vocal.Value('YUHUU', 2, 60, 90, yuhuu_chan, yuhuu_cont, yuhuu_val) # Arrange the values for subsequent inclusion in the msg
            r = ryuhuu

        #elif self.limitaro[0] <= self.aroval_data[0] <= self.limitaro[1] and self.limitval[3] <= self.aroval_data[1] <= self.limitval[4]:
            # calm (chatter)
         #   rcalm = vocal.Rangeparams(120, 4, self.aroval_data, [self.limitaro[0], self.limitaro[1]], [30, 60, 19, 56], [70, 30, 19, 56])
          #  calm_chan = [0, 3, 4, 5, 6, 9]
           # calm_cont = [12, 12, 12, 12, 12, 12]
            #calm_val = rcalm.get_Pout()
            #voc = vocal.Value('CALM', 2, 60, 90, calm_chan, calm_cont, calm_val)
            #r = rcalm

        elif self.limitaro[2] <= self.aroval_data[0] <= self.limitaro[3] and self.limitval[2] <= self.aroval_data[1] <= self.limitval[3]:
            # doubt
            rdoubt = vocal.Rangeparams(0, 2, self.aroval_data, [self.limitaro[2], self.limitaro[3]], [40, 15], [70, 30])
            doubt_chan = [1, 3, 4]
            doubt_cont = [12, 12, 12]
            doubt_val = rdoubt.get_Pout()
            voc = vocal.Value('DOUBT', 2, 60, 90, doubt_chan, doubt_cont, doubt_val)
            r = rdoubt

        elif self.limitaro[1] <= self.aroval_data[0] <= self.limitaro[2] and self.limitval[0] <= self.aroval_data[1] <= self.limitval[3] or self.limitaro[0] <= self.aroval_data[0] <= self.limitaro[1] and self.limitval[1] <= self.aroval_data[1] <= self.limitval[3]:
            # disgust
            rdisgust = vocal.Rangeparams(0, 6, self.aroval_data, [self.limitaro[0], self.limitaro[2]], [63, 127, 45, 64, 0, 63], [127, 127, 45, 127, 127, 127])
            disgust_chan = [2, 3, 4, 5, 6, 7, 8, 9]
            disgust_cont = [12, 12, 12, 12, 12, 12, 12, 12]
            disgust_val = rdisgust.get_Pout()
            voc = vocal.Value('DISGUST', 2, 60, 90, disgust_chan, disgust_cont, disgust_val)
            r = rdisgust

        elif self.limitaro[2] <= self.aroval_data[0] <= self.limitaro[3] and self.limitval[0] <= self.aroval_data[1] <= self.limitval[2]:
            # fear
            rfear = vocal.Rangeparams(44, 6, self.aroval_data, [self.limitaro[2], self.limitaro[3]], [57, 10, 83, 63, 50, 10], [127, 40, 67, 63, 0, 100])
            fear_chan = [2, 3, 4, 5, 6, 7, 8, 9]
            fear_cont = [12, 12, 12, 12, 12, 12, 12, 12]
            fear_val = rfear.get_Pout()
            voc = vocal.Value('FEAR', 2, 60, 90, fear_chan, fear_cont, fear_val) 
            r = rfear

        elif self.limitaro[0] <= self.aroval_data[0] <= self.limitaro[1] and self.limitval[0] <= self.aroval_data[1] <= self.limitval[1]:
            # sadness
            rsad = vocal.Rangeparams(88, 6, self.aroval_data, [self.limitaro[0], self.limitaro[1]], [44, 77, 89, 97, 94, 27], [74, 127, 89, 127, 34, 127]) 
            sad_chan = [2, 3, 4, 5, 6, 7, 8, 9]
            sad_cont = [12, 12, 12, 12, 12, 12, 12, 12]
            sad_val = rsad.get_Pout()
            voc = vocal.Value('SADNESS', 2, 60, 90, sad_chan, sad_cont, sad_val) 
            r = rsad

        mid = midi() # Asigning values to the msg variables

        mid.arousal = np.around(r.aroval_data[0], 3)
        mid.valence = np.around(r.aroval_data[1], 3)
        mid.vocal = voc.name
        mid.note.channel = voc.notechannel
        mid.note.note = voc.notenote
        mid.note.velocity = voc.notevelocity
        mid.control.channel = voc.ccchannel
        mid.control.control = voc.cccontrol
        mid.control.value = voc.ccvalue

        return mid

#main test

c = Controller()
print(c.node())