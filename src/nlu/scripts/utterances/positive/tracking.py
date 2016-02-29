#!/usr/bin/env python

import mido, time
from mido import Message
import numpy as np

# TRACKING (IN SATISFACTION)

# Define controls
msg_on = Message('note_on', channel = 3, note = 60, velocity = 90, time = 0)
msg_off = Message('note_off', channel = 3, note = 60, velocity = 90, time = 0) 

track = Message('control_change', channel = 0, control = 12, value = 4)
sel = Message('control_change', channel = 3, control = 12, value = 4)
transp = Message('control_change', channel = 4, control = 12, value = 60)
rate = Message('control_change', channel = 5, control = 12, value = 94)
length = Message('control_change', channel = 6, control = 12, value = 40)
rep = Message('control_change', channel = 8, control = 12, value = 38)
pitch = Message('control_change', channel = 9, control = 12, value = 101)
decay = Message('control_change', channel = 10, control = 12, value = 76)

# Create output
outport = mido.open_output()

# Algorithm 1
# Send MIDI
outport.send(msg_on)
outport.send(track)
outport.send(sel)
outport.send(rate)
outport.send(length)
outport.send(rep)
outport.send(pitch) # Variating this from each kill
outport.send(decay)
for i in range(0,5):
	transp.value = 60 + 5*i
	outport.send(msg_on)
	outport.send(transp)
	time.sleep(0.2)

time.sleep(0.3)


# Send msg_off and close outport
outport.send(msg_off)
outport.close()