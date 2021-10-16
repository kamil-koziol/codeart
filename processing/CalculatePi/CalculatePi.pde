float points = 0;
float pointsInCircle = 0;

void setup() {
  size(512, 512);
  background(0);
}
void draw() {
  noFill();
  stroke(255);
  strokeWeight(1);
  circle(width/2, height/2, width);
  
  for(int i=0; i<100; i++) {
    float randX = random(1) * width;
    float randY = random(1) * height;
  
    if(dist(randX, randY, width/2, height/2) > width/2) {
      stroke(120,255,0);
    } else {
      stroke(200, 100, 255);
      pointsInCircle++;
    }
    
    points++;
    
    point(randX, randY);
    //line(width/2, height/2, randX, randY);
  }
  
  //text(pointsInCircle/points*4, width/2, height/2);
  float pi = pointsInCircle/points*4;
  print(pi + "\n");
}

void keyPressed() {
  if(keyCode == ' ') {
    saveFrame("thumbnail.tif");
  }
}
