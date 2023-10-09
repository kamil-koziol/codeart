public class Grid {
  Cell[][] cells;
  int size;
  int cellSize;

  public Grid(int size, int bombsAmount, int cellSize) {
    this.size = size;
    this.cellSize = cellSize;
    cells = new Cell[size][size];
    putBombs(bombsAmount);
    calculateCells();
  }
  
  public void draw() {
    for (int y=0; y<size; y++) {
    for (int x=0; x<size; x++) {
      Cell cell = this.cells[y][x];
      
      stroke(200);
      if (cell.value == 0 && !cell.hidden) {
        fill(11, 10);
      } else {
        fill(33);
      }
      rect(x*cellSize, y*cellSize, cellSize, cellSize);
    
      textSize(cellSize/2);
      
      if(cell.hidden || cell.value == 0) {
        continue;
      }
       
        color c = this.cells[y][x].getColor();
        fill(c);
        textAlign(CENTER);
        text(String.valueOf(this.cells[y][x].value), x*cellSize + cellSize/2, y*cellSize + cellSize/2 + cellSize/5);
    }
  }
  }

  public void putBombs(int amount) {
    if (amount > size*size) {
      return;
    }

    ArrayList<PVector> availablePositions = new ArrayList<>();
    for (int y=0; y<size; y++) {
      for (int x=0; x<size; x++) {
        availablePositions.add(new PVector(x, y));
      }
    }
    while (amount > 0) {
      int randomPosition = int(random(availablePositions.size()));
      PVector randomPoint = availablePositions.remove(randomPosition);
      cells[int(randomPoint.y)][int(randomPoint.x)] = new Bomb();
      amount--;
    }
  }

  public void calculateCells() {
    for (int y=0; y<size; y++) {
      for (int x=0; x<size; x++) {
        if (!(cells[y][x] instanceof Bomb)) {
          cells[y][x] = new Cell(calculateCell(x, y));
        }
      }
    }
  }

  public int calculateCell(int x, int y) {
    int sum = 0;

    Cell[][] neighbors = getCellNeighbors(x, y);
    for (int i=0; i<3; i++) {
      for (int j=0; j<3; j++) {
        if (neighbors[i][j] instanceof Bomb) {
          sum++;
        }
      }
    }

    return sum;
  }

  public Cell[][] getCellNeighbors(int x, int y) {
    Cell[][] neighbors = new Cell[3][3];
    for (int i=0; i<3; i++) {
      for (int j=0; j<3; j++) {
        if (i == 1 && j == 1) {
          continue;
        }

        if (isInBounds(x + j - 1, y + i - 1)) {
          neighbors[i][j] = cells[y + i - 1][x + j - 1];
        }
      }
    }
    return neighbors;
  }

  public void randomize(int bombsAmount) {
    putBombs(bombsAmount);
    calculateCells();
  }

  public void handleClick(int mX, int mY) {
    int cx = mX / cellSize;
    int cy = mY / cellSize;

    if (cells[cy][cx] instanceof Bomb) {
      for (int y=0; y<size; y++) {
        for (int x=0; x<size; x++) {
          cells[y][x].enable();
        }
      }
    } else {
      if (cells[cy][cx].value == 0) {
        chainZeroCells(cx, cy);
      } else {
        cells[cy][cx].enable();
      }
    }
  }

  public void chainZeroCells(int x, int y) {
    if (cells[y][x].value != 0) {
      return;
    }

    cells[y][x].enable();

    Cell[][] neighbors = getCellNeighbors(x, y);
    for (int i=0; i<3; i++) {
      for (int j=0; j<3; j++) {
        
        if(!isInBounds(x + j - 1, y + i - 1)) { continue; }
        
        Cell neighbour = neighbors[i][j];

        if (i == 1 && j == 1) {
          continue;
        }

        if (neighbour == null) {
          continue;
        }

        if (neighbour.value == 0 && neighbour.hidden) {
            chainZeroCells(x + j - 1, y + i - 1);
        } else {
            neighbour.enable();
        }
      }
    }
  }

  public boolean isInBounds(int x, int y) {
    return x >= 0 && x < size && y >= 0 && y < size;
  }
}
