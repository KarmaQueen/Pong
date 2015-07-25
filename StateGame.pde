/*
 * The state in which the actual game takes place in.
 */
public class StateGame extends State {

  private int scoreLeft, scoreRight;

  private ArrayList<GameObject> objectList = new ArrayList<GameObject>(); //list of all the game objects; paddles, balls, etc
  private ArrayList<Paddle> paddleList = new ArrayList<Paddle>(); //list of all the paddles
  private ArrayList<Ball> ballList = new ArrayList<Ball>(); //list of all the balls
  private ArrayList<Button> buttonList = new ArrayList<Button>(); //list of all the buttons
  private float enterTime, pEnterTime, dET;
  private boolean running;
  private boolean flagRunning;

  //could be used to load settings before starting the game, etc
  public StateGame() {
  }

  public void init(Pong pong) {

    enterTime = pEnterTime = dET = 0;

    super.init(pong);
    Ball ball = new Ball(Pong.options.get(4).getValue());
    ball.setPos(width*0.5, height*0.5).setPPos(width*0.5, height*0.5);
    addBall(ball);

    Paddle paddleLeft = new Paddle().setLeftPlayer(true).setPos(10, height*0.5);
    addPaddle(paddleLeft);

    Paddle paddleRight = new Paddle().setLeftPlayer(false).setPos(width-10, height*0.5);
    addPaddle(paddleRight);

    scoreLeft = scoreRight = 0;
    running = flagRunning = false;
    
    buttonList.add(new Button("Start", 50, width * 0.5F, height - 60)); //ID: 0
    buttonList.add(new Button("Menu", 30, width * 0.5F + 250, height - 50));
  }

  public void deinit() {
  }

  public void doUpdate() {
    if(keys[8]){
      if(flagRunning){
        running = !running;
        flagRunning = false;
      }
    } else flagRunning = true;
    
    //Runs when game is running AND not running
    for (Paddle paddle : paddleList)
        paddle.update();
        
    //Runs when game is running
    if(running){
      for(Ball b : ballList){
        b.update();
        if(b.ballBeyondPaddle()){
          if(b.getPosX() < width*0.5F) scoreRight++;
          else scoreLeft++;
          
          buttonList.get(0).setText("Player " + (b.getPosX() < width*0.5F? 1 : 2) + " wins");
          
          //resets ball
          b.resetBall();
          running = false;
        } else {
          buttonList.get(0).setText("Resume");
        }
      }
      
    } else { //runs when game isn't running
      Button b;
      for(int i = 0; i < buttonList.size(); i++){
        b = buttonList.get(i);
        b.update();
        if(b.isClicked()) buttonAction(i);
      }
    }
  }

  public void doRender(double framestep) {
    background(0);
    
    //Draws pause text and other menu items
    if(!running){
      for(Button b : buttonList){
        b.render(framestep);
      }
    
    }

    //Draws a line, dividing the middle of the screen
    stroke(255);
    strokeWeight(3);
    line(Pong.halfwidth, 0, Pong.halfwidth, height);
    noStroke();

    //Draws the score on the top of the screen
    textFont(font, 25);
    text(scoreLeft,  Pong.halfwidth - textWidth("" + scoreLeft) *0.5 - 10, 30);
    text(scoreRight, Pong.halfwidth + textWidth("" + scoreRight)*0.5 + 13, 30);

    //Draws the input visualizer on the bottom of the screen.
    if (keys[0]) rect(Pong.halfwidth - 10, height - 11F, 5, 5);
    if (keys[1]) rect(Pong.halfwidth - 10, height - 6F, 5, 5);
    if (keys[2]) rect(Pong.halfwidth - 15, height - 6F, 5, 5);
    if (keys[3]) rect(Pong.halfwidth -  5, height - 6F, 5, 5);
    if (keys[4]) rect(Pong.halfwidth + 11, height - 11F, 5, 5);
    if (keys[5]) rect(Pong.halfwidth + 11, height - 6F, 5, 5);
    if (keys[6]) rect(Pong.halfwidth +  6, height - 6F, 5, 5);
    if (keys[7]) rect(Pong.halfwidth + 16, height - 6F, 5, 5);

    //renders the gameObjects in the objectList.
    for (GameObject obj : objectList) obj.render(framestep);
  }

  //IMPLEMENT
  public void doEnteringUpdate() {
    pEnterTime = enterTime;
    enterTime += 10;

    if (enterTime >= height) {
      entering = false;
      for (Paddle paddle : paddleList) {
        paddle.setConstrictToScreen(true);
      }
    }
  }
  
  public void doExitingUpdate() {
    
    pEnterTime = enterTime;
    enterTime -= 10;
    
    for(Paddle p : paddleList){
      p.setPos(p.getPosX(), p.getPosY() + enterTime);
      p.update();
    }
    
    if (enterTime <= 0) {
      exiting = false;
      game.setState(nextState);
    }
   
  }

  public void doEnteringRender(double framestep) {
    background(0);
    stroke(255);
    strokeWeight(3);
    float y = (float)(enterTime + dET*framestep);
    line(Pong.halfwidth, 0, Pong.halfwidth, y);
    noStroke();
    textFont(Pong.font, 25);
    text(scoreLeft, Pong.halfwidth - textWidth("" + scoreLeft) *0.5 - 10, 30*y/height);
    text(scoreRight, Pong.halfwidth + textWidth("" + scoreRight)*0.5 + 13, 30*y/height);
    ellipse(halfwidth, height - 0.5*y, Pong.options.get(4).getValue(), Pong.options.get(4).getValue());
    rect(10, height - y*0.5F, 10, 60);
    rect(width - 10, height - y*0.5F, 10, 60);
  }
  public void doExitingRender(double framestep) {
    background(0);
    stroke(255);
    strokeWeight(3);
    float y = (float)(enterTime + dET*framestep);
    line(Pong.halfwidth, 0, Pong.halfwidth, y);
    noStroke();
    textFont(Pong.font, 25);
    text(scoreLeft, Pong.halfwidth - textWidth("" + scoreLeft) *0.5 - 10, 30*y/height);
    text(scoreRight, Pong.halfwidth + textWidth("" + scoreRight)*0.5 + 13, 30*y/height);
    ellipse(halfwidth, height - 0.5*y, Pong.options.get(4).getValue(), Pong.options.get(4).getValue());
    for(Paddle p : paddleList){
      p.render(framestep);
    }
  }

  public void buttonAction(int id){
    switch(id){
    case 0:
      running = true; //continue running
      break;
    case 1:
      exiting = true;
      nextState = new StateMenu();
      for(Paddle p : paddleList)
        p.setConstrictToScreen(false);
      
      break;
    default: break;  
    }
  }



  public Ball addBall(Ball ball) {
    objectList.add(ball);
    ballList.add(ball);
    return ball;
  }

  public Paddle addPaddle(Paddle paddle) {
    objectList.add(paddle);
    paddleList.add(paddle);
    return paddle;
  }
  
  public ArrayList<Ball> getBallList() {
    return ballList;
  }
  
  public ArrayList<Paddle> getPaddleList() {
    return paddleList;
  }

  //Setters
  public int incrementScoreLeft() { 
    return ++scoreLeft;
  }
  public int incrementScoreRight() { 
    return ++scoreRight;
  }

  public void setScoreLeft(int n) { 
    scoreLeft  = n;
  }
  public void setScoreRight(int n) { 
    scoreRight = n;
  }
  
  public boolean getPaused() {
    return !running;
  }
}

