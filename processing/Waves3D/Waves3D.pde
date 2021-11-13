float angle = 0;

void setup() {
  size(400, 400);
}

void draw() {
  background(0);
  translate(0, height/2);
  
  for(int i=0; i<width; i+= width/6) {
    float h = sin(angle + i*PI/6) * width/2;
    rect(i*width/6, 0, width/6, h);
  }
  angle += 0.1;
}
