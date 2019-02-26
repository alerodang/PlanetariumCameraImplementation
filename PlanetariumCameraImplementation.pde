PImage image;
PImage shipTexture;
PImage sunTexture;
float[] desp = {0.5,1,0.75,1.2,0.8,1,2};
float[] distanceX = {1,1.8,2.3,3,3.6,5.5,0.5};
float[] inverseTimes = {1,5,8,3.8,12,5,15};
float[] ang = {0,0,0,0,0,0,0};
float sunSize = 600;
String[] names = {"Sun","Mercury", "Venus", "Earth", "Mars", "Jupiter"};
int[] colorFirstComponent = {255,65,249,45,254,191,144};
int[] colorSecondComponent = {111,79,72,80,162,162,130};
int[] colorThirdComponent = {0,186,59,235,122,122,130};
int camera;
PShape ship;
int xShipCoordinate;
int yShipCoordinate;
int zShipCoordinate;
float rotationX = 0;
float rotationY = 0;
float rotationZ = 0;
float velocity = 200;
float xCameraDirection;
float zCameraDirection;
float yCameraDirection;
float eyeX;
float eyeY;
float eyeZ;
float centerX;
float centerY;
float centerZ;
float upX;
float upY;
float upZ;

void setup(){
  size(1000, 683, P3D);
  stroke(0);
  imageMode(CENTER);
  image = loadImage("background.jpg");
  ship = loadShape("Quarren Coyote Ship.obj");
  shipTexture = loadImage("shipTexture.jpg");
  ship.setTexture(shipTexture);
  xShipCoordinate = width/2;
  yShipCoordinate = height/2;
  zShipCoordinate = 3000;
  xCameraDirection = width/2.0;
  zCameraDirection = 0;
  yCameraDirection = width/2.0;
  setUpCamera();
}

void draw(){
  background(image);
  showShip();
  drawCamera();
  pushMatrix();
  translate(width/2, height/2,0);
  rotateX(radians(-10));
  drawSun();
  drawPlanets();
  popMatrix();
}

void drawCamera(){
  if (camera == 1){
    moveCamera();
    camera(eyeX,eyeY,eyeZ,centerX,centerY,centerZ,upX,upY,upZ);
  }
  else camera(xShipCoordinate , yShipCoordinate, zShipCoordinate + 3000, xCameraDirection, yShipCoordinate, zCameraDirection, 0, 1, 0);
}

void showShip() {
  pushMatrix();
  moveShip();
  translate(xShipCoordinate, yShipCoordinate, zShipCoordinate);
  rotateY(rotationY);
  rotateZ(rotationZ);
  rotateX(rotationX);
  shape(ship);
  popMatrix();
}

void moveShip() {
  if (keyPressed) {
    if (key == 'w') {
      xShipCoordinate += velocity*sin(rotationY);
      zShipCoordinate += velocity*cos(rotationY);
      xCameraDirection += velocity*sin(rotationY);
      zCameraDirection += velocity*cos(rotationY);
    } else if (key == 's') {
      xShipCoordinate -= velocity*sin(rotationY);
      zShipCoordinate -= velocity*cos(rotationY);
      xCameraDirection -= velocity*sin(rotationY);
      zCameraDirection -= velocity*cos(rotationY);
    } if (key == '5') {
      yShipCoordinate += velocity;
    } else if (key == '8') {
      yShipCoordinate -= velocity;
    } else if (key == '7') {
      rotationY -= PI/8;
    } else if (key == '9') {
      rotationY  += PI/8;
    } else if (key == '4') {
      rotationZ += PI/8;
    } else if (key == '6') {
      rotationZ  -= PI/8;
    }
  }
}

void drawSun(){
  ang[0] = ang[0] + desp[0];
  pushMatrix();
  fill(colorFirstComponent[0],colorSecondComponent[0],colorThirdComponent[0]);
  //stroke(colorFirstComponent[0],colorSecondComponent[0],colorThirdComponent[0]);
  drawName(320,names[0]);
  rotateY(radians(ang[0]));
  sphere(sunSize);
  texture(sunTexture);
  popMatrix();
  
  ang[0] = ang[0] + desp[0];
}

void drawName(int size, String name){
  pushMatrix();
  textSize(size);
  translate(-300,-1000);
  text(name, 10, 30); 
  popMatrix();
}

void drawPlanets(){
  for (int i = 1; i <= 5; i++){
    drawPlanet(i);
  }
}

void drawPlanet(int i ){
  ang[i] = ang[i] + desp[i];
  pushMatrix();
  rotateY(radians(ang[i]));
  translate(-sunSize*distanceX[i],0,0);
  fill(colorFirstComponent[i],colorSecondComponent[i],colorThirdComponent[i]);
  stroke(colorFirstComponent[i],colorSecondComponent[i],colorThirdComponent[i]);
  sphere(sunSize/inverseTimes[i]);
  rotateY(-radians(ang[i]));
  drawName(140,names[i]);
  if (i == 5) drawSatellite();
  rotateX(radians(-30));
  popMatrix();
}

void drawSatellite() {
  ang[6] = ang[6] + desp[6];
  pushMatrix();
  rotateX(radians(ang[6]));
  translate(0,-sunSize*distanceX[6],-sunSize*distanceX[6]);
  fill(colorFirstComponent[6],colorSecondComponent[6],colorThirdComponent[6]);
  stroke(colorFirstComponent[6],colorSecondComponent[6],colorThirdComponent[6]);
  sphere(sunSize/inverseTimes[6]);
  rotateY(-radians(ang[6]));
  rotateX(radians(-30));
  popMatrix();
}

void mouseClicked() {
  if (camera == 0) {
    camera = 1;
  } else if (camera == 1){
    camera = 0;
    setUpCamera();
  }
}

void setUpCamera(){
  //posicion
  eyeX = width/2.0;
  eyeY = height/2.0;
  eyeZ = 4000;
  //cuello
  centerX = width/2.0;
  centerY = height/2.0;
  centerZ = 0;
  upX = 0;
  upY = 1;
  upZ = 0;
}

void moveCamera(){
  if (keyPressed) {
    if (key == CODED) {
       if (keyCode == DOWN) {
         centerY += 50;
       } else if (keyCode == UP) {
         centerY -= 50;
       } else if (keyCode == RIGHT) {
         centerX += 50;
       } else if (keyCode == LEFT) {
         centerX -= 50;
       }
    } else if (key == '+'){
       eyeZ -= 100;
    } else if (key == '-'){
       eyeZ += 100;
    } else if (key == '1'){
       eyeX -= 100;
       centerX -= 100;
    } else if (key == '3'){
       eyeX += 100;
       centerX += 100;
    } else if (key == '2'){
       eyeY -= 100;
       centerY -= 100;
    } else if (key == '0'){
       eyeY += 100;
       centerY += 100;
    }
  }
}
