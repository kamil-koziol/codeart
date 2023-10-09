
NodeManager nodeManager;
int scale = 80;
int size;

void setup() {
  size(800,800);
  size = width/scale;
}

void draw() {
  nodeManager = new NodeManager(size, scale);
  nodeManager.setStartNode(1,2);
  nodeManager.startingNode.fcost = 0;
  nodeManager.openNodes.add(nodeManager.startingNode);
  int mX = mouseX/scale;
  int mY = mouseY/scale;
  nodeManager.setEndNode(mX,mY);
  nodeManager.findFullPath();
  nodeManager.drawNodes();
}

void mouseDragged() {
  print("ADJSAKDJSA");
  int mx = mouseX/scale;
  int my = mouseY/scale;
  nodeManager.nodes[my][mx] = new WallNode(new PVector(mx, my), nodeManager);
}
