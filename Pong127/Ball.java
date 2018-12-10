class Ball {

 int ballX;
 int ballY;
 Boolean ballXGoal;
 Boolean ballXGoalOnce;
 Boolean createNextBall;
 final int ballStartX;
 final int ballStartY;
 final int ballDiameter;
 int ballMoveX;
 int ballMoveY;
 int directionX;
 int directionY;
 int ballSpeedX;
 int ballSpeedY;

 int score1 = 0;
 int score2 = 0;

 //int ballCount=5; //Only variable that needs to be coded first

  //Constructor
  Ball (float width, float height) {
    ballStartX = int(width/2);
    ballStartY = int(height/2);
    this.ballX = ballStartX;
    this.ballY = ballStartY;
    this.ballXGoal = false;
    this.ballXGoalOnce = false;
    this.createNextBall = false;
    ballDiameter = int(width/70); //Must pick one dimension for both ellipse diameters, for a circle
    this.ballSpeedX = int (random (1, 5));
    this.ballSpeedY = int (random (1, 5));
    this.c = color(int(random(50, 200)), int(random(50, 200)), int(random(50, 200)));
  } //End of Constructor

  void ballDraw() {
    fill(c);
    ellipse(ballX, ballY, ballDiameter, ballDiameter);
  } 

  
  //Game Start
  void gameStart () {


    //This sets the random for the ball, commented out as an intentional mistake
    //Change this to be a ball speed
    directionX = int (random (-2, 2));
    while (directionX == 0) {
      directionX = int (random (-2, 2));
    }
    directionY = int (random (-2, 2));
    while (directionY == 0) {
      directionY = int (random (-2, 2));
    }
  } //End gameStart

  void gamePlay() {
 if (ballX < 0+(ballDiameter/4) || ballX > width-(ballDiameter/4)) { //Error: -(ballDiameter/2)
      if (ballX < 0+(ballDiameter/4)) {
        score1 = score1 + 1;
        ballX = 0+(ballDiameter/4);
        ballXGoal = true;
        ballXGoalOnce = true;
        createNextBall = true;
        ballY = ballY; 
      }
    }
    if (ballX > width-(ballDiameter/4)) {
      score2++;
      ballX = width-(ballDiameter/4);
      ballXGoal = true;
      ballXGoalOnce = true; 
      createNextBall = true;
      ballY = ballY;
    }


    if ( (ballY > 0 && ballY <= 0+(ballDiameter) ) || ( ballY < height && ballY >= height-(ballDiameter) )   ) { //ballY bounce area wider than below
      directionY = directionY * (-1);
    }
    if (ballY < 0+(ballDiameter/2) ) { 
      ballY = 0+(ballDiameter/2);
    }
    if (ballY > height-(ballDiameter/2) ) { 
      ballY = height-(ballDiameter/2);
    }

    //Ball "Step"
    if (ballXGoal == true) {
    } else {
      ballMoveX = ballSpeedX*directionX;
      ballMoveY = ballSpeedY*directionY;
      ballX += ballMoveX;
      ballY += ballMoveY;
    }
}
}
