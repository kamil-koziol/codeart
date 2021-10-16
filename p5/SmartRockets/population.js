class Population {
  constructor(size, target, obstacles) {
    this.rockets = [];
    this.size = size;
    this.lifespan = 300;
    this.geneCount = 0;
    this.target = target;
    this.obstacles = obstacles;

    for (var i = 0; i < this.size; i++) {
      this.rockets[i] = new Rocket(this.lifespan);
    }
  }

  update() {
    for (var i = 0; i < this.size; i++) {
      var distanceFromTarget = dist(
        this.rockets[i].pos.x,
        this.rockets[i].pos.y,
        this.target.pos.x,
        this.target.pos.y
      );

      if (distanceFromTarget < 15) {
        this.rockets[i].hitTarget = true;
        this.rockets[i].pos = this.target.pos;
      }

      this.obstacles.forEach((obstacle) => {
        if (this.rockets[i].collides(obstacle)) {
          this.rockets[i].crashed = true;
        }
      });

      if (this.rockets[i].hitsEdge()) {
        this.rockets[i].crashed = true;
      }
      this.rockets[i].update(this.geneCount);
      this.rockets[i].show(i == this.size - 1);
    }

    this.geneCount++;
  }

  newGeneration() {
    var bestFitness = 0;
    var bestRocket = this.rockets[0];

    for (var i = 0; i < this.size; i++) {
      this.rockets[i].calcFittness(this.target);

      if (this.rockets[i].crashed) {
        this.rockets[i].fitness /= 10;
      }

      if (this.rockets[i].fitness > bestFitness) {
        bestFitness = this.rockets[i].fitness;
        bestRocket = this.rockets[i];
      }
    }

    var results = {
      bestFitness: bestFitness,
      bestRocket: Object.assign({}, bestRocket),
    };

    // normalize fitnesses across all rockets
    for (var i = 0; i < this.size; i++) {
      this.rockets[i].fitness /= bestFitness;
    }

    var matingpool = [];

    for (var i = 0; i < this.size; i++) {
      var rocketCounttInMatingPool = this.rockets[i].fitness * 100;
      for (var j = 0; j < rocketCounttInMatingPool; j++) {
        matingpool.push(this.rockets[i]);
      }
    }

    // replacing old rockets with the new ones
    // the best rocket is the last one in the array due to
    // displaying on the screen

    var bestRockerPrevGen = new Rocket(this.lifespan);
    bestRockerPrevGen.dna.genes = bestRocket.dna.genes;
    this.rockets[this.size - 1] = bestRockerPrevGen;

    for (var i = 0; i < this.size - 1; i++) {
      var parentA = random(matingpool);
      var parentB = random(matingpool);
      var childRocket = parentA.crossover(parentB);
      childRocket.dna.mutate(0.03);
      this.rockets[i] = childRocket;
    }

    this.geneCount = 0;
    return results;
  }
}
