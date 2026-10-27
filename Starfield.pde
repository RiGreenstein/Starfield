int totalParticles = 10000;
Particle[] particles = new Particle[totalParticles];

void setup()
{
  size(800, 800);
  colorMode(HSB, 360, 100, 100, 100); 
  background(0);
  
  particles[0] = new OddballParticle(0, 800, 7*PI/4);
  particles[1] = new OddballParticle(800, 800, 5*PI/4);
  particles[2] = new OddballParticle(800, 0, 3*PI/4);
  particles[3] = new OddballParticle(0, 0, PI/4);
  
  for (int i = 4; i < totalParticles; i++) {
    particles[i] = new Particle();
  }
}
void draw() {
  fill(0, 0, 0, 12); 
  rect(0, 0, width, height);
  
  for (int i = 0; i < totalParticles; i++) {
    particles[i].move();
    particles[i].show();
  }
}
class Particle
{
  double xPos, yPos, speed, angle;
  int Color, pSize;
  
  Particle() {
    xPos = 400;
    yPos = 400;
    speed = 1;
    pSize = 10;
    angle = Math.random()*2*PI;
    
    Color = color(degrees((float)angle), 85, 100, 70);
  }
  
  void move() {
    xPos += Math.cos(angle)*speed;
    yPos += Math.sin(angle)*speed;
    speed *= 1.005;
    speed = Math.min(speed, 3);
    
    double radius = pSize/2;
    
    if (xPos < radius) {
      xPos = radius;
      angle = PI-angle;
    } else if(xPos > width - radius) {
      xPos = width - radius;
      angle = PI-angle;
    }
    
    if (yPos < radius) {
      yPos = radius;
      angle *= -1;
    } else if(yPos > height - radius) {
      yPos = height - radius;
      angle *= -1;
    }
    
    Color = color(degrees((float)((angle % (2 * PI) + (2 * PI)) % (2 * PI))), 85, 100, 70);
  }
  
  void show() {
    fill(Color);
    noStroke();
    ellipse((float)xPos, (float)yPos, 10, 10);
  }
}

class OddballParticle extends Particle {
 OddballParticle(double x, double y, double a) {
   xPos = x;
   yPos = y;
   speed = 1;
   angle = a;
   pSize = 50;
   Color = color((int)(Math.random()*156+100));
 }
 
 void move() {
   xPos += Math.cos(angle)*speed;
   yPos += Math.sin(angle)*speed;
   speed *= 1.005;
   speed = Math.min(speed, 3);
   
   double radius = pSize/2;
    
   if (xPos < radius) {
     xPos = radius;
     angle = PI-angle;
   } else if(xPos > width - radius) {
     xPos = width - radius;
     angle = PI-angle;
   }
    
   if (yPos < radius) {
     yPos = radius;
     angle *= -1;
   } else if(yPos > height - radius) {
     yPos = height - radius;
     angle *= -1;
   }
 }
 
 void show() {
   fill(Color);
   noStroke();
   ellipse((float)xPos, (float)yPos, 50, 50);
 }
}
