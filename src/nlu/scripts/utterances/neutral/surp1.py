#!/usr/bin/env python

import mido, time
from mido import Message
import numpy as np

# SURPRISE

# Define controls
msg_on = Message('note_on', channel = 3, note = 60, velocity = 90, time = 0)
msg_off = Message('note_off', channel = 3, note = 60, velocity = 90, time = 0) 

track = Message('control_change', channel = 1, control = 12, value = 1)
sel = Message('control_change', channel = 3, control = 12, value = 78)
transp = Message('control_change', channel = 4, control = 12, value = 32)
rate = Message('control_change', channel = 5, control = 12, value = 114)
length = Message('control_change', channel = 6, control = 12, value = 50)
amo = Message('control_change', channel = 8, control = 12, value = 8)

# Create output
outport = mido.open_output()

# Algorithm 1
# Send MIDI
outport.send(msg_on)
outport.send(track)
outport.send(sel)
outport.send(transp)
outport.send(rate)
outport.send(length)
outport.send(amo)

# Send msg_off and close outport
outport.send(msg_off)
outport.close()