Grid grid;
int size = 10;
int bombsAmount = 10;

public void settings() {
  size(800, 800);
  grid = new Grid(size, bombsAmount, width/size);
}

public void draw() {
  background(0);
  grid.draw();
}

public void mousePressed() {
  grid.handleClick(mouseX, mouseY);
}
