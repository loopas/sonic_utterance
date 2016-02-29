#!/usr/bin/env python

import mido, time
from mido import Message
import numpy as np

# FEAR1 (IN DISPLEASURE)

# Define controls


amount = Message('control_change', channel = 0, control = 12, value = 0)

# Create output
outport = mido.open_output()

# Algorithm: the more arousal the more transp and length of the first note (ralentize)
# Send MIDI

outport.send(amount)

# Send msg_off and close outport
outport.close()