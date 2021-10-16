float angle = 0;
float sA = 0;
float hueChange = 0;
int offset = 250;

void setup() {
  size(1000, 1000);
  background(20);
  
  colorMode(HSB, 360, 100, 100);
  
}

PVector pos = new PVector(0,0);
float vel = 0.0;
float a = 0;

int divider = 24;
void draw() {
  //background(0);
    
    angle = sA;
    
    for(int i=offset; i <= width - offset; i+= width/48) {
      float y = map(sin(angle), -1, 1, offset, height - offset);
      float hue = map(i, offset, width - offset, 0, 360);
      noStroke();
      fill((hue + hueChange) % 360, 80, 100, 150);
      ellipse(i,y,width/20, width/20);
      
      hue = map(y, offset, width - offset, 0, 360);
      fill((hue + hueChange) % 360, 80, 100, 150);
      ellipse(y, i, width/20, width/20);
      angle += 0.1;
    }
    
    sA += vel;
    vel += sin(a) / 100 / 2;
    a += 0.1;
    hueChange += 3;
    
    saveFrame("frames/frame" + nf(frameCount, 5) + ".tif");
  
}
