class Particle{
  double myX, myY, myAngle, mySpeed;
  int myColor, randoC, mySize;
  Particle(){
    myX = (int)(Math.random()*10)+195;
    myY = (int)(Math.random()*10)+195;
    myColor = (int)(Math.random()*255);
    myAngle = (Math.random()*360)+1;
    mySpeed = (Math.random()*10)+2;
    randoC = (int)(Math.random()*7);
    mySize = 4;
  }
  void move(){
    myX += cos((float)(myAngle*(PI/180)))*mySpeed;
    myY += sin((float)(myAngle*(PI/180)))*mySpeed;
  }
  void show(){
    if(randoC == 0)
      fill(myColor, 0, 0);
    else if (randoC == 1)
      fill(0, myColor, 0);
    else if (randoC == 2)
      fill(0, 0, myColor);
    else if (randoC == 3)
      fill(myColor, myColor, 0);
    else if (randoC == 4)
      fill(myColor, 0, myColor);
    else if (randoC == 5)
      fill(0, myColor, myColor);
    else if (randoC == 6)
      fill(myColor, myColor, myColor);
    else
      fill((float)myColor, (float)myColor, (float)myColor);
    ellipse((float)(myX), (float)(myY), (float)mySize, (float)mySize);
  }
}

class Asteroid extends Particle{
  Asteroid(){
    myX = (int)(Math.random()*10)+195;
    myY = (int)(Math.random()*10)+195;
    myColor = 150;
    myAngle = (Math.random()*360)+1;
    mySpeed = 1;
    mySize = 10;
    randoC = 7;
  }
}

Particle [] things = new Particle [800];

void setup(){
  size(400, 400);
  noStroke();
  for(int i = 0; i<things.length; i++){
    things[i] = new Asteroid();
  }
  for(int i = 1; i<things.length; i++){
    things[i] = new Particle();
  }
}
void draw(){
  background(0);
  for(int i = 0; i<things.length; i++){
    things[i].move();
    things[i].show();
  }
}
void mousePressed(){
  for(int i = 0; i<things.length; i++){
    things[i] = new Asteroid();
  }
  for(int i = 1; i<things.length; i++){
    things[i] = new Particle();
  }
  redraw();
}
