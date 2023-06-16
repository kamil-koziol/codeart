void setup() {
  size(600,600);
}

void draw() {
  background(0);
  translate(width/2, height/2);
  
  circle(0, 0, width/5);
  float a = map(mouseX, 0, width, -2, 2);
  float b = map(mouseY, 0, height, -2, 2);
 
  float sA = a;
  float sB = b;
  
  float n = 0;
  float z = 0;
  
  stroke(255);
  noFill();
  beginShape();
  
  vertex(a,b);
  while(n < 100) {
    
    float zA = a*a - b*b;
    float zB = 2*a*b;
    
    a = zA + sA;
    b = zB + sB;
    
    vertex(a * 300, b * 300);

    
    if(abs(a+b) > 20) {
      break;
    }
    
    n++;
  }
  endShape();
}
