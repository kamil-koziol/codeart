var img;
var sizer = 120;

function preload() {
  img = loadImage("kamil.jpg");
}

function setup() {
  createCanvas(img.width, img.height);
  background(0);
  img.loadPixels();
}

function draw() {
  for (var i = 0; i < 100; i++) {
    var randomX = parseInt(random(img.width));
    var randomY = parseInt(random(img.height));
    let index = (randomX + randomY * img.width) * 4;
    let r = img.pixels[index];
    let g = img.pixels[index + 1];
    let b = img.pixels[index + 2];
    let a = img.pixels[index + 3];

    noStroke();
    fill(r, g, b, a);
    circle(randomX, randomY, sizer);
    sizer -= 0.01;
    if (sizer <= -120) {
      sizer = 120;
    }
  }
}
