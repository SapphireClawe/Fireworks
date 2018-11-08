class Firework {
  float x;
  float y;
  color c;
  float diameter;
  float xSpeed;
  float ySpeed;
  float gravity;


  Firework  (float width, float height) {
    this.x = mouseX;
    println(x);
    this.y = mouseY;
    println(y);
    this.c = color( int(random(255)), int(random(255)), int(random(255)));
    println(c);
    this.diameter = random(width*1/25);
    println(diameter);
    this.xSpeed = random(-5, 5);
    this.ySpeed = random(-5, 5);
    gravity = 0.5;
  }
}

void draw() {
  fill(c);
  ellipse(x, y, diameter, diameter);
}

void step() {
  x += xSpeed;
  y += ySpeed;
  ySpeed += gravity;
}
