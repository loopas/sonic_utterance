#!/usr/bin/env python

import mido, time, random, rospy
from mido import Message
import numpy as np

# CHATTER

# Define controls
msg_on = Message('note_on', channel = 3, note = 60, velocity = 90, time = 0)
msg_off = Message('note_off', channel = 3, note = 60, velocity = 90, time = 0) 

track = Message('control_change', channel = 0, control = 12, value = 1)
sel = Message('control_change', channel = 3, control = 12, value = 120)

transp = Message('control_change', channel = 4, control = 12, value = 30) # from 30 - 60 to 70 - 100
rate = Message('control_change', channel = 5, control = 12, value = 60) # from 60 - 30 to 30 - 0
length = Message('control_change', channel = 6, control = 12, value = 19)
pitch = Message('control_change', channel = 9, control = 12, value = 75)

# Create output
outport = mido.open_output()

# Algorithm 1
# Send MIDI
transp0 = transp.value
rate0 = rate.value

outport.send(msg_on)
outport.send(track)
outport.send(sel)
outport.send(length)
while not rospy.is_shutdown():
	transp.value = random.randrange(transp0, transp0 + 30)
	rate.value = random.randrange(rate0 - 30, rate0)
	pitch.value = random.randrange(0, 127)
	outport.send(transp)
	outport.send(rate)
	outport.send(pitch)
	time.sleep(.3)

# Send msg_off and close outport
outport.send(msg_off)
outport.close()