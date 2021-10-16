float angle = 0;
int w = 150;
int cols, rows;
float hue = 0;

float d;
float r;

PGraphics trails;
  
void setup() {
  size(1080,1080);
  w = width/8;
  
  trails = createGraphics(width, height);
  
  d = w - 20;
  r = d/2;
  cols = width/w;
  rows = height/w;
  background(0);
  trails.colorMode(HSB, 360, 100, 100);
  
  trails.beginDraw();
  trails.noFill();
  for(int i=1; i<cols; i++) {
    float x = i*w + w/2;
    float y = w/2;
    trails.stroke(255);
    trails.strokeWeight(1);
    trails.ellipse(x,y, d,d);
  }
  
  for(int i=1; i<rows; i++) {
    float x = w/2;
    float y = i*w + w/2;
    trails.stroke(255);
    trails.strokeWeight(1);
    trails.ellipse(x,y, d,d);
  }
  
  trails.endDraw();
  
  
}

void draw() {
  background(0);
  
  trails.beginDraw();
  trails.noFill();
  
  for(int i=1; i<cols; i++) {
    float x = i*w + w/2;
    float y = w/2;
    trails.stroke(hue, 255,255);
    float px = r*cos(angle*i);
    float py = r*sin(angle*i);
    trails.strokeWeight(8);
    trails.point(x+px, y+py);
    
    // lines
    strokeWeight(1);
    stroke(255, 10);
    line(x + px, 0, x + px, height); 
    
  }
  
  for(int i=1; i<rows; i++) {
    float x = w/2;
    float y = i*w + w/2;
    float px = r*cos(angle*i);
    float py = r*sin(angle*i);
    trails.stroke(hue,100, 100);
    trails.strokeWeight(8);
    trails.point(x+px, y+py);
  }
  
  for(int i=1; i<cols; i++) {
    for(int j=1; j<rows; j++) {
      float x = i*w + w/2;
      float y = j*w + w/2;
      float px = r*cos(angle*i);
      float py = r*sin(angle*j);
      trails.stroke(hue, 100,100);
      trails.strokeWeight(8);
      trails.point(x+px, y+py);
    }
  }
  
  trails.endDraw();
  
  angle+=0.005;
  hue = map(angle, 0, TWO_PI, 0, 360 * 5);
  hue %= 360;
  
  //saveFrame("frames/frame" + nf(frameCount, 5) + ".tif");
  //if(angle >= TWO_PI) {
  //  exit();
  //}
  
  image(trails, 0, 0);
}
