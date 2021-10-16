class Rocket {
  constructor(lifespan) {
    this.pos = createVector(width / 2, height - 5);
    this.vel = createVector();
    this.acc = createVector();
    this.lifespan = lifespan;
    this.dna = new DNA(this.lifespan);
    this.hitTarget = false;
    this.crashed = false;
    this.fitness = 0;
    this.updates = 0;
  }

  applyForce(force) {
    this.acc.add(force);
  }

  update(geneCount) {
    if (!this.hitTarget && !this.crashed) {
      this.applyForce(this.dna.genes[geneCount]);
      this.vel.add(this.acc);
      this.pos.add(this.vel);
      this.acc.mult(0);
    }

    if (!this.hitTarget) {
      this.updates++;
    }
  }

  show(best) {
    push();
    noStroke();
    if (best) {
      fill(0, 255, 0);
    } else {
      fill(255, 150);
    }
    translate(this.pos.x, this.pos.y);
    rotate(this.vel.heading());
    rectMode(CENTER);
    rect(0, 0, 25, 5);
    pop();
  }

  calcFittness(target) {
    this.fitness =
      1 /
      (dist(this.pos.x, this.pos.y, target.pos.x, target.pos.y) +
        this.updates / (this.lifespan / 10));
  }

  crossover(other) {
    var selfGenesAmount = parseInt(random(0, this.lifespan));

    var rocket = new Rocket(this.lifespan);

    for (var i = 0; i < this.lifespan; i++) {
      if (i < selfGenesAmount) {
        rocket.dna.genes[i] = this.dna.genes[i];
      } else {
        rocket.dna.genes[i] = other.dna.genes[i];
      }
    }
    return rocket;
  }

  collides(obstacle) {
    return (
      this.pos.x > obstacle.x &&
      this.pos.x < obstacle.x + obstacle.width &&
      this.pos.y > obstacle.y &&
      this.pos.y < obstacle.y + obstacle.height
    );
  }

  hitsEdge() {
    return (
      this.pos.x < 0 ||
      this.pos.x > width ||
      this.pos.y > height ||
      this.pos.y < 0
    );
  }
}
