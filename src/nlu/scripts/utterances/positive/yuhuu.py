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

transp = Message('control_change', channel = 4, control = 12, value = 90) # 75 - 90
rate = Message('control_change', channel = 5, control = 12, value = 95) # 85 - 95
length = Message('control_change', channel = 6, control = 12, value = 40) # 30 - 40
rep = Message('control_change', channel = 8, control = 12, value = 38) # 38
pitch = Message('control_change', channel = 9, control = 12, value = 100) # 90 - 100
decay = Message('control_change', channel = 10, control = 12, value = 76) # 86 - 76

# Create output
outport = mido.open_output()

# Algorithm: the more arousal the more transp and length of the first note (ralentize)
# Send MIDI
outport.send(msg_on)
outport.send(track)
outport.send(sel)
outport.send(transp)
outport.send(rate)
outport.send(length)
outport.send(rep)
outport.send(pitch)
outport.send(decay)

time.sleep(.230) # Time related to rate
rate.value = 60
length.value = 35
outport.send(rate)
outport.send(length) 
time.sleep(.200) # Time related to rep*rate
length.value = 60
pitch.value = 27
decay.value = 100
outport.send(transp)
outport.send(length)
outport.send(pitch)
outport.send(decay)

# Send msg_off and close outport
outport.send(msg_off)
outport.close()