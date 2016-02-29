#!/usr/bin/env python

import mido, time, random
from mido import Message
import numpy as np

# TERROR (IN AFFECTION)

# Define controls
msg_on = Message('note_on', channel = 3, note = 60, velocity = 90, time = 0)
msg_off = Message('note_off', channel = 3, note = 60, velocity = 90, time = 0) 

track = Message('control_change', channel = 0, control = 12, value = 1)
sel = Message('control_change', channel = 3, control = 12, value = 89)
length = Message('control_change', channel = 6, control = 12, value = 54)
amount = Message('control_change', channel = 7, control = 12, value = 120)
pitch = Message('control_change', channel = 9, control = 12, value = 100)

# Create output
outport = mido.open_output()

# Algorithm 1
# Send MIDI
outport.send(msg_on)
outport.send(track)
outport.send(sel)
outport.send(length)
outport.send(amount)
for i in range (100, 111):
    pitch.value = i
    time.sleep(0.3)
    outport.send(pitch)
time.sleep(0.5)

# Send msg_off and close outport
outport.send(msg_off)
outport.close()