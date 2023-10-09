void setup() {
  size(800,800);
  background(0);
  rectMode(CENTER);
  noFill();
  stroke(255);
  colorMode(HSB);
}

float size = width*4;
float offset = 0;
float offsetter = 5;
void draw() {
  translate(width/2, height/2);
  float hue = map(abs(size), 0, width, 90,180);
  stroke(hue,360,360);
  rotate(offset);
  for(int i=1;i<=1;i++) {
  rect(0,0,size/i,size/i);
  }
   offset += PI/offsetter;
   offsetter += 1;
   size -= 1;
}
