var skala = 50;
var grid = []
var columns;
var rows;
var mines = 5;

function drawGrid() {
  stroke(255);
  strokeWeight(1);
  fill(0);
  for (var y = 0; y < rows; y++) {
    for (var x = 0; x < columns; x++) {
      rect(x * skala, y * skala, skala, skala);
    }
  }
}

function spreadMines(mines) {
  for (var i = 0; i < mines; i++) {
    var randomPoint = floor(random(columns * rows))
    grid[randomPoint] = -1
  }
}

function getPoint(x, y) {
  return grid[y * rows + x]
}

function setPoint(x, y, val) {
  grid[y * rows + x] = val;
}

function calcPoint(x, y) {
  var points = 0;
  for (var i = -1; i <= 1; i++) {
    for (var j = -1; j <= 1; j++) {
      if (!(i == 0 && j == 0)) {
        if (getPoint(x + i, y + j) == -1) {
          points++;
        }
      }
    }
  }
  return points;
}


function revealPoint(y, x) {
  textSize(skala - 30);
  fill(255);
  text(getPoint(y, x), x * skala, y * skala + skala)
  for (var i = -1; i <= 1; i++) {
    for (var j = -1; j <= 1; j++) {
      if (!(i == 0 && j == 0)) {
        if (getPoint(y, x) == 0) {
          revealPoint(y, x);
        }
      }
    }
  }
}



function showGrid() {
  textSize(skala - 30);
  fill(255);
  for (var y = 0; y < rows; y++) {
    for (var x = 0; x < columns; x++) {
      revealPoint(x, y);
      // text(getPoint(y, x), x * skala, y * skala + skala)
    }
  }
}



function setup() {
  createCanvas(500, 500);
  background(0);
  columns = width / skala;
  rows = height / skala;
  drawGrid(columns, rows);

  var numOfPoints = columns * rows;
  for (var i = 0; i < numOfPoints; i++) {
    grid.push(0);
  }

  spreadMines(10);

  for (var y = 0; y < rows; y++) {
    for (var x = 0; x < columns; x++) {
      if (getPoint(x, y) != -1) {
        setPoint(x, y, calcPoint(x, y));
      }
    }
  }

}

function draw() {

}

function mousePressed() {
  column = floor(mouseX / skala);
  row = floor(mouseY / skala);
  revealPoint(row, column)
}