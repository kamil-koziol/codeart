public class Cell {
  int value;
  boolean hidden = true;

  public Cell() {
    this.value = 0;
  }
  public Cell(int value) {
    this.value = value;
  }

  public void enable() {
    if (hidden) {
      hidden = false;
    }
  }

  public color getColor() {
    switch (value) {
    case 0:
      {
        return color(255, 255, 255);
      }
    case 1:
      {
        return color(0, 255, 0);
      }
    case 2:
      {
        return color(0, 0, 255);
      }
    case 3:
      {
        return color(255, 255, 224);
      }
    case 4:
      {
        return color(255, 165, 0);
      }
    case 5:
      {
        return color(255, 0, 255);
      }
    case 6:
      {
        return color(255, 192, 203);
      }
    case 7:
      {
        return color(255, 0, 0);
      }
    case 8:
      {
        return color(0, 0, 0);
      }

    default:
      {
        return color(255, 255, 255);
      }
    }
  }
}
