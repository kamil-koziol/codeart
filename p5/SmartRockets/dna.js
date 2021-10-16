class DNA {
  constructor(lifespan) {
    this.genes = [];

    for (var i = 0; i < lifespan; i++) {
      this.genes[i] = p5.Vector.random2D();
      this.genes[i].setMag(0.2);
    }
  }

  mutate(mutationChance) {
    for (var i = 0; i < this.genes.length; i++) {
      var r = random(1);
      if (r < mutationChance) {
        this.genes[i] = p5.Vector.random2D();
        this.genes[i].setMag(0.2);
      }
    }
  }
}
