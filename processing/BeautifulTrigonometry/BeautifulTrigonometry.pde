// Settings
int dotsAmount = 2;
boolean showLines = false;
boolean showCirclingDot = false;
boolean showCircle = false;


float angle = 0;
int d;
int r;

void setup(){
  size(400, 400);
  colorMode(HSB);
  d = width - width/10;
  r = d/2;
}

void draw(){
  background(0);
  translate(width/2, height/2);
  noFill();
  
  if(showCircle) {
    stroke(255);
    strokeWeight(1);
    circle(0,0,d);
  }
  
  if(showLines) {
    for(float i=0; i<=PI; i+=PI/dotsAmount) {
      stroke(255);
      strokeWeight(1);
      line(r*cos(i),r*sin(i),-r*cos(i),-r*sin(i)); 
    }
  }
  
  for(float i=0; i<=PI; i+=PI/dotsAmount) {
    stroke((int)map(i,0,PI,0,255), 255,255);
    strokeWeight(width/50);
    point(r*cos(i)*sin(angle + i), r*sin(i)*sin(angle + i));
  }
  
  if(showCirclingDot) {
    stroke(255);
    strokeWeight(8);
    point(r*sin(angle), r*cos(angle));
  }
  
  angle += 0.02;
}

void keyPressed() {
  switch(key) {
    case '1': {
      showLines = !showLines;
      break;
    }
    
    case '2': {
      showCirclingDot = !showCirclingDot;
      break;
    }
    
    case '3': {
      showCircle = !showCircle;
      break;
    }
    
    case '+': {
      dotsAmount++;
      break;
    }
    
    case '-': {
      dotsAmount--;
      break;
    }
    
    case ' ': {
      saveFrame("thumbnail.jpg");
      break;
    }
  }
}
