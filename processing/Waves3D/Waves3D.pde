float angle = 0;
int amount = 40;
void setup() {
  size(800, 800);
  rectMode(CENTER);
}

void draw() {
  background(0);
  translate(0, height/2);
  
  for(int i=0; i<amount; i+= 1) {
    float h = abs(sin(angle + i*PI/amount)) * height * 0.8;
    rect(i*width/amount, 0, width/amount, h);
  }
  angle += 0.01;
}
