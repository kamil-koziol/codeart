// https://www.youtube.com/watch?v=WGccIFf6MF8

PImage img;
int nails = 36;
float radius;

void setup() {
    size(400, 400);
  img = loadImage("img.jpg");
  img.filter(GRAY);
  
  radius = width/2 - 20;
  
  background(0);
}

void draw() {
  image(img, 0,0);
  noFill();
  stroke(255);
  circle(width/2, height/2, radius*2);
  
  float angleStep = TWO_PI / (nails);
  float angle = 0;
  for(int i=0; i<nails; i++) {
    float nx = radius * cos(angle);
    float ny = radius * sin(angle);
    
    fill(255);
    circle(width/2 + nx,height/2 + ny, 20);
    angle += angleStep;
  }
}
