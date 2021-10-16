class Rocket {
  PVector pos;
  PVector vel;
  PVector acc;
  DNA dna;
  boolean hitTarget = false;
  boolean crashed = false;
  float fitness = 0;
  int updates = 0;
  boolean best = false;
  
  public Rocket() {
    pos = new PVector(width/2, height-5);
    vel = new PVector();
    acc = new PVector();
    dna = new DNA();
  }
  
  void applyForce(PVector force) {
    acc.add(force);
  }
  
  void update() {
    if(hitTarget || crashed) return;
    
    applyForce(dna.genes[updates]);
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
    
    updates++;
  }
  
  void show() {
    push();
    
    noStroke();
    if(best) {
      fill(0, 255, 0);
    } else {
      fill(255, 150);
    }
    translate(pos.x, pos.y);
    rotate(vel.heading());
    rectMode(CENTER);
    rect(0, 0, 25, 5);
    
    pop();
  }
  
  void calcFitness() {
    fitness = 1 /
      (dist(this.pos.x, this.pos.y, target.pos.x, target.pos.y) +
        this.updates / (lifespan / 10));
  }
  
  Rocket crossover(Rocket other) {
    int selfGenesAmount = parseInt(random(0, lifespan));
  
      var rocket = new Rocket();
  
      for (var i = 0; i < lifespan; i++) {
        if (i < selfGenesAmount) {
          rocket.dna.genes[i] = this.dna.genes[i];
        } else {
          rocket.dna.genes[i] = other.dna.genes[i];
        }
      }
      
      return rocket;
  }
  
  boolean collides(Obstacle obstacle) {
    return (
      this.pos.x > obstacle.x &&
      this.pos.x < obstacle.x + obstacle.w &&
      this.pos.y > obstacle.y &&
      this.pos.y < obstacle.y + obstacle.h
    );
  }
  
  boolean hitsEdge() {
    return (
      this.pos.x < 0 ||
      this.pos.x > width ||
      this.pos.y > height ||
      this.pos.y < 0
    );
  }
  
  boolean hitsTarget(Target target) {
    var distanceFromTarget = dist(
        pos.x,
        pos.y,
        target.pos.x,
        target.pos.y
      );
      
      return distanceFromTarget < 15;
  }
  
  void crash() {
    hitTarget = true;
    pos = target.pos;
  }
  
  boolean hitsObstacles(Obstacle[] obstacles) {
    for(int i=0; i<obstacles.length; i++) {
      if(collides(obstacles[i])) return true;
    }
    
    return false;
  }
}
