long dt;
long last;
color colors[];

void setup() {
  size(800, 800);
  background(0);
  loadPixels();
  colors = new color[16];
  
    colors[0] = color (66, 30, 15);
    colors[1] = color(25, 7, 26);
    colors[2] = color(9, 1, 47);
    colors[3] = color(4, 4, 73);
    colors[4] = color(0, 7, 100);
    colors[5] = color(12, 44, 138);
    colors[6] = color(24, 82, 177);
    colors[7] = color(57, 125, 209);
    colors[8] = color(134, 181, 229);
    colors[9] = color(211, 236, 248);
    colors[10] = color(241, 233, 191);
    colors[11] = color(248, 201, 95);
    colors[12] = color(255, 170, 0);
    colors[13] = color(204, 128, 0);
    colors[14] = color(153, 87, 0);
    colors[15] = color(106, 52, 3);
 
}


double zoom = 1.0;
double range = 2.0;

double ox = 0.0;
double oy = 0.0;

double intDiv(int a, int b) {
  return ((double) a)/((double) b);
}

void draw() {  
  range *= 0.99;
  
     PVector mouse = new PVector(mouseX, mouseY);
   PVector middle = new PVector(width/2, height/2);
   
   PVector dir = (mouse.sub(middle)).normalize();
   
double step = 0.1;
  ox = lerp((float) ox, (float) (ox+dir.x*range), 0.01);
  oy = lerp((float) oy, (float) (oy+dir.y*range), 0.01);
  
  for(int y=0; y<height; y++) {
    for(int x=0; x<width; x++) {
      double x_val = (intDiv(x, width) - 0.5) * 2 *range + ox;
      double y_val = (intDiv(y, height) - 0.5) * 2 * range + oy;
      
      int iters = 1025;// 129
      Complex c = new Complex(x_val, y_val);
      
      int val = calculateValue(c, iters);
      
      double quot = (double) val/ (double) iters;
      
      quot *= 15;
      
      color col = colors[val%16];
      
      int idx = (y*width + x);
      pixels[idx] = col;
    }
  }
  
  updatePixels();
   //saveFrame("frames/frame" + nf(frameCount, 5) + ".tif");
   //if(frameCount == 60 * 180) {
   //  exit();
   //}
}

void keyPressed() {
  
   PVector mouse = new PVector(mouseX, mouseY);
   PVector middle = new PVector(width/2, height/2);
   
   PVector dir = (mouse.sub(middle));
   
double step = 0.1;
  ox = lerp((float) ox, (float) ox+dir.x, 0.1);
  oy = lerp((float) oy, (float) oy+dir.y, 0.1);
  
  if(keyCode == UP) {
    oy -= range*step;
  }
  
  if(keyCode == DOWN) {
    oy = lerp((float) oy, (float) (oy + dir.y),  0.1);
  }
  
  if(keyCode == LEFT) {
    ox -= range*step;
  }

  if(keyCode == RIGHT) {
    ox += range*step;
  }


}

int calculateValue(Complex c, int iterations) {
  Complex z = new Complex(0.0, 0.0);
  
  for(int i=0; i<iterations; i++) {
    z.multi(z);
    z.add(c);
    
    double th = 4;
    double mag = (z.real * z.real) + (z.img *z.img);
    if(mag > th) {
      return i;
    }
  }  
  
  return iterations;
}
