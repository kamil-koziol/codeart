Board board;

void setup() {
  size(1024,1024);
  background(255);
  board = new Board();
}

void draw() {
  
  board.draw();
  
  
}

void mousePressed() {
  board.mousePressed();
}
