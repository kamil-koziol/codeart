var x = 0;
var y = 0;

function setup() {
  createCanvas(800, 800);
  background(0);
}

function nextPoint() {
  let nextX;
  let nextY;

  let r = random(1);

  if (r < 0.01) {
    //f1
    nextX = 0;
    nextY = 0.16 * y;
  } else if (r < 0.86) {
    //f2
    nextX = 0.85 * x + 0.04 * y;
    nextY = -0.04 * x + 0.85 * y + 1.60;
  } else if (r < 0.93) {
    //f3
    nextX = 0.20 * x + -0.26 * y;
    nextY = 0.23 * x + 0.22 * y + 1.60;
  } else {
    //f4
    nextX = -0.15 * x + 0.28 * y;
    nextY = 0.26 * x + 0.24 * y + 0.44;
  }

  x = nextX;
  y = nextY;
}

var gradient;

//range −2.1820 < x < 2.6558 and 0 ≤ y < 9.9983.
function showPoint() {
  sx = map(x, -2.1820, 2.6558, 0, width);
  sy = map(y, 0, 9.9983, height, 0);

  var r = map(sx, 0, width, 0,255);
  var g = map(sy, 0, height, 255,0);
  stroke(r,g,100);
  strokeWeight(1);
  point(sx, sy);
}

function draw() {
  for (var i = 0; i < 1000; i++) {
    nextPoint();
    showPoint();
  }
}
