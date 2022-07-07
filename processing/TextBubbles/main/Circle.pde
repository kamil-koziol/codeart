public class Circle {
  PVector position;
  float radius = 2;
  boolean active = true;
  public Circle(PVector position) {
    this.position = position;
  }
  
  void update() {
    if(!active) return;
    this.radius += 1;
  }
  
  void draw() {
    fill(255);
    ellipse(position.x, position.y, radius*2, radius*2);
  }
  
  boolean hitsEdge() {
    return (position.x - radius < 0 || position.x + radius > width 
    || position.y - radius < 0 || position.y + radius > height);
  }
  
  void checkIfCollides(ArrayList<Circle> circles) {
    for(Circle c: circles) {
      if(c == this) continue;
      float distance = dist(position.x, position.y, c.position.x, c.position.y) - 1;
      if(distance < this.radius + c.radius) {
        onCollision(c);
        break;
      }
      
    }
  }
  
  void onCollision(Circle other) {
    active = false;
    other.active = false;
  }
  
  boolean pointInside(PVector point) {
    float distance = dist(position.x, position.y, point.x, point.y);
    return distance < (radius);
  }
}
