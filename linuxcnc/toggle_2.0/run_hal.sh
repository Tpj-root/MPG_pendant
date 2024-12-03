#!/bin/bash
# load the arduino
halcmd loadusr arduino_All_ttyUSB0
halcmd loadrt toggle6axis


# THis delay need for connect arduino_All_ttyUSB0 serial communication
#
#
sleep 5
echo "This message appears after a 5-second delay."

#
# setup pins
# Axis


halcmd addf toggle6axis.0 servo-thread



halcmd setp arduino_All_ttyUSB0.din.4-invert TRUE
halcmd setp arduino_All_ttyUSB0.din.5-invert TRUE
halcmd setp arduino_All_ttyUSB0.din.6-invert TRUE
halcmd setp arduino_All_ttyUSB0.din.7-invert TRUE
halcmd setp arduino_All_ttyUSB0.din.8-invert TRUE
halcmd setp arduino_All_ttyUSB0.din.9-invert TRUE
#
# Scale
halcmd setp arduino_All_ttyUSB0.din.10-invert TRUE
halcmd setp arduino_All_ttyUSB0.din.11-invert TRUE
halcmd setp arduino_All_ttyUSB0.din.12-invert TRUE
#
# Enable inversion for the E-Stop input pin
halcmd setp arduino_All_ttyUSB0.din.13-invert TRUE

# unlink for sim
halcmd unlinkp iocontrol.0.emc-enable-in

# Connect the inverted E-Stop pin to the E-Stop logic
# =>
halcmd net estop-signal arduino_All_ttyUSB0.din.13 iocontrol.0.emc-enable-in


# add the counter connect

halcmd net countconnect arduino_All_ttyUSB0.counter.0 axis.x.jog-counts axis.y.jog-counts axis.z.jog-counts



# Set the axis x y z
halcmd net iamaxisX toggle6axis.0.xaxis arduino_All_ttyUSB0.din.4
halcmd net iamaxisY toggle6axis.0.yaxis arduino_All_ttyUSB0.din.5
halcmd net iamaxisZ toggle6axis.0.zaxis arduino_All_ttyUSB0.din.6


halcmd net OutaxisX toggle6axis.0.xaxistoggle axis.x.jog-enable
halcmd net OutaxisY toggle6axis.0.yaxistoggle axis.y.jog-enable
halcmd net OutaxisZ toggle6axis.0.zaxistoggle axis.z.jog-enable



# axis 4 to 5

halcmd net iamaxis4 toggle6axis.0.axis4 arduino_All_ttyUSB0.din.7
halcmd net iamaxis5 toggle6axis.0.axis5 arduino_All_ttyUSB0.din.8
halcmd net iamaxis6 toggle6axis.0.axis6 arduino_All_ttyUSB0.din.9


halcmd net Outaxis4 toggle6axis.0.axis4toggle axis.a.jog-enable
halcmd net Outaxis5 toggle6axis.0.axis5toggle axis.b.jog-enable
halcmd net Outaxis6 toggle6axis.0.axis6toggle axis.c.jog-enable


# Connect the signal into pins
halcmd net countconnect axis.a.jog-counts axis.b.jog-counts axis.c.jog-counts




halcmd loadrt toggle3scale


halcmd addf toggle3scale.0 servo-thread


halcmd setp toggle3scale.0.in0 0.1
halcmd setp toggle3scale.0.in1 0.01
halcmd setp toggle3scale.0.in2 0.001


halcmd net scalex1 toggle3scale.0.sel0 arduino_All_ttyUSB0.din.10
halcmd net scalex10 toggle3scale.0.sel1 arduino_All_ttyUSB0.din.11
halcmd net scalex100 toggle3scale.0.sel2 arduino_All_ttyUSB0.din.12



halcmd net scaleout toggle3scale.0.scalevalue axis.x.jog-scale axis.y.jog-scale axis.z.jog-scale axis.a.jog-scale axis.b.jog-scale axis.c.jog-scale


# Fixthe error
# set signal value







