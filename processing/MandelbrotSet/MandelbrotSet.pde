float minVal = -1.74995768370609350360221450;
float maxVal = 0.0000000000000000027879370656337940217829475379094436;
int maxIterations = 150;
void setup() {
  size(512,512);
  loadPixels();
  colorMode(HSB, 100);
}

void draw() {
  for(int y=0; y<height; y++) {
    for(int x=0; x<width; x++) {
      int loc = (y*width + x);
      
      float a = map(x, 0, width, minVal, maxVal);
      float b = map(y, 0, height, minVal, maxVal);
 
      float sA = a;
      float sB = b;
      
      float n = 0;
      
      while(n < maxIterations) {
        
        float zA = a*a - b*b;
        float zB = 2*a*b;
        
        a = zA + sA;
        b = zB + sB;
    
        
        if(abs(a+b) > 20) {
          break;
        }
        
        n++;
      }
      
      int brightness = (int) map(n, 0, maxIterations, 0, 360);
      pixels[loc] = color(brightness, 255, 255);
    }
  }
  updatePixels();
}

void keyPressed() {
  if(keyCode == ' ') {
    saveFrame("thumbnail.jpg");
  }
}
