int totalPoints = 500;
float r;
float factor = 1;

void setup() {
  size(512, 512);
  r = width/2.2;
  colorMode(HSB, 360, 100, 100);
}

PVector getVector(float index) {
  float angle = map(index, 0, totalPoints, 0, TWO_PI);
  PVector vector = PVector.fromAngle(angle);
  vector.mult(r);
  return vector;
}

void draw() {
  background(0);
  translate(width/2, height/2);

  for (int i=0; i<totalPoints; i++) {
    PVector pA = getVector(i);
    PVector pB = getVector((i * factor) % totalPoints);
    float hue = map((i * factor) % totalPoints, 0, totalPoints-1, 0, 360);
    stroke(hue, 100, 100, 75);
    line(pA.x, pA.y, pB.x, pB.y);
  }

  factor += 0.005;
}

void keyPressed() {
  if(keyCode == ' ') {
    saveFrame("thumbnail.jpg");
  }
}
