#!/usr/bin/env python

import mido, time
from mido import Message
import numpy as np

# FEAR1 (IN DISPLEASURE)

# Define controls
msg_on = Message('note_on', channel = 3, note = 60, velocity = 90, time = 0)
msg_off = Message('note_off', channel = 3, note = 60, velocity = 90, time = 0) 

track = Message('control_change', channel = 2, control = 12, value = 2)
sel = Message('control_change', channel = 3, control = 12, value = 88)

amount = Message('control_change', channel = 4, control = 12, value = 74) # 44 - 74
rate = Message('control_change', channel = 5, control = 12, value = 127) # 77 - 127
length = Message('control_change', channel = 6, control = 12, value = 89) # 89
pitch = Message('control_change', channel = 7, control = 12, value = 127) # 97 - 127
freq = Message('control_change', channel = 8, control = 12, value = 34) # 94 - 34 
tone = Message('control_change', channel = 9, control = 12, value = 127) # 27 - 127

# Create output
outport = mido.open_output()

# Algorithm: the more arousal the more transp and length of the first note (ralentize)
# Send MIDI
outport.send(msg_on)
outport.send(sel)
outport.send(track)
outport.send(amount)
outport.send(rate)
outport.send(length)
outport.send(pitch)
outport.send(freq)
outport.send(tone)

# Send msg_off and close outport
outport.send(msg_off)
outport.close()