
NodeManager nodeManager;
int scale = 80;
int size;

void setup() {
  size(800,800);
  size = width/scale;
  nodeManager = new NodeManager(size, scale);
  nodeManager.setStartNode(1,2);
  nodeManager.startingNode.fcost = 0;
  nodeManager.openNodes.add(nodeManager.startingNode);
  nodeManager.setEndNode(8,8);
}

void draw() {
  nodeManager.drawNodes();
}

void mouseDragged() {
  int mx = mouseX/scale;
  int my = mouseY/scale;
  nodeManager.nodes[my][mx] = new WallNode(new PVector(mx, my), nodeManager);
}

void keyPressed() {
  nodeManager.getLowestNode().expand();
}
