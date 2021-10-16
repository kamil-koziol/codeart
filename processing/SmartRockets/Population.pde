class Population {
  Rocket[] rockets;
  int size;
  int geneCount = 0;
  
  public Population(int size) {
    rockets = new Rocket[size];
    for(int i=0; i<size; i++) {
      rockets[i] = new Rocket();
    }
  }
  
  void update() {
    for(int i=0; i<size; i++) {
      if(rockets[i].crashed) continue;
      
      if(rockets[i].hitsTarget(target)) {
        rockets[i].crash();
      }
      
      if(rockets[i].hitsObstacles(obstacles)) {
        rockets[i].crash();
      }
      
      if(rockets[i].hitsEdge()) {
        rockets[i].crash();
      }
      
      geneCount++;
    }
  }
  
  void newGeneration() {
    // TODO:
  }
}
