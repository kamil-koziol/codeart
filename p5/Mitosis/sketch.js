
var cells = [];

function setup() {
  createCanvas(800, 600);
  cells.push(new Cell(width/2, height/2, 30));
}

function draw() {
  background(0);
  for(var i=cells.length-1; i>=0; i--) {
    cells[i].show();
    cells[i].update();
  }
}

class Cell {
  constructor(x, y, r) {
    this.x = x;
    this.y = y;
    this.r = r;
    this.splitSize = random(50,80);
  }

  show() {
    fill(50, 255, 0);
    stroke(255);
    strokeWeight(4);
    ellipse(this.x, this.y, this.r *2, this.r * 2);
  }

  update() {
    this.r += 0.1;

    this.x += random(-1,1);
    this.y += random(-1,1);

    if(this.canSplit()) {
      this.split();
    }
  }

  canSplit() {
    return this.r >= this.splitSize;
  }

  split() {
    cells.push(new Cell(this.x + random(-this.r, this.r), this.y + random(-this.r,this.r), this.r/2));
    cells.push(new Cell(this.x + random(-this.r, this.r), this.y + random(-this.r,this.r), this.r/2));

    var cell_index = cells.indexOf(this);
    cells.splice(cell_index, 1);
  }
}
