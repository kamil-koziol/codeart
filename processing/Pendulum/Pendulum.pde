Pendulum2D pendulum;
Pendulum2D pendulum2;

void setup() {
  size(600,600);
  pendulum = new Pendulum2D(250, 0.4);
  pendulum2 = new Pendulum2D(250, 0.4);
}

void draw() {
  background(0);
  pendulum.update();
  pendulum.draw();
}

void keyPressed() {
  if(keyCode == ' ') {
    saveFrame("thumbnail.jpg");
  }
}
