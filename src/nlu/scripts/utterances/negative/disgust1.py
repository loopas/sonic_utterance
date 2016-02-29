#!/usr/bin/env python

import mido, time, random, rospy
from mido import Message
import numpy as np

# FEAR1 (IN DISPLEASURE)

# Define controls
msg_on = Message('note_on', channel = 3, note = 60, velocity = 90, time = 0)
msg_off = Message('note_off', channel = 3, note = 60, velocity = 90, time = 0) 

track = Message('control_change', channel = 2, control = 12, value = 120)

sel = Message('control_change', channel = 3, control = 12, value = 1)
amount = Message('control_change', channel = 4, control = 12, value = random.randrange(63, 127))
rate = Message('control_change', channel = 5, control = 12, value = 127)
length = Message('control_change', channel = 6, control = 12, value = 45)
pitch = Message('control_change', channel = 7, control = 12, value = random.randrange(64,127)) # 127 to 64
freq = Message('control_change', channel = 8, control = 12, value = random.randrange(0, 127))
tone = Message('control_change', channel = 9, control = 12, value = random.randrange(63, 127))

# Create output
outport = mido.open_output()

# Algorithm: the more arousal the more transp and length of the first note (ralentize)
# Send MIDI

outport.send(track)
outport.send(rate)
outport.send(length)
#while not rospy.is_shutdown():
amount.value = random.randrange(63, 127)
pitch.value = random.randrange(64, 127)
freq.value = random.randrange(0, 127)
tone.value = random.randrange(63, 127)
outport.send(msg_on)
outport.send(amount)
outport.send(pitch)
outport.send(freq)
outport.send(tone)
time.sleep(.3)

# Send msg_off and close outport
outport.send(msg_off)
outport.close()