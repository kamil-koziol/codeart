class NodeManager {
  public Node[][] nodes;
  public Node startingNode;
  public Node endNode;
  public ArrayList<Node> openNodes;
  
  int size;
  int scale;
  
  public NodeManager(int size, int scale) {
    this.size = size;
    this.scale = width/size;
    openNodes = new ArrayList<Node>();
    initNodes();
  }
  

  void initNodes() {
    nodes = new Node[size][size];
  
    for(int y=0;y<size;y++) {
      for(int x=0;x<size;x++) {
        nodes[y][x] = new Node(new PVector(x,y), this);
      }
    }
  }
  
  void setStartNode(int x, int y) {
    nodes[y][x] = new StartingNode(new PVector(x,y), this);
    startingNode = nodes[y][x];
  }
  
  void setEndNode(int x, int y) {
    nodes[y][x] = new EndNode(new PVector(x,y), this);
    endNode = nodes[y][x];
  }
  
  void setWallNode(int x, int y) {
    nodes[y][x] = new WallNode(new PVector(x,y), this);
  }
  
  void drawNodes() {
    for(int y=0;y<size;y++) {
    for(int x=0;x<size;x++) {
      nodes[y][x].draw();
    }
  }
  }
  
  Node getLowestNode() {
    Node minNode = openNodes.get(0);
    for(Node n: openNodes) {
     if(n.cost < minNode.cost) {
       minNode = n;
     }
     else if(n.cost == minNode.cost) {
       if(n.gcost < minNode.gcost) {
         minNode = n;
       }
     }
    }
    return minNode;
  }
  
  void findFullPath() {
    while(openNodes.size() > 0) {
      boolean ended = getLowestNode().expand();
      if(ended) break;
    }
  }
}
