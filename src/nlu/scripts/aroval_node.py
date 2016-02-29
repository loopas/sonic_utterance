Z#!/usr/bin/env python

from __future__ import division
import rospy, math, time, sys
import numpy as np
import matplotlib.pyplot as p
from mpl_toolkits.mplot3d import Axes3D
from nlu.msg import croaches, aroval
from matplotlib.backends.backend_pdf import PdfPages

fail = 0
flag_break = 0
alpha = 0 # Since the experiment starts at aro = 0, we are suposing that Maggie is relaxed
nu = 0.5 # Since the experiment starts at val = 0.5, we are suposing that the mood of Maggie is always positive while the things go wel
piv = None
sign = 0
time0 = None

p.ion()
p.show()

class Aroval:
    def __init__(self):
        pass
        
    def callback(self, data):
        global fail, flag_break, alpha, nu, piv, sign, time0

        print ''
        print "Event:", data.event
        print "Frequency of Creating Croaches (Hz):", data.frequency
        print "Total Num of Croaches Killed:", data.number_killed
        print "Total Num of Croaches Created:", data.number_created
        print "Time (ms):", data.time_stamp
        print "Life (%):", data.life

        vector = Set_aroval(alpha, nu, fail, flag_break, piv, sign, data.event, data.frequency, data.number_killed, data.number_created, data.time_stamp, data.life)
        fail, flag_break, av, alpha, piv, sign, arousal, nu, tau = vector.algorithm()
        self.pub.publish(av) # Publishes the values to the 'link' topic. 
        rospy.loginfo(av) # Prints the msgs to screen, and writes them to the Node's log file and to rosout
        draw = Plot_aroval(data.event, arousal, nu, time0, data.time_stamp, tau)
        draw2d, time0 = draw.plot2d()
        #draw3d = Plot_aroval(event, arousal, nu, time_stamp, tau)
        #draw3d.plot3d()

    def node(self):
        rospy.init_node('aroval', anonymous=True)
        rospy.Subscriber("stream1", croaches, self.callback) # Listening from the aro/val node
        self.pub = rospy.Publisher('stream2', aroval, queue_size=1) #Publishing the topic 'link'
        rate = rospy.Rate(5) # 5hz
        rospy.spin()

class Set_aroval:
    def __init__(self, alpha, nu, fail, flag_break, piv, sign, event, frequency, number_killed, number_created, time_stamp, life):
        self.alpha = alpha
        self.nu = nu
        self.fail = fail
        self.flag_break = flag_break
        self.piv = piv
        self.sign = sign
        self.event = event
        self.frequency = frequency
        self.number_killed = number_killed
        self.number_created = number_created
        self.time_stamp = time_stamp
        self.life = life

    def algorithm(self):
    # Global variables
        n_c = self.number_created        
        n_k = self.number_killed
        tau = n_c - n_k # 1) number of croaches inside Maggie in a particular moment
        kill = self.number_killed
        if self.event == 2:
            self.fail += 1
        action = kill + self.fail
        if action != 0:
            e = kill/action # 2) effectiveness of the player, it gives or not confidence to Maggie (d is the starting point of confidence, determined by the researcher)
            a = action/(tau + action) # 3) action level of the player, 0 if he or she does nothing
        else:
            e = 1 # Maggie is confident when the game starts
            a = 0.5 # The proportion of action is initialy estimated as the initial probability that the player acts        

    # 5) Sensory perception hypothesis (SPH)
        tau0 = tau
        if self.event == 0: 
            tau0 -=1
        elif self.event == 1: 
            tau0 += 1

        if tau0 != 0:
            s = (tau - tau0)/(2*max(tau0, tau)) # SPH, 2 is for scaling
            #s = math.log(tau/tau0, math.exp(1)) # Teoría de Weber-Fechner
        if tau0 == 0 and self.event == 0 or self.alpha == 0: 
            s = 4/(n_c + 6) # Habituation when the first croach pops up from s = 0.4 until s = 0 (the function is optimized for a maximum of 20 croaches)
        if tau0 == 0 and self.event == 2: #or tau == 0:
            s = 0
            self.alpha = 0 # Calm state when there's no croaches
            
    # Arousal (alpha)
        A = 1 # attentional bias toward number of croaches
        B = 0.005 # attentional bias toward life (in range (0.002, 0.012), both abnormal ends). Other application: determining based anxiety level      
        alpha = self.alpha + s
        aro = A*alpha + B*(100 - self.life)

        if aro < 0: # Floor
            aro = B*(100 - self.life)
            alpha = 0
        elif aro > 1: # Ceil
            aro = 1 

        if self.event > 0:
            self.flag_break = 0

        if self.flag_break > 0 and self.alpha == 0:
            self.flag_break += 1
            aro = 0
        elif aro == 1:
            self.flag_break += 1
            if self.flag_break > 3: # Depression
                aro = 0
        else:
            self.flag_break = 0
    # Valence (nu) in hysteresis
        d = 2 # disposition (range of variation of the reaction, given by the researcher)
        mu_neg = d/(10**(a*e)) # Depends on d, e and a (in range (0.2, 2), both abnormal ends) and determines the critic number of croaches to experiment the minimum value of valence.
        mu_pos = d/(10**(1 - a*e))
        phi = 0.5 

        if self.event == 0: # From positive to negative:
            if self.piv is None or self.sign == 0: # Marks the number of croaches and the value of valence in which the values piv1ote till the trend shifts
                self.piv = tau0 + math.log(phi + self.nu, math.exp(1))/mu_neg # Determines the x, y components of the start 
            self.sign = 1
            val = math.exp(-mu_neg*(tau - self.piv)) - phi         
        
        elif self.event == 1: # From negative to positive:
            if self.sign == 1:
                self.piv = tau0 - math.log(phi - self.nu, math.exp(1))/mu_pos # Determines the x, y components of the start 
                self.sign = 0

            val = - math.exp(mu_pos*(tau - self.piv)) + phi

        else: # When the player fails
            val = self.nu

        if val < -0.5: # Floor
            val = -0.5
            print 'FLOOR'
        elif val > 0.5: # Ceil
            val = 0.5
            print 'CEIL'

        # Game over condition:
        if self.flag_break > 9: # Esta fatal, revisar
            import sys
            print 'GAME OVER'
            sys.exit()
            
        av = aroval()

        av.arousal = aro
        av.valence = val

        return [self.fail, self.flag_break, av, alpha, self.piv, self.sign, aro, val, tau]


class Plot_aroval:
    def __init__(self, event, arousal, valence, time0, time_stamp, tau):
        self.event = event
        self.arousal = arousal
        self.valence = valence
        self.time0 = time0
        self.time_stamp = time_stamp
        self.tau = tau

    def plot2d(self): # plot_emotions
        fig1 = p.figure(1) # Time vs. Aroval

        p.subplot(211) # Arousal

        p.axhline(y=0.333, xmin=0, xmax=15000, hold=None)
        p.axhline(y=0.667, xmin=0, xmax=15000, hold=None)

        if self.time0 is None:
            self.time0 = self.time_stamp

        p.axis([self.time0, self.time0 + 150000, 0, 1])
        p.xlabel('Time')
        p.ylabel('Arousal')
        if 0 <= self.arousal < 0.333 and -0.5 <= self.valence < -0.167:
            p.plot(self.time_stamp, self.arousal, 'ro')
        elif 0 <= self.arousal < 0.333 and -0.167 <= self.valence < 0.167:
            p.plot(self.time_stamp, self.arousal, 'bo')
        elif 0 <= self.arousal < 0.333 and 0.167 <= self.valence <= 0.5:
            p.plot(self.time_stamp, self.arousal, 'go') 
        elif 0.333 <= self.arousal < 0.667 and -0.5 <= self.valence < -0.167:
            p.plot(self.time_stamp, self.arousal, 'rs')
        elif 0.333 <= self.arousal < 0.667 and -0.167 <= self.valence < 0.167:
            p.plot(self.time_stamp, self.arousal, 'bs')
        elif 0.333 <= self.arousal < 0.667 and 0.167 <= self.valence <= 0.5:
            p.plot(self.time_stamp, self.arousal, 'gs') 
        elif 0.667 <= self.arousal <= 1 and -0.5 <= self.valence < -0.167:
            p.plot(self.time_stamp, self.arousal, 'r^')
        elif 0.667 <= self.arousal <= 1 and -0.167 <= self.valence < 0.167:
            p.plot(self.time_stamp, self.arousal, 'b^')
        elif 0.667 <= self.arousal <= 1 and 0.167 <= self.valence <= 0.5:
            p.plot(self.time_stamp, self.arousal, 'g^') 
        p.grid()

        p.subplot(212) # Valence

        p.axhline(y=-0.167, xmin=0, xmax=15000, hold=None)
        p.axhline(y=0.167, xmin=0, xmax=15000, hold=None)

        p.axis([self.time0, self.time0 + 150000, -0.5, 0.5])
        p.xlabel('Time')
        p.ylabel('Valence')
        if 0 <= self.arousal < 0.333 and -0.5 <= self.valence < -0.167:
            p.plot(self.time_stamp, self.valence, 'ro')
        elif 0 <= self.arousal < 0.333 and -0.167 <= self.valence < 0.167:
            p.plot(self.time_stamp, self.valence, 'bo')
        elif 0 <= self.arousal < 0.333 and 0.167 <= self.valence <= 0.5:
            p.plot(self.time_stamp, self.valence, 'go') 
        elif 0.333 <= self.arousal < 0.667 and -0.5 <= self.valence < -0.167:
            p.plot(self.time_stamp, self.valence, 'rs')
        elif 0.333 <= self.arousal < 0.667 and -0.167 <= self.valence < 0.167:
            p.plot(self.time_stamp, self.valence, 'bs')
        elif 0.333 <= self.arousal < 0.667 and 0.167 <= self.valence <= 0.5:
            p.plot(self.time_stamp, self.valence, 'gs') 
        elif 0.667 <= self.arousal <= 1 and -0.5 <= self.valence < -0.167:
            p.plot(self.time_stamp, self.valence, 'r^')
        elif 0.667 <= self.arousal <= 1 and -0.167 <= self.valence < 0.167:
            p.plot(self.time_stamp, self.valence, 'b^')
        elif 0.667 <= self.arousal <= 1 and 0.167 <= self.valence <= 0.5:
            p.plot(self.time_stamp, self.valence, 'g^') 
        p.grid()

        '''fig1 = p.figure(1) # Time vs. Aroval

        p.subplot(211) # Arousal

        p.axhline(y=0.333, xmin=0, xmax=15000, hold=None)
        p.axhline(y=0.667, xmin=0, xmax=15000, hold=None)

        p.axis([self.time0, self.time0 + 150000, 0, 1])
        p.xlabel('Time')
        p.ylabel('Arousal')
        if self.event == 0:
            p.plot(self.time_stamp, self.arousal, 'b^')
        elif self.event == 1:
            p.plot(self.time_stamp, self.arousal, 'go')
        else:
            p.plot(self.time_stamp, self.arousal, 'rx')  

        p.grid()

        p.subplot(212) # Valence

        p.axhline(y=-0.167, xmin=0, xmax=15000, hold=None)
        p.axhline(y=0.167, xmin=0, xmax=15000, hold=None)

        p.axis([self.time0, self.time0 + 150000, -0.5, 0.5])
        p.xlabel('Time')
        p.ylabel('Valence')
        if self.event == 0:
            p.plot(self.time_stamp, self.valence, 'b^')
        elif self.event == 1:
            p.plot(self.time_stamp, self.valence, 'go')
        else: 
            p.plot(self.time_stamp, self.valence, 'rx')  
        p.grid()

        fig2 = p.figure(2) # N of croaches vs. Aroval

        p.subplot(211) # Arousal

        p.axhline(y=0.333, xmin=0, xmax=40, hold=None)
        p.axhline(y=0.667, xmin=0, xmax=40, hold=None)

        p.axis([0, 40, 0, 1])
        p.xlabel('N of croaches')
        p.ylabel('Arousal')
        if self.event == 0:
            p.plot(self.tau, self.arousal, 'b^')
        elif self.event == 1:
            p.plot(self.tau, self.arousal, 'go')
        else:
            p.plot(self.tau, self.arousal, 'rx')   
        p.grid()

        p.subplot(212) # Valence

        p.axhline(y=-0.167, xmin=0, xmax=40, hold=None)
        p.axhline(y=0.167, xmin=0, xmax=40, hold=None)

        p.axis([0, 40, -0.5, 0.5])
        p.xlabel('N of croaches')
        p.ylabel('Valence')
        if self.event == 0:
            p.plot(self.tau, self.valence, 'b^')
        elif self.event == 1:
            p.plot(self.tau, self.valence, 'go')
        else: 
            p.plot(self.tau, self.valence, 'rx')  
        p.grid()

        fig3 = p.figure(3) # Time vs. N of croaches

        p.axis([self.time0, self.time0 + 150000, 0, 40])
        p.xlabel('Time')
        p.ylabel('N of croaches')
        p.plot(self.time_stamp, self.tau, 'b^')
        p.grid()'''

        with PdfPages('aroval_time.pdf') as pdf1: # As many times as you like, create a figure fig and save it:
            pdf1.savefig(fig1)

        '''with PdfPages('aroval_n.pdf') as pdf2: 
            pdf2.savefig(fig2)

        with PdfPages('Time vs. N of croaches') as pdf3: 
            pdf3.savefig(fig3)'''

        draw2d = p.draw()
        time.sleep(0.05)
        return[draw2d, self.time0]

    '''def plot3d(self):
        fig = p.figure()
        ax = fig.add_subplot(111, projection='3d')
        draw3d = ax.plot(self.time_stamp, self.arousal, self.valence)
        time.sleep(0.05)
        return[draw3d]'''

a = Aroval()
print(a.node())