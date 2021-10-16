Grid grid;
int size = 10;
int bombsAmount = 10;
int cellSize;

public void settings() {
  size(800, 800);
  grid = new Grid(size, bombsAmount);
  cellSize = width/size;
}

public void draw() {
  background(0);
  for (int y=0; y<size; y++) {
    for (int x=0; x<size; x++) {
      stroke(200);
      if (grid.cells[y][x].value == 0 && !grid.cells[y][x].hidden) {
        fill(11, 10);
      } else {
        fill(33);
      }
      rect(x*cellSize, y*cellSize, cellSize, cellSize);

      textSize(cellSize/2);
      if (!grid.cells[y][x].hidden) {
        color c = grid.cells[y][x].getColor();
        fill(c);
        textAlign(CENTER);
        text(String.valueOf(grid.cells[y][x].value), x*cellSize + cellSize/2, y*cellSize + cellSize/2 + cellSize/5);
      }
    }
  }
}

public void mouseClicked() {
  grid.handleClick(cellSize, mouseX, mouseY);
}
