var xoff = 0;
var start = 0;
var inc = 0.01;

function setup() {
  createCanvas(800, 800);
  background(0)
}

function draw() {
  background(15)
  stroke(255);
  noFill()

  beginShape()
  xoff = start
  for(var x = 0 ; x<width ; x++)
  {
    var y = map(noise(xoff), 0, 1, 0, height);
    vertex(x, y);
    xoff += inc
  }
  start += inc
  endShape()
}
