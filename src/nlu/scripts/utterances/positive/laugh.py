#!/usr/bin/env python

import mido, time, random
from mido import Message
import numpy as np

# LAUGH (IN JOY)

# Define controls
msg_on = Message('note_on', channel = 3, note = 60, velocity = 90, time = 0)
msg_off = Message('note_off', channel = 3, note = 60, velocity = 90, time = 0) 

track = Message('control_change', channel = 0, control = 12, value = 1)
sel = Message('control_change', channel = 3, control = 12, value = 1)

transp = Message('control_change', channel = 4, control = 12, value = 46) # 26 - 46
rate = Message('control_change', channel = 5, control = 12, value = 65) # 70 - 65
length = Message('control_change', channel = 6, control = 12, value = random.randrange(28, 35)) # 28 - 35
rep = Message('control_change', channel = 8, control = 12, value = 40) # 35 - 40
pitch = Message('control_change', channel = 9, control = 12, value = 127) # 100 - 127
decay = Message('control_change', channel = 10, control = 12, value = 86) # 76 - 86

# Create output
outport = mido.open_output()

# Algorithm: laugh
outport.send(track)
outport.send(sel)
outport.send(msg_on)
outport.send(rate)
outport.send(length)
outport.send(rep)
outport.send(pitch)
outport.send(decay)
re = int(np.round((16.0/127.0)*rep.value))
for i in range (0, re):
	transp.value = transp.value + 3*i
	#transp.value = 46 + 5*i
	outport.send(transp)
	time.sleep(.087)

time.sleep(0.5)


# Send msg_off and close outport
outport.send(msg_off)
outport.close()