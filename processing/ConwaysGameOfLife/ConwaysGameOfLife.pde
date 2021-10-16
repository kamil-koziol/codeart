int cellSize = 20;

int rows;
int cols;
Board board;
boolean paused = false;

void setup() {
  size(512, 512);
  rows = height/cellSize;
  cols = width/cellSize;
  board = new Board(rows,cols);
}
void draw() {
  board.display();
  if(!paused) {
    board.update();
  }
}

void mousePressed() {
  int x = mouseX/cellSize;
  int y = mouseY/cellSize;
  
  board.board[y][x].setPopulated(!board.board[y][x].populated);
}

void keyPressed() {
  if(keyCode == ENTER) {
    paused = !paused;
  }
  if(keyCode == ' ') {
    saveFrame("thumbnail.jpg");
  }
}
