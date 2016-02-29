#!/usr/bin/env python

import socket, sys, time, rospy
import numpy as np
from nlu.msg import croaches

class SocketInterface:
    """A class that communicates with flash game Croaches"""

    def __init__( self ):
        HOST = '127.0.0.1'
        #HOST = ''
        PORT = 9999
        s = None
        s = socket.socket( socket.AF_INET, socket.SOCK_STREAM )
        s.bind((HOST, PORT))
        s.listen(5)

        self.conn, self.addr = s.accept()
        print 'Conectado a ', self.addr

    def node(self):
        rospy.init_node('socket', anonymous=True)
        self.pub = rospy.Publisher('stream1', croaches, queue_size=1) #Publishing the topic 'stream1'
        params = self.parseData()
        rospy.loginfo(params) # Prints the msgs to screen, and writes them to the Node's log file and to rosout
        self.pub.publish(params)
        rate = rospy.Rate(1) # 1 Hz
        #rospy.spin()

    def askData( self ):
        self.conn.sendall( 'getData\0' )
        print 'Enviado getData'

    def setFrequency(self, f):
        s = 'frequency ' + str( f ) + '\0';
        self.conn.sendall( s )

    def setMaxSpeed(self, f):
        s = 'speed ' + str( f )+ '\0';
        self.conn.sendall( s )

    def recvData( self ):
        self.data = self.conn.recv(1024)
        print 'Recibido: ', self.data

    def end( self ):
        self.conn.close()

    """ Parse received data:
    event:
    - 0, a new croach has been created
    - 1, user clicked and a new croach has been killed
    - 2, user clicked but failed in killing a croach
    frequency: of creating croaches
    number_killed: total num of killed croaches
    number_created: total num of created croaches
            the number of croaches in scene would be: number_created - number_killed
    time_stamp: milliseconds
    life: it is decreased during the game from 100 to 0 (deprecated)
    """
    def parseData( self ):
        c = croaches()
        s = self.data.split( ',' )
        s[5] = str(s[5].split('\x00')[:-1]).strip('[]').replace("'", "")

        if s[0] == 'undefined':
           c.event = 0   #   if new, killed or failed
        else:
           c.event = int(s[0])
        c.frequency = float(s[1])
        c.number_killed = int(s[2])
        c.number_created = int(s[3])
        c.time_stamp = int(s[4])
        c.life = int(s[5])

        return c

# main test

s = SocketInterface()
s.askData()
f = 0
while(1):
    s.setFrequency( f )
    s.recvData()
    if not s.data: break
    s.parseData()
    s.node()
    f += 1
    
s.end()