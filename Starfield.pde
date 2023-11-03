class Particle{
  double myX, myY, myAngle, mySpeed;
  int myR, myG, myB, myOpacity;
  Particle(){
    myX = myY = 400;
    myAngle = (double)(Math.random()*2)*Math.PI;
    mySpeed = (double)(Math.random()*4);
    myR = (int)(Math.random()*50);
    myG = (int)(Math.random()*175);
    myB = (int)(Math.random()*200)+55;
  }
  void move(){
    myX = myX + Math.cos(myAngle)*mySpeed;
    myY = myY + Math.sin(myAngle)*mySpeed;
  }
  void show(){
    fill(myR, myG, myB);
    ellipse((int)myX, (int)myY, 8,8);
  }
}

class oddballParticle extends Particle{
  oddballParticle(){
    myX = myY = 400;
    myAngle = (double)(Math.random()*2)*Math.PI;
    mySpeed = (double)(Math.random()*4);
  }
  void move(){
    myX = myX + Math.cos(myAngle)*(int)mySpeed;
    myY = myY + Math.sin(myAngle)*(int)mySpeed;
  }
  void show(){
    fill(255,0,225);
    ellipse((int)myX, (int)myY, 10,10);
  }
}

Particle [] help = new Particle[1000];


void setup(){
  size (800,800);
  noStroke();
  for (int i = 0; i<300;i++){
    help[i] = new oddballParticle();
  }
  for (int i=300;i<help.length;i++){
    help[i] = new Particle();
  }

}
void draw(){
  fill(0,10);
  rect(0,0,800,800);
  frameRate(120);
  for (int i=0;i<help.length;i++){
    help[i].move();
    help[i].show();
  }

}
void mousePressed(){
  loop();
  for (int i = 0; i<300;i++){
    help[i] = new oddballParticle();
  }
  for (int i=300;i<help.length;i++){
    help[i] = new Particle();
  }
}
