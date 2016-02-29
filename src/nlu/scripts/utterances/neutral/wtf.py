#!/usr/bin/env python

import mido, time, random
from mido import Message
import numpy as np

# WTF (IN AFFECTION)

# Define controls
msg_on = Message('note_on', channel = 3, note = 60, velocity = 90, time = 0)
msg_off = Message('note_off', channel = 3, note = 60, velocity = 90, time = 0) 

track = Message('control_change', channel = 0, control = 12, value = 1)
sel = Message('control_change', channel = 3, control = 12, value = 89)
amount = Message('control_change', channel = 7, control = 12, value = 80)
pitch = Message('control_change', channel = 9, control = 12, value = 80)

# Create output
outport = mido.open_output()

# Algorithm 1
# Send MIDI
outport.send(msg_on)
outport.send(track)
outport.send(sel)
outport.send(amount)
for i in range (1, 6):
	j = random.randrange(50, 127)
	k = random.randrange(50, 127)
	for l in range (j, k):
	    pitch.value = l
	    time.sleep(0.03)
	    outport.send(pitch)
	time.sleep(0.5)

# Send msg_off and close outport
outport.send(msg_off)
outport.close()