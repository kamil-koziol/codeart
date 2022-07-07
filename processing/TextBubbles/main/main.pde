ArrayList<Circle> circles;
PImage img;
void setup() {
  size(1280,720);
  circles = new ArrayList<Circle>();
  stroke(0);
  strokeWeight(1);
  img = loadImage("Untitled.jpg");
  img.loadPixels();
  background(0);
  
  //image(img,0,0);
}

void draw() {
  boolean found = false;
  for(int i=0; i<5; i++) {
  int tries = 0;
  do {
  PVector randomPoint = new PVector(floor(random(width)), floor(random(height)));
  found = false;
  
  int flattenedPoint = floor(randomPoint.y * width + randomPoint.x);
  color col = img.pixels[flattenedPoint];
  if(brightness(col) == 255.0) {
    found = true;
    tries++;
  }
  
  for(Circle c: circles) {
    if(c.pointInside(randomPoint)) {
      found = true;
      break;
    }
  }
  
  if(!found) {
    circles.add(new Circle(randomPoint));
  }
  tries++;
  if(tries > 1000) {
    break;
  }
  } while(found);
  }
  
  for(Circle c: circles) {
    if(!c.active) continue;
    c.update();
    if(c.hitsEdge()) {
      c.active = false;
    }
    c.checkIfCollides(circles);
    c.draw();
  }
}
