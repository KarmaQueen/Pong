/*
 * The state in which the actual game takes place in.
 */
public class StateGame extends State {
  
  private int scoreLeft, scoreRight;
  
  private ArrayList<GameObject> objectList = new ArrayList<GameObject>(); //list of all the game objects; paddles, balls, etc
  private ArrayList<Paddle> paddleList = new ArrayList<Paddle>(); //list of all the paddles
  private ArrayList<Ball> ballList = new ArrayList<Ball>(); //list of all the balls
  
  //could be used to load settings before starting the game, etc
  public StateGame() {
  }
  
  public void init(Pong pong) {
    super.init(pong);
    //Ball ball = new Ball();
    //ball.setPos(100, 100);
    //addBall(ball);

    GameObject paddleLeft = new Paddle().setLeftPlayer(true).setPos(10, height*0.5F);
    addPaddle((Paddle)paddleLeft);
    
    GameObject paddleRight = new Paddle().setLeftPlayer(false).setPos(width-10, height*0.5F);
    addPaddle((Paddle)paddleRight);
    
    scoreLeft = scoreRight = 0;
  }
  
  public void deinit() {
  }
  
  public void update() {
    for(GameObject obj : objectList) obj.update();
    
  }
  
  public void render(double framestep) {
    background(0);
    
    //draws a line, dividing the middle of the screen
    stroke(255);
    strokeWeight(3);
    line(Pong.halfwidth, 0, Pong.halfwidth, height);
    noStroke();
    
    //Draws the score on the top of the screen
    text(scoreLeft, Pong.halfwidth - textWidth("" + scoreRight) - 10, 10);
    text(scoreRight, Pong.halfwidth + 14, 10);
    
    //Draws the input visualizer on the bottom of the screen.
    if(keys[0]) rect(Pong.halfwidth - 10, height - 11F, 5, 5);
    if(keys[1]) rect(Pong.halfwidth - 10, height - 6F,  5, 5);
    if(keys[2]) rect(Pong.halfwidth - 15, height - 6F,  5, 5);
    if(keys[3]) rect(Pong.halfwidth -  5, height - 6F,  5, 5);
    if(keys[4]) rect(Pong.halfwidth + 11, height - 11F, 5, 5);
    if(keys[5]) rect(Pong.halfwidth + 11, height - 6F,  5, 5);
    if(keys[6]) rect(Pong.halfwidth +  6, height - 6F,  5, 5);
    if(keys[7]) rect(Pong.halfwidth + 16, height - 6F,  5, 5);
    
    //renders the gameObjects in the objectList.
    for(GameObject obj : objectList) obj.render(framestep);
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
  
  //Setters
  public int incrementScoreLeft() { return ++scoreLeft; }
  public int incrementScoreRight(){ return ++scoreRight;}
  
  public void setScoreLeft(int n) { scoreLeft  = n; }
  public void setScoreRight(int n){ scoreRight = n; }
}
