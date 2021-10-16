float r = 1;
float theta = 0;
float hue = 0;
float vel = 0.1;
int phase = 1;
int updates = 1;

void setup() {
  size(1080, 1080);
  background(0);
  colorMode(HSB, 360, 100, 100);
}

void draw() {
    for(int i=0; i<100; i++) {
    float x = r * cos(theta);
    float y = r * sin(theta);
    
    noStroke();
    fill(hue%360, 70, 100);
    
    ellipse(x+width/2, y + height/2, 4, 4);
    theta += vel;
    }
    
    vel += 0.001;
    //r += abs(sin(theta)); 
    r += vel;
    hue += vel;
    
    saveFrame("frames" + phase + "/frame" + nf(updates, 5) + ".jpg");
    if(r > width/2 + width/5) {
      
      r = 1;
      background(0);
      phase++;
      updates = 0;
      if(phase == 10) {
        exit();
      }
    }
    
    updates++;
}
