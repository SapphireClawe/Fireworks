Ball[] balls = new Ball[2]; //only variable to start is how many Pong Balls will be in play

 int ballCount = 0;
 int Score1=0, Score2=0;
 Boolean endGame = false; 
 int fireworkX, fireworkY;
void setup() {
  size(500, 600); //May need to change these variables
  balls[0] = new Ball(width, height);
  balls[0].gameStart();
  ballCount = 1;
}

void draw() {
 background(#C95DF0); //Purple
  if (ballCount >= balls.length) {
    endGame = true;
  }

  if (balls[ballCount-1].ballXGoalOnce == true) {
    println("inside firework");
    Firework[] fireworks = new Firework[1]; 
    fireworkX = balls[ballCount-1].ballX; 
    println("Y Value in Ball Class:", balls[ballCount-1].ballY); 
    for (int i=0; i<fireworks.length; i++) {
      fireworks[i] = new Firework( fireworkX, fireworkY );
      println("inside firework creation");
    }

    while (fireworks[0].y < height  ) { 
      println("inside firework while");
      println("Y Value in Firework Class:", fireworks[0].y); //Verify with above balls[ballCount-1].ballY
      //frameRate(1); //Doesn't work, see previous comment
      for (int i=0; i<fireworks.length; i++) {
        println("inside firework step");
        fireworks[i].fireWorkStep();
      }
      for (int i=0; i<fireworks.length; i++) {
        println("inside firework draw");
        fireworks[i].fireWorkDraw();
      }
      
    }
    balls[ballCount-1].ballXGoalOnce = false;
  }

  for (int i=0; i<ballCount; i++) { 
    if (balls[i].createNextBall == true) {
      ballCount++;
      int j=i+1;
      balls[j] = new Ball(width, height);
      balls[j].gameStart();
    }
    balls[i].createNextBall = false;
  }

  for (int i=0; i<ballCount; i++) {
    balls[i].gamePlay();
    balls[i].ballDraw();
  }



  if (endGame == true) {
    println("\n\nGame is over"); 
    for (int i=0; i<balls.length; i++) {
      Score1 += balls[i].scorePlayer1;
      Score2 += balls[i].scorePlayer2;
    }
    println("Player 1:", Score1, "\tPlayer 2:", Score2); 
    exit();
  }

}


//Code that need to be moved and copied elsewhere
void playGame () {

  



  //Code to Move Paddles, keyboard and mouseX&Y key variables
  //Player 1 Movement
  if (keyPressed == true & key == CODED) { //alternate is void keyPressed(){}, always contains the most recent keyboard key stroke
    if (keyCode == UP) { //KeyCode is used for UP, DOWN, LEFT, and RIGHT; and ALT, CONTROL, and SHIFT
      if (player[1] >= 5) { //Easier to use && instead of nesting IF Statements
        player[1] -= 5; //Review incrementation other than -1
      }
      if (player[1] < 0) { //Catch any subtraction equalling less than zero
        player[1] = 0;
      }
    }

    if (keyCode == DOWN) {
      if (player[1] + paddle[1] <= height) {
        player[1] += 5; //Review incrementation other than +1
      }
      if (player[1] + paddle[1] > height) {
        player[1] = height - paddle[1] - 1; //Cannot add "player[1] + paddle[1]" in an assignment; thus, algebra needed
        //Note: the "-1" shows the black border of the paddle at the bottom, which looks more aesthetic
        //Note: the height is actaully -1 pixel because of the border
      }
    }
  } //End of keyPressed

  //Player 2 Movement
  if (mouseY >=0 || mouseY - paddle[1] < height) {
    player[3] = mouseY;
  }
  if (mouseY >= height - paddle[1]) {
    player[3] = height - paddle[1] - 1;
  }
  
  // Old Debugging Code
  //println (mouseY);

  //Draws the ball
  
  ellipse();

  //Drawing Paddles
  fill(#FF00FF); //Purple
  rect(player[0], player[1], paddle[0], paddle[1]);
  rect(player[2], player[3], paddle[0], paddle[1]);
  fill(0); //Reseting to Black
}
