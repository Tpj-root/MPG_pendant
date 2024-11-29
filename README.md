# MPG_pendant
An MPG pendant (Manual Pulse Generator) is a handheld device used in LINUXCNC systems to control axis movement manually. It features a rotary encoder, selector switches, and sometimes an emergency stop for precise adjustments.





**Requirements for MPG pendant**

G1- MPG-TM1474-100B-5L-Z6

Arduino Nano

pull up circuit




**Where to buy**

https://www.amazon.in/Universal-Handwheel-Emergency-Generator-MITSUBISHI/dp/B07CZ7F3Y3

https://www.indiamart.com/proddetail/tosoku-tm1474-100b-5l-z6-mpg-emergency-set-2855265375948.html?mTd=1


**Wheel**

https://www.electronicscomp.com/hand-wheel-pulse-encoder-for-cnc-zss600-100b-5l?





**Wire_study**

https://components101.com/connectors/mil-dtl-24308-db25-parallel-port-connector






<p align="center">
  <img src="Doc/Front_view.jpg" width="300" height="300">
  <img src="Doc/Dimension.jpg" width="300" height="300">
    <img src="Doc/Pull_up.png" width="600" height="315">
</p>







### DB25 Port Connector Pinout Configuration


| Pin_Number | Pin_Color | Pin_ArduinoNano  | Pin_Signal  | Pin_Description |
| --- |  --- | --- |  --- | --- |
| 1 | <img src="mpg_colors_wire/__red.png" width="80" height="40"> <p>RED</p> |   | +V, VCC, +5V5  | Rotary Encoder |
| 2 | <img src="mpg_colors_wire/__black.png" width="80" height="40"> <p>BLACK</p>  |   | 0V, GND  | Rotary Encoder |
| 3 | <img src="mpg_colors_wire/__green.png" width="80" height="40"> <p>GREEN</p>  |D2| A  | Rotary Encoder |
| 4 | <img src="mpg_colors_wire/__white.png" width="80" height="40"> <p>WHITE</p>  |D3| B  | Rotary Encoder |
| 5 | <img src="mpg_colors_wire/__purple.png" width="80" height="40"> <p>PURPLE</p>  |   | A/  | Line Driver Type |
| 6 | <img src="mpg_colors_wire/__purple_black.png" width="80" height="40"> <p>PURPLE_BLACK</p>  |   | B/  | Line Driver Type |
| 7 | <img src="mpg_colors_wire/__green_black.png" width="80" height="40"> <p>GREEN_BLACK</p>  |   | +  | Show Lamp |
| 8 | <img src="mpg_colors_wire/__white_black.png" width="80" height="40"> <p>WHITE_BLACK</p>  |   | -, GND  | Show Lamp |
|-|-|-| OFF  | - |
| 9 | <img src="mpg_colors_wire/__yellow.png" width="80" height="40"> <p>YELLOW</p>  | D4| X, 1  | Axis of coordinates |
| 10 | <img src="mpg_colors_wire/__yellow_black.png" width="80" height="40"> <p>YELLOW_BLACK</p>  |D5| Y, 2  | Axis of coordinates |
| 11 | <img src="mpg_colors_wire/__brown.png" width="80" height="40"> <p>BROWN</p>  |D6| Z, 3  | Axis of coordinates |
| 12 | <img src="mpg_colors_wire/__brown_black.png" width="80" height="40"> <p>BROWN_BLACK</p>  |D7| 4  | Axis of coordinates |
| 13 | <img src="mpg_colors_wire/__pink.png" width="80" height="40"> <p>PINK</p>  |D8| 5  | Axis of coordinates |
| 14 | <img src="mpg_colors_wire/__pink_black.png" width="80" height="40"> <p>PINK_BLACK</p> |D9| 6  | Axis of coordinates |
|-|-|-| -  |-|
| 15 | <img src="mpg_colors_wire/__gray.png" width="80" height="40"> <p>GRAY</p>  |A1| X1, 0.1  | Amplificatory Multiple |
| 16 | <img src="mpg_colors_wire/__gray_black.png" width="80" height="40"> <p>GRAY_BLACK</p>  |A2| X10, 0.01  | Amplificatory Multiple |
| 17 | <img src="mpg_colors_wire/__orange.png" width="80" height="40"> <p>ORANGE</p>  |A3| X100, 0.001  | Amplificatory Multiple |
| 18 | <img src="mpg_colors_wire/__orange_black.png" width="80" height="40"> <p>ORANGE_BLACK</p> |   | COM, GND  | Control Switch |
|-|-|-| -  |-|
| 19 | <img src="mpg_colors_wire/__lightblue.png" width="80" height="40"> <p>LIGHT_BLUE</p>   |A0| C  | Emergency Switch, Imperative Switch |
| 20 | <img src="mpg_colors_wire/__blue_black.png" width="80" height="40"> <p>BLUE_BLACK</p>   |   | CN, GND  | Emergency Switch GND |
| 21 | <img src="mpg_colors_wire/__red_black.png" width="80" height="40"> <p>RED_BLACK</p>   |   | -  | Spare |
| 22 | SHIELD   |-| -| GND/SHIELD |
|-|-|-| -  |-|
| 23 | Not Connected   |-| -| - |
| 24 | Not Connected   |-| -| - |
| 25 | Not Connected   |-| -| - |

	


**PCB prototype**


<p align="center">
  <img src="Doc/TOP_Side.jpg" width="1000" height="682">
  <img src="Doc/BOT_side.jpg" width="1000" height="682">
</p>
















