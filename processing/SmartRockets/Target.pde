class Target {
  PVector pos;
  
  public Target(PVector position) {
    this.pos = position;
  }
  
  void show() {
    push();
    fill(255);
    noStroke();
    ellipse(this.pos.x, this.pos.y, 30, 30);
    pop();
  }
}
