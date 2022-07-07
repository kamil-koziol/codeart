public class Node {
  PVector pos;
  int fcost = 10000;
  int gcost = 10000;
  int cost;
  
  int size;
  int scale;
  color c;
  
  boolean terminal = false;
  boolean open = false;
  NodeManager nodeManager;
  Node ancestor;
  
  public Node(PVector position, NodeManager nodeManager) {
    this.size = nodeManager.size;
    this.scale = nodeManager.scale;
    this.pos = position;
    this.nodeManager = nodeManager;
    c = color(255,255,255);
  }
  
  public void draw() {
    fill(c);
    rect(pos.x*scale, pos.y*scale, scale, scale);
    fill(0);
    if(cost != 0) {
      textSize(24);
      text(fcost, pos.x*scale + 4, pos.y*scale + 24);
      text(gcost, pos.x*scale + scale - 32, pos.y*scale + 24);
      textSize(32);
      text(cost, pos.x*scale + scale/2 - 12, pos.y*scale + scale/2 + 20);
    }
  }
  
  public void expand() {
    boolean ended = false;
    for(int y=-1; y<=1; y++) {
      for(int x=-1; x<=1; x++) {
        if(x == 0 && y == 0) continue;
        if(pos.x+x < 0 || pos.x+x >= size || pos.y+y < 0 || pos.y+y >= size) continue;
        Node n = nodeManager.nodes[floor(pos.y)+y][floor(pos.x)+x];
        if(n.terminal) continue;
        if(n instanceof WallNode) continue;
        if(n instanceof EndNode) {
          colorBackwards(this);
          colorBackwards(n);
          ended = true;
          break;
        }
        
        int nfcost;
        if(x == 0 || y == 0) {
          // not diagonals
          nfcost = this.fcost + 10;
        } else {
          nfcost = this.fcost + 14;
        }
        
        if(nfcost < n.fcost) {
            n.fcost = nfcost;
            n.cost = n.fcost + n.gcost;
            n.ancestor = this;
         }
        
        if(!n.open) {
          n.calculateGCost();
          n.fcost = nfcost;
          n.cost = n.fcost + n.gcost;
          n.c = color(0,255,0);
          print(nodeManager.openNodes.size());
          nodeManager.openNodes.add(n);
          n.open = true;
        }
      }
    }
    
    if(!ended) {
      this.c = color(255,0,0);
    }
    
    this.terminal = true;
    nodeManager.openNodes.remove(this);
    this.open = false;
  }
  
  void colorBackwards(Node n) {
    Node tmp = n;
    while(tmp != null) {
      tmp.c = color(0,100,255);
      tmp = tmp.ancestor;
    }
  }
  
  public void calculateGCost() {
    gcost = floor(dist(pos.x, pos.y, nodeManager.endNode.pos.x, 
    nodeManager.endNode.pos.y)*10);
  }
}
