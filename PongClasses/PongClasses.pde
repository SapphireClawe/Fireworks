private Ball[] balls = new Ball[Ball.getBallCount()]; //only variable to start is how many Pong Balls will be in play

void setup() {
  size(500, 600); //May need to change these variables
  StartStop.screenSizeChecker();
  Ball.gameStart(); 
  LeftPaddle.gameStart();
  RightPaddle.gameStart();
}

void draw() {

  //Code to change "Start" Boolean Variable to true & to Quit the game
  StartStop.buttons();

  if ( StartStop.getStart() == true ) {
    background(#90C3D4); 
    fill(0); 
    ellipse (ballX, ballY, ballDiameter, ballDiameter);
    rect();
    rect();
    
    //playGame(); //Also contains "ball squish" procedure, with change in frameRate
    //score(); //contains highlihgts for positive user feedback

  }
}
