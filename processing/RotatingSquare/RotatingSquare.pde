float a = 0;
float b = 8;
void setup() {
  size(600,600);
  noFill();
  background(0);
  stroke(255);
  strokeWeight(1);
  colorMode(HSB);
}

void draw() {
  stroke((a*20)%360,255,255,255);
  translate(width/2, height/2);
  rotate(a);
  rect(0,0, a,a);
  a+=PI/b;
  //b += 0.01;
  saveFrame("frames/frame#####.tif");
  if(frameCount >= 600) {
    exit();
  }
}
