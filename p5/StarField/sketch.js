var stars = [];

function setup() {
  createCanvas(800, 800);
  for (let i = 0; i < 300; i++) {
    stars.push(new Star());
  }
}

function draw() {
  background(0);
  translate(width/2, height/2);
    for(let star of stars) {
      star.show();
      star.update();
  }
}