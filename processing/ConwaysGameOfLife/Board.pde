public class Board {
  public Cell[][] board;
  
  int rows, cols;
  
  Board(int rows, int cols) {
    board = new Cell[rows][cols];
    this.rows = rows;
    this.cols = cols;
    
    for (int y=0; y<rows; y++) {
      for (int x=0; x<cols; x++) {
        board[y][x] = new Cell(x,y, false);
      }
    }
    
  }
  
  int getPopulatedNeighborsAmount(Cell cell) {
    int populatedCells = 0;
    for(int y=-1; y<=1; y++) {
      for(int x=-1; x<=1; x++) {
        if(x == 0 && y == 0) continue;
        if(cell.y + y < 0 || cell.y + y >= rows || cell.x + x < 0 || cell.x + x >= cols) continue;
        if(board[cell.y + y][cell.x + x].populated) {
          populatedCells++;
        }
      }
    }
    return populatedCells;
  }
  
  void shuffle() {
    for (int y=0; y<rows; y++) {
      for (int x=0; x<cols; x++) {
        boolean populated = random(1) > 0.5;
        board[y][x] = new Cell(x,y, populated);
      }
    }
  }
  
  void display() {
    int cellSize = height/rows;
    stroke(0, 90);
    for (int y=0; y<rows; y++) {
      for (int x=0; x<cols; x++) {
        if(board[y][x].populated) {
          fill(91, 25, 207);
        } else {
          fill(200, 197, 197);
        }
        rect(x*cellSize, y*cellSize, cellSize, cellSize);
      }
    }
  }
  
  void update() {
    
    Cell[][] newBoard = new Cell[rows][cols];
    
    for (int y=0; y<rows; y++) {
      for (int x=0; x<cols; x++) {
        Cell cell = board[y][x];
        int populatedNeighbors = getPopulatedNeighborsAmount(cell);
        
        if(cell.populated) {
          if(populatedNeighbors <= 1 | populatedNeighbors >= 4) {
            newBoard[y][x] = new Cell(cell.x, cell.y, false);
            continue;
          }
        } else {
          if(populatedNeighbors == 3) {
            newBoard[y][x] = new Cell(cell.x, cell.y, true);
            continue;
          }
        }
        
        newBoard[y][x] = cell;
      }
    }
    
    this.board = newBoard;
  }
  
}
