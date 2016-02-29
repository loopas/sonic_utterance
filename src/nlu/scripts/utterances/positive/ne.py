#!/usr/bin/env python

import mido, time
from mido import Message
import numpy as np

# NE (IN JOY)

# Define controls
msg_on = Message('note_on', channel = 3, note = 60, velocity = 90, time = 0)
msg_off = Message('note_off', channel = 3, note = 60, velocity = 90, time = 0) 

track = Message('control_change', channel = 0, control = 12, value = 1)
sel = Message('control_change', channel = 3, control = 12, value = 1)
transp = Message('control_change', channel = 4, control = 12, value = 90)
rate = Message('control_change', channel = 5, control = 12, value = 0)
length = Message('control_change', channel = 6, control = 12, value = 50)
rep = Message('control_change', channel = 8, control = 12, value = 72)
pitch = Message('control_change', channel = 9, control = 12, value = 27)
decay = Message('control_change', channel = 10, control = 12, value = 90) # Varying

# Create output
outport = mido.open_output()

# Algorithm (what reaction is?)
outport.send(track)
outport.send(sel)
outport.send(transp)
outport.send(rate)
outport.send(length)
outport.send(rep)
outport.send(pitch)
outport.send(decay)
outport.send(msg_on)
time.sleep(0.3) # Before the output closes

# Send msg_off and close outport
outport.send(msg_off)
outport.close()