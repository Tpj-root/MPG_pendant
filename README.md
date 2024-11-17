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









### DB25 Port Connector Pinout Configuration


| Pin_Number | Pin_Color | Pin_ArduinoNano  | Pin_Signal  | Pin_Description |
| --- |  --- | --- |  --- | --- |
| 1 | <img src="colurs/red.png" width="20" height="20"> <p>RED</p> |   | +V, VCC, +5V5  | Rotary Encoder |
| 2 | <img src="colurs/black.png" width="20" height="20"> <p>BLACK</p>  |   | 0V, GND  | Rotary Encoder |
| 3 | <img src="colurs/green.png" width="20" height="20"> <p>GREEN</p>  |D2| A  | Rotary Encoder |
| 4 | <img src="colurs/white.png" width="20" height="20"> <p>WHITE</p>  |D3| B  | Rotary Encoder |
| 5 | <img src="colurs/purple.png" width="20" height="20"> <p>PURPLE</p>  |   | A/  | Line Driver Type |
| 6 | <img src="colurs/purple_black.png" width="20" height="20"> <p>PURPLE_BLACK</p>  |   | B/  | Line Driver Type |
| 7 | <img src="colurs/green_black.png" width="20" height="20"> <p>GREEN_BLACK</p>  |   | +  | Show Lamp |
| 8 | <img src="colurs/white_black.png" width="20" height="20"> <p>WHITE_BLACK</p>  |   | -, GND  | Show Lamp |
|-|-|-| OFF  | - |
| 9 | <img src="colurs/yellow.png" width="20" height="20"> <p>YELLOW</p>  | D4| X, 1  | Axis of coordinates |
| 10 | <img src="colurs/yellow_black.png" width="20" height="20"> <p>YELLOW_BLACK</p>  |D5| Y, 2  | Axis of coordinates |
| 11 | <img src="colurs/brown.png" width="20" height="20"> <p>BROWN</p>  |D6| Z, 3  | Axis of coordinates |
| 12 | <img src="colurs/brown_black.png" width="20" height="20"> <p>BROWN_BLACK</p>  |D7| 4  | Axis of coordinates |
| 13 | <img src="colurs/pink.png" width="20" height="20"> <p>PINK</p>  |D8| 5  | Axis of coordinates |
| 14 | <img src="colurs/pink_black.png" width="20" height="20"> <p>PINK_BLACK</p> |D9| 6  | Axis of coordinates |
|-|-|-| -  |-|
| 15 | <img src="colurs/gray.png" width="20" height="20"> <p>GRAY</p>  |A1| X1, 0.1  | Amplificatory Multiple |
| 16 | <img src="colurs/gray_black.png" width="20" height="20"> <p>GRAY_BLACK</p>  |A2| X10, 0.01  | Amplificatory Multiple |
| 17 | <img src="colurs/orange.png" width="20" height="20"> <p>ORANGE</p>  |A3| X100, 0.001  | Amplificatory Multiple |
| 18 | <img src="colurs/orange_black.png" width="20" height="20"> <p>ORANGE_BLACK</p> |   | COM, GND  | Control Switch |
|-|-|-| -  |-|
| 19 | <img src="colurs/lightblue.png" width="20" height="20"> <p>LIGHT_BLUE</p>   |A0| C  | Emergency Switch, Imperative Switch |
| 20 | <img src="colurs/blue_black.png" width="20" height="20"> <p>BLUE_BLACK</p>   |   | CN, GND  | Emergency Switch GND |
| 21 | <img src="colurs/red_black.png" width="20" height="20"> <p>RED_BLACK</p>   |   | -  | Spare |
| 22 | SHIELD   |-| -| GND/SHIELD |
|-|-|-| -  |-|
| 23 | Not Connected   |-| -| - |
| 24 | Not Connected   |-| -| - |
| 25 | Not Connected   |-| -| - |

	


