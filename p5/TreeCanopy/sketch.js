var angle;
var slider;

function setup() {
  createCanvas(800, 600);
  slider = createSlider(0, 180, 60, 1);
  angleMode(DEGREES);
}

function draw() {
  angle = slider.value();
  background(0);
  translate(width / 2, height);
  tree(150,8);
}

function tree(size, n) {
  strokeWeight(2);
  stroke(255);
  line(0, 0, 0, -size);
  
  push();
  translate(0, -size);
  rotate(angle);
  if (n >= 0) {
    tree(size * 0.67, n - 1)
  }
  pop();

  push();
  translate(0, -size)
  rotate(-angle); 
  if (n >= 0) {
    tree(size * 0.67, n - 1)
  }
  pop();
}