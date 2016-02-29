#!/usr/bin/env python

import rospy, decimal, mido, time, random
from mido import Message
import numpy as np

class Value:
    def __init__(self, name, notechannel, notenote, notevelocity, ccchannel = [], cccontrol = [], ccvalue = []):
        self.name = name
        self.notechannel = notechannel
        self.notenote = notenote
        self.notevelocity = notevelocity
        self.ccchannel = ccchannel
        self.cccontrol = cccontrol
        self.ccvalue = ccvalue

class Rangeparams:
    def __init__(self, select, num_params, aroval_data = [2], limitaro = [2], inf_val = [], sup_val = []):
        self.select = select
        self.num_params = num_params
        self.aroval_data = aroval_data
        self.limitaro = limitaro
        self.inf_val = inf_val
        self.sup_val = sup_val

    def get_Pout(self): # Make the utterance depends on the valence too if necessary
        Pinp = [0 for columns in range(self.num_params)]
        P = [0 for columns in range(self.num_params)]
        for k in range(self.num_params):
            Pinp[k] = np.linspace(self.inf_val[k], self.sup_val[k], abs(self.sup_val[k] - self.inf_val[k]) + 1) # Min, max and n of samples
            if self.inf_val[k] > self.sup_val[k]: # Inverse proportional relation 
                P[k] = (self.aroval_data[0] - self.limitaro[1])*(max(Pinp[k]) - min(Pinp[k]))/(self.limitaro[0] - self.limitaro[1]) + min(Pinp[k])
            else: # Direct proportional relation 
                P[k] = (self.aroval_data[0] - self.limitaro[0])*(max(Pinp[k]) - min(Pinp[k]))/(self.limitaro[1] - self.limitaro[0]) + min(Pinp[k])

        Pout = np.array(np.append(self.select, np.array(P))).tolist() 

        return Pout

class Set_midi:
    def __init__(self, cn, n, vel, ccc = [], ctrl = [], val = []):
        self.cn = cn
        self.n = n
        self.vel = vel
        self.ccc = ccc
        self.ctrl = ctrl
        self.val = val

    def knob(self):
        msg_on = Message('note_on', channel = self.cn, note = self.n, velocity = self.vel, time = 0)
        msg_off = Message('note_off', channel = self.cn, note = self.n, velocity = self.vel, time = 0) 
        track = Message('control_change', channel = self.ccc[0], control = self.ctrl[0], value = 0)
        sel = Message('control_change', channel = self.ccc[1], control = self.ctrl[1], value = self.val[0]) # This vector has been set in the controller_node by hand        
        
        if self.ccc[0] == 0: # if track = 0
            track_off1 = Message('control_change', channel = 1, control = self.ctrl[0], value = 120)
            track_off2 = Message('control_change', channel = 2, control = self.ctrl[0], value = 120)
            if self.val[0] in range(0, 63): # yuhuu
                transp = Message('control_change', channel = self.ccc[2], control = self.ctrl[2], value = self.val[1])
                rate = Message('control_change', channel = self.ccc[3], control = self.ctrl[3], value = self.val[2])
                length = Message('control_change', channel = self.ccc[4], control = self.ctrl[4], value = self.val[3])
                rep = Message('control_change', channel = self.ccc[5], control = self.ctrl[5], value = self.val[4])
                pitch = Message('control_change', channel = self.ccc[6], control = self.ctrl[6], value = self.val[5])
                decay = Message('control_change', channel = self.ccc[7], control = self.ctrl[6], value = self.val[5])
                return [msg_on, msg_off, track, track_off1, track_off2, sel, transp, rate, length, rep, pitch, decay] 

            elif self.val[0] in range(63, 127): # Calm (chatter)
                transp = Message('control_change', channel = self.ccc[2], control = self.ctrl[2], value = self.val[1])
                rate = Message('control_change', channel = self.ccc[3], control = self.ctrl[3], value = self.val[2])
                length = Message('control_change', channel = self.ccc[4], control = self.ctrl[4], value = self.val[3])
                pitch = Message('control_change', channel = self.ccc[5], control = self.ctrl[5], value = self.val[4])
                return [msg_on, msg_off, track, track_off1, track_off2, sel, transp, rate, length, pitch]

        elif self.ccc[0] == 1:
            track_off1 = Message('control_change', channel = 0, control = self.ctrl[0], value = 120)
            track_off2 = Message('control_change', channel = 2, control = self.ctrl[0], value = 120)
            if self.val[0] in range(0, 127): # Doubt
                transp = Message('control_change', channel = self.ccc[2], control = self.ctrl[2], value = self.val[1])
                rate = Message('control_change', channel = self.ccc[3], control = self.ctrl[3], value = self.val[2])
                return [msg_on, msg_off, track, track_off1, track_off2, sel, transp, rate] 
            
        elif self.ccc[0] == 2:
            track_off1 = Message('control_change', channel = 0, control = self.ctrl[0], value = 120)
            track_off2 = Message('control_change', channel = 1, control = self.ctrl[0], value = 120)
            if self.val[0] in range(0, 43): # Disgust
                amount = Message('control_change', channel = self.ccc[2], control = self.ctrl[2], value = self.val[1])
                rate = Message('control_change', channel = self.ccc[3], control = self.ctrl[3], value = self.val[2])
                length = Message('control_change', channel = self.ccc[4], control = self.ctrl[4], value = self.val[3])
                pitch = Message('control_change', channel = self.ccc[5], control = self.ctrl[5], value = self.val[4])
                freq = Message('control_change', channel = self.ccc[6], control = self.ctrl[6], value = self.val[5])
                tone = Message('control_change', channel = self.ccc[7], control = self.ctrl[7], value = self.val[6])
                return [msg_on, msg_off, track, track_off1, track_off2, sel, amount, rate, length, pitch, freq, tone] 

            elif self.val[0] in range(43, 85): # Fear (the same as disgust)
                amount = Message('control_change', channel = self.ccc[2], control = self.ctrl[2], value = self.val[1])
                rate = Message('control_change', channel = self.ccc[3], control = self.ctrl[3], value = self.val[2])
                length = Message('control_change', channel = self.ccc[4], control = self.ctrl[4], value = self.val[3])
                pitch = Message('control_change', channel = self.ccc[5], control = self.ctrl[5], value = self.val[4])
                freq = Message('control_change', channel = self.ccc[6], control = self.ctrl[6], value = self.val[5])
                tone = Message('control_change', channel = self.ccc[7], control = self.ctrl[7], value = self.val[6])
                return [msg_on, msg_off, track, track_off1, track_off2, sel, amount, rate, length, pitch, freq, tone]

            elif self.val[0] in range(85, 127): # Sadness (the same as disgust)
                amount = Message('control_change', channel = self.ccc[2], control = self.ctrl[2], value = self.val[1])
                rate = Message('control_change', channel = self.ccc[3], control = self.ctrl[3], value = self.val[2])
                length = Message('control_change', channel = self.ccc[4], control = self.ctrl[4], value = self.val[3])
                pitch = Message('control_change', channel = self.ccc[5], control = self.ctrl[5], value = self.val[4])
                freq = Message('control_change', channel = self.ccc[6], control = self.ctrl[6], value = self.val[5])
                tone = Message('control_change', channel = self.ccc[7], control = self.ctrl[7], value = self.val[6])
                return [msg_on, msg_off, track, track_off1, track_off2, sel, amount, rate, length, pitch, freq, tone]

class Utterance:
    def __init__(self, outport, msg_on, msg_off, track, track_off1, track_off2, sel, transp, rate, amount, length, rep, pitch, decay, freq, tone):
        self.outport = outport
        self.msg_on = msg_on
        self.msg_off = msg_off
        self.track = track
        self.track_off1 = track_off1
        self.track_off2 = track_off2
        self.sel = sel
        self.transp = transp
        self.rate = rate
        self.amount = amount
        self.length = length
        self.rep = rep
        self.pitch = pitch
        self.decay = decay
        self.freq = freq
        self.tone = tone 

# Pleasure
   
    def yuhuu(self): # Not done
        self.outport.send(self.msg_on)
        self.outport.send(self.track)
        self.outport.send(self.track_off1)
        self.outport.send(self.track_off2)
        self.outport.send(self.sel)
        self.outport.send(self.transp)
        self.outport.send(self.rate)
        self.outport.send(self.length)
        self.outport.send(self.rep)
        self.outport.send(self.pitch)
        self.outport.send(self.decay)

        time.sleep(.230) # Time related to rate
        self.rate.value = self.rate.value - 35
        self.length.value = random.randrange(25, 35)
        self.outport.send(self.rate)
        self.outport.send(self.length) 
        time.sleep(.200) # Time related to rep*rate
        self.length.value = 60
        self.pitch.value = 27
        self.decay.value = 100
        self.outport.send(self.transp)
        self.outport.send(self.length)
        self.outport.send(self.pitch)
        self.outport.send(self.decay)

        self.outport.send(self.msg_off)

    def calm(self): # Chatter
        transp0 = self.transp.value
        rate0 = self.rate.value

        self.outport.send(self.msg_on)
        self.outport.send(self.track)
        self.outport.send(self.track_off1)
        self.outport.send(self.track_off2)
        self.outport.send(self.sel)
        self.outport.send(self.length)
        while True: # This loop works while this method is called, isn't it?????
            self.transp.value = random.randrange(transp0, transp0 + 30)
            self.rate.value = random.randrange(rate0 - 30, rate0)
            self.pitch.value = random.randrange(0, 127)
            self.outport.send(self.transp)
            self.outport.send(self.rate)
            self.outport.send(self.pitch)
        self.outport.send(self.msg_off)

# Neutral

    def doubt(self):
        transp0 = self.transp.value
        rate0 = self.rate.value

        self.outport.send(self.msg_on)
        self.outport.send(self.track)
        self.outport.send(self.track_off1)
        self.outport.send(self.track_off2)
        self.outport.send(self.sel)
        
        for i in range (20, 65):
            self.transp.value = i + int(np.around(0.8*transp0))
            time.sleep(0.0001*rate0)
            self.outport.send(self.transp)
        self.outport.send(self.msg_off)
        time.sleep(0.5)

# Displeasure

    def disgust(self): 
        self.outport.send(self.msg_on)
        self.outport.send(self.track)
        self.outport.send(self.track_off1)
        self.outport.send(self.track_off2)
        self.outport.send(self.sel)
        self.outport.send(self.amount)
        self.outport.send(self.rate)
        self.outport.send(self.length)
        self.outport.send(self.pitch)
        self.outport.send(self.freq)
        self.outport.send(self.tone)
        time.sleep(.3)
        self.outport.send(self.msg_off)

    def fear(self): # (the same as disgust)
        self.outport.send(self.msg_on)
        self.outport.send(self.track)
        self.outport.send(self.track_off1)
        self.outport.send(self.track_off2)
        self.outport.send(self.sel)
        self.outport.send(self.amount)
        self.outport.send(self.rate)
        self.outport.send(self.length)
        self.outport.send(self.pitch)
        self.outport.send(self.freq)
        self.outport.send(self.tone)
        time.sleep(.3)
        self.outport.send(self.msg_off)

    def sad(self): # (the same as disgust)
        self.outport.send(self.msg_on)
        self.outport.send(self.track)
        self.outport.send(self.track_off1)
        self.outport.send(self.track_off2)
        self.outport.send(self.sel)
        self.outport.send(self.amount)
        self.outport.send(self.rate)
        self.outport.send(self.length)
        self.outport.send(self.pitch)
        self.outport.send(self.freq)
        self.outport.send(self.tone)
        time.sleep(.3)
        self.outport.send(self.msg_off)