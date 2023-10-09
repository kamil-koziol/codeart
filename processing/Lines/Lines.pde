int scale = 16;
int rows;
int cols;

float xoff = 0;
float yoff = 0;
float zoff = 0;

float loff = 0;
long seed;

void setup() {
  size(1024, 1024, P2D);
  colorMode(HSB, 360, 360, 360, 100);
  rows = height / scale;
  cols = width / scale;
  seed = (long) random(1000000000);
  noiseSeed(seed);
  
}

void draw() {
  background(0);
  xoff = 0;
  yoff = 0;
  for(int y=-10; y<rows + 10; y++) {
    for(int x=-10; x<cols + 10; x++) {
      float angle = noise(xoff, yoff, zoff);
      PVector vec = PVector.fromAngle(angle * TWO_PI * 4);
      
      float l = 1 + noise(xoff, yoff, zoff) * scale * 16;
      vec.mult(l);
      
      float ss = noise(xoff , yoff , xoff * 10) * 150;
      float hue = map(angle, 0, 1, 220, 300);
      stroke(hue, 360 , 360 , ss - 40);
      float dX = x*scale;
      float dY = y*scale;
      
      strokeWeight(4);
      line(dX, dY, dX + vec.x, dY + vec.y);
      
      strokeWeight(8);
      point(dX + vec.x, dY + vec.y);
      xoff += 0.01;
    }
    
    xoff = 0;
    yoff += 0.01;
  }
  
  zoff += 0.001;
   //  saveFrame("frames/" + seed + "/frame" + nf(frameCount, 5) + ".tif");
   //if(frameCount == 60 * 30) {
   //  exit();
   //}
}
