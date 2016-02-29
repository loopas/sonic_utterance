#!/usr/bin/env python

import mido, time
from mido import Message
import numpy as np

# YUHUU (IN JOY)

# Define controls
msg_on = Message('note_on', channel = 3, note = 60, velocity = 90, time = 0)
msg_off = Message('note_off', channel = 3, note = 60, velocity = 90, time = 0) 

track = Message('control_change', channel = 0, control = 12, value = 1)
sel = Message('control_change', channel = 3, control = 12, value = 1)

transp = Message('control_change', channel = 4, control = 12, value = ) 
length = Message('control_change', channel = 5, control = 12, value = ) 
alg = Message('control_change', channel = 6, control = 12, value = ) 
rep = Message('control_change', channel = 8, control = 12, value = )

# Create output
outport = mido.open_output()

# Algorithm: the more arousal the more transp and length of the first note (ralentize)
# Send MIDI
'''def corr(self): 
        self.outport.send(self.msg_on)
        self.outport.send(self.track)
        self.outport.send(self.sel)
        self.outport.send(self.length)

        stv1 = self.transp.value
        stv2 = self.transp.value

        t = 0.135 + 0.0041*self.length.value
        
        for i in range (0,11):
            stv1 = stv2 + i
            self.transp.value = stv1
            self.outport.send(self.transp)
            time.sleep(0.03*t)
            
        self.outport.send(self.msg_off)
        time.sleep(.3*t)
        self.transp.value = stv1 - 10
        
        time.sleep(.2)
        self.outport.send(self.msg_on)
        self.outport.send(self.transp)
        time.sleep(.3)

        self.outport.send(self.msg_off)'''

# Send msg_off and close outport
outport.send(msg_off)
outport.close()