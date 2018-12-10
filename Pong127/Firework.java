class Firework {
  float x;
  float y;
  color c;
  float diameter;
  float xSpeed;
  float ySpeed;
  float gravity;
  
   Firework (float newX, float newY) {
    
    this.x = newX; 
    if (newX < width*1/4) {
      this.xSpeed = random(1, 5); 
    } else {
      this.xSpeed = random(-1, -5); 
    }
    this.y = newY; 
    this.c = color( int(random(255)), int(random(255)), int(random(255)) );
    this.diameter = random(width*1/25);
    this.ySpeed = random(-5, 5);
    gravity = 0.5;
  } 

 
  void fireWorkDraw() {
    fill(c);
    ellipse(x, y, diameter, diameter);
  }

  void fireWorkStep() {
   
    x += xSpeed;
    y += ySpeed;
  
    
    ySpeed += gravity;
  }

  
}
