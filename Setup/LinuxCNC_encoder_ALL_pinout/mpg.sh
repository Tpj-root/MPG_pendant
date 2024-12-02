#!/bin/bash
# load the arduino
halcmd loadusr arduino_All_ttyUSB0
halcmd loadrt toggleXYZ names=IamX1,IamX10,IamX100,Iamxaxis,Iamyaxis,Iamzaxis
halcmd loadrt mux8 count=1


# THis delay need for connect arduino_All_ttyUSB0 serial communication
#
#
sleep 5
echo "This message appears after a 5-second delay."

#
# setup pins
# Axis



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

#
#
# Scale method
#
# 

halcmd addf mux8.0 servo-thread

halcmd addf IamX1 servo-thread
halcmd addf IamX10 servo-thread
halcmd addf IamX100 servo-thread


# axis toggle
halcmd addf Iamxaxis servo-thread
halcmd addf Iamyaxis servo-thread
halcmd addf Iamzaxis servo-thread



#######
halcmd setp mux8.0.in0 0       # Default value for input 0
halcmd setp mux8.0.in1 0.1     # Value for input 1
halcmd setp mux8.0.in2 0.01    # Value for input 2
halcmd setp mux8.0.in4 0.001   # Value for input 4
halcmd setp mux8.0.in3 0
halcmd setp mux8.0.in5 0
halcmd setp mux8.0.in6 0
halcmd setp mux8.0.in7 0


# Scale function
halcmd net iamx1 IamX1.in arduino_All_ttyUSB0.din.10
halcmd net iamx10 IamX10.in arduino_All_ttyUSB0.din.11
halcmd net iamx100 IamX100.in arduino_All_ttyUSB0.din.12

halcmd net iamx1 IamX10.is-on IamX100.is-on
halcmd net iamx10 IamX1.is-on IamX100.is-on-2
halcmd net iamx100 IamX10.is-on-2 IamX1.is-on-2

halcmd net iamX1_out mux8.0.sel0 IamX1.on
halcmd net iamX10_out mux8.0.sel1 IamX10.on
halcmd net iamX100_out mux8.0.sel2 IamX100.on


# Finalout scale is
halcmd net iamfinalout axis.x.jog-scale axis.y.jog-scale axis.z.jog-scale mux8.0.out



# axis function


# Scale function
halcmd net iamaxisX Iamxaxis.in arduino_All_ttyUSB0.din.4
halcmd net iamaxisY Iamyaxis.in arduino_All_ttyUSB0.din.5
halcmd net iamaxisZ Iamzaxis.in arduino_All_ttyUSB0.din.6
# 
# same Signal into other pins
halcmd net iamaxisX Iamyaxis.is-on Iamzaxis.is-on
halcmd net iamaxisY Iamxaxis.is-on Iamzaxis.is-on-2
halcmd net iamaxisZ Iamxaxis.is-on-2 Iamyaxis.is-on-2


#  
halcmd net xaxis_enable axis.x.jog-enable Iamxaxis.on
halcmd net yaxis_enable axis.y.jog-enable Iamyaxis.on
halcmd net zaxis_enable axis.z.jog-enable Iamzaxis.on


# Finalout axis xis.x.jog-enable
# halcmd net iamaxis out axis.x.jog-scale axis.y.jog-scale axis.z.jog-scale mux8.0.out

# add the counter connect

halcmd net countconnect arduino_All_ttyUSB0.counter.0 axis.x.jog-counts axis.y.jog-counts axis.z.jog-counts




