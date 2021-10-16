class Target {
  constructor(x, y) {
    this.pos = createVector(x, y);
  }

  show() {
    push();
    fill(255);
    noStroke();
    circle(this.pos.x, this.pos.y, 30);
    pop();
  }
}
