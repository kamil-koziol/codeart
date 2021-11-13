int scl = 4;
int cols;
int rows;
float inc = 0.01;

int particlesAmount = 30000;
Particle[] particles;

PVector[][] flowfield;

void setup() {
  size(1080, 1920);
  background(0);

  cols = floor(width / scl);
  rows = floor(height / scl);
  
  flowfield = new PVector[rows][cols];

  particles = new Particle[particlesAmount];
  for(int i=0; i < particlesAmount; i++) {
    particles[i] = new Particle();
  }
  
  // Particle Settings
  stroke(255, 255, 255, 1);
  strokeWeight(1);
  noFill();

}

float zoff = 0;
float yoff = 0;
float xoff = 0;

void draw() {
  yoff = 0;
    for(int y=0; y<rows; y++) {
      xoff = 0;
      for(int x=0; x<cols; x++) {
        float angle = noise(xoff, yoff, zoff) * TWO_PI * 4;
        PVector flow = PVector.fromAngle(angle);
        flowfield[y][x] = flow;
        
        xoff += inc;
      }
      
      yoff += inc;
    }
  
  zoff += 0.001;
  
  for(int i=0; i<particles.length; i++) {
    particles[i].follow(flowfield);
    particles[i].update();
    particles[i].edges();
    particles[i].show();
  }
 
  // saveFrame("frames/frame" + nf(frameCount, 5) + ".tif");
  // if(frameCount == 60 * 15) {
  //   exit();
  // }
  
}
