public class Pendulum2D {
  float r;
  float angle = 180;
  float vel = 0;
  float acc = 0;
  float gravity;
  
  public Pendulum2D(float r, float gravity) {
    this.r = r;
    this.gravity = gravity;
  }
  
  void update() {
    acc = -gravity * sin(angle) / r;
    vel += acc;
    vel *= 0.995;
    angle += vel;
  }
  
  void draw() {
    float x = sin(angle) * r;
    float y = cos(angle) * r;
    
    noStroke();
    fill(255);
    ellipse(width/2+ x, height/2 + y, 16, 16);
    
    stroke(255);
    line(width/2, height/2, width/2 + x, width/2 + y);
  }
  
}
