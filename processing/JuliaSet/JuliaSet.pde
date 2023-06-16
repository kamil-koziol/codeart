float minVal = -2;
float maxVal = 2;

float maxIterations = 100;
float angle = 0;

float cA = 0.285;
float cB = 0.01;

void setup() {
  size(1080, 1080);
  loadPixels();
  colorMode(HSB, 360, 100, 100);
}

void draw() {
  for(int y=0; y<height; y++) {
    for(int x=0; x<width; x++) {
      int loc = (y*width + x);
      
      float a = map(x, 0, width, minVal, maxVal);
      float b = map(y, 0, height, minVal, maxVal);
      
      
      float n = 0;
      
      while(n < maxIterations) {
        
        float zA = a*a - b*b;
        float zB = 2*a*b;
        
        a = zA + cA;
        b = zB + cB;
    
        
        if(abs(a+b) > 4) {
          break;
        }
        
        n++;
        
      }
      
      int hue = (int) map(n, 0, maxIterations, 0, 360);
      if(n < 11) {
        pixels[loc] = color(0);
      }
      else {
        pixels[loc] = color(hue, 80, 100);
      }
    }
  }
  angle += 0.01;
  cA = sin(angle);
  cB = cos(angle);
  
  updatePixels();
  
  if(abs(degrees(cA)) <= 0.01) {
    
  }
   saveFrame("frames/framea" + nf(frameCount, 5) + ".tif");
  if(frameCount == 1) {
    exit();
  }
}
