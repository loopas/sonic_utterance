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
'''def purr(self):
        self.outport.send(self.msg_on)
        self.outport.send(self.track)
        self.outport.send(self.sel)
        self.outport.send(self.alg)

        t = 0.8 + 0.0063*self.length.value

        self.outport.send(self.transp)
        #self.outport.send(self.length)
        time.sleep(t)
        #self.outport.send(self.msg_on)
        self.length.value = int(self.length.value*2)
        self.outport.send(self.length)
        self.transp.value = int(np.around(self.transp.value*0.5))
        self.outport.send(self.transp)
        self.outport.send(self.msg_on)
        time.sleep(t)

        self.outport.send(self.msg_off)'''

# Send msg_off and close outport
outport.send(msg_off)
outport.close()