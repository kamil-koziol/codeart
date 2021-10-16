var r;
var nSlider;
var dSlider;

function setup() {
  createCanvas(800, 600);
  nSlider = createSlider(1, 10, 4, 1);
  dSlider = createSlider(1, 10, 4, 1);
}

function draw() {
  translate(width/2, height/2);
  background(0);
  stroke(255);
  noFill();
  beginShape();
  var n = nSlider.value();
  var d = dSlider.value();
  var k = n/d;

  for(var i=0; i<TWO_PI * d; i+=0.01) {
    r = 250* cos(k*i);
    var sx = sin(i) * r;
    var sy = cos(i) * r;

    vertex(sx,sy)
  }

  endShape();
}
