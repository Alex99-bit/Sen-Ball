class Ball {
  float x, y, r, speed;
  color c;

  Ball(float x, float y, float r, float speed) {
    this.x = x;
    this.y = y;
    this.r = r;
    this.speed = speed;
    c = color(random(255), random(255), random(255));
  }

  void update() {
    x = x + 10;
    y = height/2 + sin(radians(x + frameCount * speed)) * height/4;
  }

  void display() {
    fill(c);
    //strokeWeight(2);
    ellipse(x, y, r, r);
  }

  void changeColor() {
    c = color(random(255), random(255), random(255));
  }
}

Ball ball;

void setup() {
  size(1400, 800);
  ball = new Ball(-30, height/2, 30, -0.5);
  //background(255);
  smooth();
}

void draw() {
  //background(255);
  stroke(0);
  noFill();

  // dibujar la línea de la función seno
  beginShape();
  for (float x = 0; x <= width + 10; x += 10) {
    float y = height/2 + sin(radians(x + frameCount * ball.speed)) * height/4;
    vertex(x, y);
  }
  endShape();

  // actualizar y dibujar la pelota
  ball.update();
  ball.display();

  // reiniciar el movimiento de la pelota y cambiar su color cuando llega al final de la ventana
  if (ball.x > width + ball.r) {
    ball.x = -ball.r;
    ball.changeColor();
  }

  // dejar una estela por donde pasa la pelota
  fill(255, 20);
  rect(0, 0, width, height);
}
