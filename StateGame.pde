/*
 * The state in which the actual game takes place in.
 */
class StateGame extends State {
  
  private ArrayList<GameObject> objectList = new ArrayList<GameObject>(); //list of all the game objects; paddles, balls, etc
  private ArrayList<Paddle> paddleList = new ArrayList<Paddle>(); //list of all the paddles
  private ArrayList<Ball> ballList = new ArrayList<Ball>(); //list of all the balls
  
  //could be used to load settings before starting the game, etc
  public StateGame() {
  }
  
  public void init(Pong pong) {
    super.init(pong);
//    Ball ball = new Ball();
//    ball.setPos(100, 100);
//    addBall(ball);
//    Paddle paddle = new Paddle();
//    paddle.setPos(600, 300);
//    addPaddle(paddle);
  }
  
  public void deinit() {
  }
  
  public void update() {
    for(GameObject obj : objectList) obj.update();
  }
  
  public void render(double framestep) {
    //draws a line, dividing the middle of the screen
    stroke(255);
    line(width * 0.5, 0, width * 0.5, height);
    
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
}
