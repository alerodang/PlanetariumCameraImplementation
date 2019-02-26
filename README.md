# Planetarium
A solar system simulation for university wich include two amera modes. Those camera modes are global camera and third person camera(associated to an object).
## Content
In this repository you can find:
+ The code for executing the program
+ Three animated gif of the execution
## Code Guide
In the draw function we have three main function calls:
### drawSun()
This function draws and gives style to the sun.
### drawPlanets()
This function draws and gives style and movement to the different drawn planets. 
In addition this function calls drawSatellite which draws a satellite around Jupiter planet.
### drawShip()
This function draws and gives style and movement to the spaceShip.
### drawCamera
This function draws and gives movement to the camera

## Controls
When executing the code you can move the spaceShip in two ways:
### Movement and orientation changes
You can move the spaceship throw different axis:
+ "W" to go forward
+ "S" to go backward
+ "7" and "9" to change orientation of X axis
+ "4" and "6" to change orientation of Z axis
+ "8" to go upwards
+ "8" to go down
### Change camera mode
For changing the camera mode you can click the mouse.
There are to camera modes.
#### Spaceship camera mode
This camera follows the spaceship.
#### Global camera mode
This camera gives a view of the whole planetarium.
You can move this camera with:
+ "+" and "-" for changing zoom
+ "2" and "0" for going up and down
You can change the orientation of the camera using:
+ "LEFT" and " fo"RIGHTr x axis
+ "UP" and "DOWN" for y axis
