public abstract class Piece {
  
  PImage img;
  
  public int column;
  public int row;
  
  public PieceType type;
  
  
  public Piece(int column, int row) {
    this.column = column;
    this.row = row;
  }

  public abstract void draw();
  public abstract boolean isValidMove();
}

class King extends Piece {
  
  public int column;
  public int row;
  
  
  public King(int column, int row) {
    super(column, row);
    type = PieceType.KING;
    img = loadImage("pieces/white/king.png");
  }
  
  public void move(int column, int row) {
    this.column = column;
    this.row = row;
  };
  
  public void draw() {
    image(img, 15 + column * width/8, 15 + row * height/8, width/8 - 30, height/8 - 30); 
  };
  
  public boolean isValidMove() { return true; };
}
