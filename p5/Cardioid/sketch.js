var totalPoints = 150;
var r;
var factor=1;


function setup() {
  createCanvas(640, 640);
  r = width/2.5;
}

function getVector(index) {
  var angle = map(index, 0, totalPoints, 0, TWO_PI);
  var v = p5.Vector.fromAngle(angle);
  v.mult(r);
  return v;
}

function draw() {
  stroke(255);
  factor += 0.005;
  background(0);
  translate(width / 2, height / 2);

  // RYSOWANIE POTRZEBNYCH PUNKTÓW
  // var deltaAngle = TWO_PI / totalPoints;
  // for (var i = 0; i < totalPoints; i++) {
  //   var angle = map(i, 0, totalPoints, 0, TWO_PI);
  //   v = getVector(i);
  //   fill(255);
  //   ellipse(v.x, v.y, 16, 16);
  // }

  for (var i = 0; i < totalPoints; i++) {
    var pointA = getVector(i);
    var pointB = getVector((i*factor)%totalPoints);

    line(pointA.x, pointA.y, pointB.x, pointB.y);
  }
}
