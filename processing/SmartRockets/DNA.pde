class DNA {
  PVector[] genes;
  
  public DNA() {
    genes = new PVector[genesCount];
  }
  
  void mutateGene(int geneIndex) {
    genes[geneIndex] = PVector.random2D();
    genes[geneIndex].setMag(0.2);
  }
  
  void createGenes() {
    for(int i=0; i<lifespan; i++) {
      mutateGene(i);
    }
  }
  
  void mutate(float mutationChance) {
    for(int i=0; i<genes.length; i++) {
      float r = random(1);
      if(r < mutationChance) {
        mutateGene(i);
      }
    }
  }
}
