var angle = 137.5;
// var angle = ;
var c = 15;
var n = 0;

function setup() {
  createCanvas(800, 800);
  background(0);
}

function draw() {
  translate(width / 2, height / 2);
  var r = c * sqrt(n);
  var theta = n * angle;
  var x = r * cos(theta);
  var y = r * sin(theta);

  var colr = map(x, 0, width/2, 50,150);
  var colg = map(y,0, height,100, 150);
  fill(colr, 50, colg);
  ellipse(x, y, 10, 10);

  n+=1;
}
