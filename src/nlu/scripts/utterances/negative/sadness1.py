#!/usr/bin/env python

import mido, time
from mido import Message
import numpy as np

# FEAR1 (IN DISPLEASURE)

# Define controls
msg_on = Message('note_on', channel = 3, note = 60, velocity = 90, time = 0)
msg_off = Message('note_off', channel = 3, note = 60, velocity = 90, time = 0) 

track = Message('control_change', channel = 2, control = 12, value = 2)
sel = Message('control_change', channel = 3, control = 12, value = 2)

amount = Message('control_change', channel = 4, control = 12, value = 49)
rate = Message('control_change', channel = 5, control = 12, value = 76)
length = Message('control_change', channel = 6, control = 12, value = 95)
pitch = Message('control_change', channel = 7, control = 12, value = 84)
freq = Message('control_change', channel = 8, control = 12, value = 44)
tone = Message('control_change', channel = 9, control = 12, value = 127)

# Create output
outport = mido.open_output()

# Algorithm: the more arousal the more transp and length of the first note (ralentize)
# Send MIDI
outport.send(msg_on)
outport.send(track)
outport.send(amount)
outport.send(rate)
outport.send(length)
outport.send(pitch)
outport.send(freq)
outport.send(tone)
for i in range (0,20):
	amount.value = amount.value - i
	rate.value = rate.value - i
	time.sleep(1)
	outport.send(amount)
	outport.send(rate)
# Send msg_off and close outport
outport.send(msg_off)
outport.close()