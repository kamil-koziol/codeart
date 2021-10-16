public class Cell {
  int x;
  int y;
  boolean populated;
  
  Cell(int x, int y, boolean populated) {
    this.x = x;
    this.y = y;
    this.populated = populated;
  }
  
  void setPopulated(boolean newPopulated) {
    this.populated = newPopulated;
  }
}
