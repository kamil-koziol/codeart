var population;
var target;
var obstacles = [];

var startButton;
var resetButton;

var start = false;

var generations = 0;
var bestFitness = 0;

var generationalRockets = [];

var startingPos;

function setup() {
  createCanvas(800, 600);
  target = new Target(width / 2, 50);

  startButton = createButton("START");
  startButton.mousePressed(() => {
    start = !start;
    population = new Population(300, target, obstacles);
  });

  startingPos = createVector(-1, -1);
}

function draw() {
  background(0);
  if (start) {
    population.update();

    if (population.geneCount > population.lifespan) {
      var genRes = population.newGeneration();
      generations++;
      bestFitness = genRes["bestFitness"];
      generationalRockets.push(genRes["bestRocket"]);
      console.log(generationalRockets);
    }
  }

  obstacles.forEach((obstacle) => {
    obstacle.show();
  });

  target.show();

  textSize(16);
  fill(255);
  text("GEN: " + generations + "\nFITNESS: " + bestFitness, 50, 50);
}

function mousePressed() {
  if (start) {
    return;
  }
  console.log(mouseX, mouseY, obstacles, startingPos);
  if (startingPos.x == -1) {
    startingPos.x = mouseX;
    startingPos.y = mouseY;
  } else {
    obstacles.push(
      new Obstacle(
        startingPos.x,
        startingPos.y,
        Math.abs(mouseX - startingPos.x),
        Math.abs(mouseY - startingPos.y)
      )
    );

    startingPos.x = -1;
  }
}
