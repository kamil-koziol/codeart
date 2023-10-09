int scale = 16;
int rows;
int cols;

float xoff = 0;
float yoff = 0;
float zoff = 0;

float loff = 0;

int FPS = 60;

void setup() {
  size(1080, 1920);
  colorMode(HSB, 360, 360, 360, 100);
  rows = height / scale;
  cols = width / scale;
  strokeWeight(8);
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
      //float hue = map(angle, 0, 1, 160, 360);
      float hue = (angle * 360);
      stroke(hue, 360 ,360, ss);
      float dX = x*scale;
      float dY = y*scale;
      
      point(dX + vec.x, dY + vec.y);
      xoff += 0.01;
    }
    
    xoff = 0;
    yoff += 0.01;
  }
  
  
  zoff += 0.060 / FPS;
     saveFrame("frames/frame" + nf(frameCount, 5) + ".tif");
   if(frameCount == FPS * 10) {
     exit();
   }
   print(frameRate + "\n");
}
