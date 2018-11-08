Firework[] fireworks = new Firework[25];

void setup () {
  size(500, 600);
  for (int i=0; i < fireworks.length; i++) {
    fireworks[i] = new Firework(width, height);
  }
}


void draw () {
  background(255);
  for (int i=0; i < fireworks.length; i++) {
    fireworks[i].step();
    fireworks[i].draw(); 
  }
}

void mouseClicked() {
  for (int i=0; i < fireworks.length; i++) {
    fireworks[i] = new Firework (width, height);
  }
}
