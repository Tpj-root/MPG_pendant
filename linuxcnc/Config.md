


https://github.com/AlexmagToast/LinuxCNC_ArduinoConnector


# insatll
sudo pip install pyserial




find the port


sudo dmesg | grep tty


[ 5484.305260] usb 1-8: ch341-uart converter now attached to ttyUSB0



Edit the line 

/dev/ttyACM0   into  /dev/ttyUSB0



paste location


/home/sab/Desktop/TRY_BUILD/linuxcnc-dev/bin


# Files

-rwxr-xr-x 1 sab sab 17826 Apr  6  2024 arduino-ttyUSB0
-rwxr-xr-x 1 sab sab 17804 Apr  2  2024 arduino-ttyUSB1




How to run the 


# load

halcmd loadusr arduino-ttyUSB0
halcmd show pin



# unload

halcmd unloadusr arduino-ttyUSB0


# close the all function

halrun -U





net din7-out not.0.out => arduino_ttyUSB0.dout.12






[HAL]
HALCMD  = loadusr arduino-ttyUSB0



Notes:

https://forum.linuxcnc.org/24-hal-components/37760-inverting-an-output-pin









###############################

BUG in code

###############################


how to config emergency stop switch




##########
Work invert
##########



loadrt not count=1
addf not.0 servo-thread

# Connect the original input pin to the NOT component
net din7-in arduino_ttyUSB0.din.7 => not.0.in

# Create the output signal and connect it to a destination pin
net din7-out not.0.out => parport.0.pin-01-out



##########



try methoad 2



loadusr arduino-ttyUSB0



loadrt not count=1
addf not.0 servo-thread

net inverted-signal arduino_ttyUSB0.din.7 => not.0.in
net arduino_ttyUSB0.din.7-inverted not.0.out


---------------------

net estop-ext <= not.0.out

net estop-out <= iocontrol.0.user-enable-out
net estop-ext <= iocontrol.0.emc-enable-in







-----------------
Perfect work
-----------------

loadusr arduino-ttyUSB0


# Load the NOT component (for inverting the signal if needed)
loadrt not count=1

# Add the NOT component to the servo thread
addf not.0 servo-thread

# Connect the input from the E-Stop switch
net estop-input arduino_ttyUSB0.din.7 => not.0.in


#unlink
unlinkp iocontrol.0.emc-enable-in

# Create the inverted E-Stop signal
net estop-inverted not.0.out => iocontrol.0.emc-enable-in


-----------------

parameter have 

arduino_ttyUSB0.din.2-invert





# Connect to the HAL E-Stop handler
# net estop-inverted => iocontrol.0.user-enable-out




----------------
Advance methodd last try
----------------


loadusr arduino-ttyUSB0


# Enable inversion for the E-Stop input pin
setp arduino_ttyUSB0.din.7-invert TRUE

unlinkp iocontrol.0.emc-enable-in

# Connect the inverted E-Stop pin to the E-Stop logic
net estop-signal arduino_ttyUSB0.din.7 => iocontrol.0.emc-enable-in




----------------



















# create newsignal

newsig iamstop bit




net iamintonot arduino_ttyUSB0.din.7



net iamstop arduino_ttyUSB0.din.7 halui.estop.activate



unlinkp arduino_ttyUSB0.din.7



net iamstop halui.estop.reset arduino_ttyUSB0.din.7
net iamstop halui.estop.activate arduino_ttyUSB0.din.7








------------

how invert pin


setp parport.0.pin-08-out-invert true


setp arduino_ttyUSB0.din.7-in-not true




-----------



/home/sab/Desktop/TRY_BUILD/linuxcnc-dev/scripts/linuxcnc /home/sab/Desktop/TRY_BUILD/linuxcnc-dev/configs/sim/axis/vismach/3axis-tutorial/3axis-tutorial.ini



/home/sab/Desktop/TRY_BUILD/linuxcnc-dev/scripts/linuxcnc /home/sab/Desktop/TRY_BUILD/linuxcnc-dev/configs/sim/axis/vismach/scara/scara.ini


    23  bit   IN                  FALSE  halui.estop.activate
    23  bit   OUT                 FALSE  halui.estop.is-activated
    23  bit   IN                  FALSE  halui.estop.reset

    23  bit   OUT                 FALSE  halui.machine.is-on
    23  bit   IN                  FALSE  halui.machine.off
    23  bit   IN                  FALSE  halui.machine.on
    



setp halui.machine.on 1



####


halcmd loadusr arduino-ttyUSB0
loadusr arduino-ttyUSB0




unloadusr arduino-ttyUSB0



# in not
    73  bit   OUT                 FALSE  arduino_ttyUSB0.din.2 ==> iamstop





------------------------------------------------------------
# scara robot data 
-------------------------------------------------------------

    23  bit   IN                  FALSE  halui.estop.activate
    23  bit   OUT                  TRUE  halui.estop.is-activated
    23  bit   IN                  FALSE  halui.estop.reset
    15  bit   IN                  FALSE  iocontrol.0.emc-enable-in <== estop:loop
    15  bit   OUT                 FALSE  iocontrol.0.user-enable-out ==> estop:loop
        bit                       FALSE  estop:loop ==> iocontrol.0.emc-enable-in <== iocontrol.0.user-enable-out

---------------------------------------------------------------













net iamintonot arduino_ttyUSB0.din.2

net estop-ext 


newsig iamstop bit
net iamstop arduino_ttyUSB0.din.2 halui.estop.activate



# not need to this 
iocontrol.0.emc-enable-in



net iamstop halui.estop.reset arduino_ttyUSB0.din.2
net iamstop halui.estop.activate arduino_ttyUSB0.din.2


    73  bit   OUT                 FALSE  arduino_ttyUSB0.din.2


arduino_ttyUSB0.din.2

--------------------------------

newsig estop_invert bit
newsig iamstop bit


net estop_invert arduino_ttyUSB0.din.2 not.0.in
net iamstop halui.estop.activate not.0.out
linkps 


net estop_invert arduino_ttyUSB0.din.7 not.0.in

------------------------------------------


(If that is the correct syntax)







loadrt encoder num_chan=1
loadrt mux4 count=1




nano







