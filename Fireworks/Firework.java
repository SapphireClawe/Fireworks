class Firework () {
  float x;
  float y;
  color c;
  float diameter;
  float xSpeed;
  float ySpeed;
  float gravity;


  Firework (float x, float y, diameter, float xSpeed, float ySpeed, float gravity) {
    this.x = x;
    this.y = y;
    this.c = color( int(random(255)), int(random(255)), int(random(255)));
    this.diameter = random(diameter*1/50);
    this.xSpeed = xSpeed;
    this.ySpeed = ySpeed;
    this.gravity = gravity;
  }
}
