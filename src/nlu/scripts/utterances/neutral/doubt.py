#!/usr/bin/env python

import mido, time
from mido import Message
import numpy as np

# DOUBT

# Define controls
msg_on = Message('note_on', channel = 3, note = 60, velocity = 90, time = 0)
msg_off = Message('note_off', channel = 3, note = 60, velocity = 90, time = 0) 

track = Message('control_change', channel = 1, control = 12, value = 1)
sel = Message('control_change', channel = 3, control = 12, value = 1)

transp = Message('control_change', channel = 4, control = 12, value = 70) # 40 - 70
rate = Message('control_change', channel = 4, control = 12, value = 15) # 15 - 30

# Create output
outport = mido.open_output()

# Algorithm 1
# Send MIDI
transp0 = transp.value
rate0 = rate.value

outport.send(msg_on)
outport.send(track)
outport.send(sel)
for i in range (20, 65):
    transp.value = i + int(np.around(0.8*transp0))
    time.sleep(0.0001*rate0) # 0.0015 - 0.003
    outport.send(transp)
outport.send(msg_off)
time.sleep(0.5)

# Send msg_off and close outport
outport.close()