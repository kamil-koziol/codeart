float x = 0;
float y = 0;

void setup() {
  size(400, 400);
  colorMode(HSB, 360, 100, 100, 100);
  background(0);
}

float nextPoint() {
  float nX, nY;
  float r = random(1);
  
  if(r < 0.01) {
    nX = 0;
    nY = 0.16 * y;
  }
  
  else if(r < 0.86) {
    nX = 0.85 * x + 0.04 * y;
    nY = -0.04 * x + 0.85 * y + 1.60; 
  }
  
  else if (r < 0.93) {
    nX = 0.20 * x + -0.26 * y;
    nY = 0.23 * x + 0.22 * y + 1.60;
  } 
  else {
    nX = -0.15 * x + 0.28 * y;
    nY = 0.26 * x + 0.24 * y + 0.44;
  }
  
  x = nX;
  y = nY;
  
  return r;
 
}

void drawPoint() {
  //range −2.1820 < x < 2.6558 and 0 ≤ y < 9.9983.
  float sx = map(x, -2.1820, 2.6558, 0, width);
  float sy = map(y, 0, 9.9983, height, 0);

  float h = map(sx, 0, width, 180, 270);
  float s = map(sy, 0, height, 0, 100);
  
  stroke(h, s, 100, 20);
  strokeWeight(1);
  point(sx, sy);
}

void draw() {
  for(int i=0; i<100; i++) {
    float r = nextPoint();
    drawPoint();
  }
  
  //saveFrame("frames/frame" + nf(frameCount, 5) + ".tif");
  //if(frameCount == 120 * 10) {
  //  exit();
  //}
}

void keyPressed() {
  if(keyCode == ' ') {
    saveFrame("thumbnail.jpg");
  }
}
