/*
 * The state in which the actual game takes place in.
 */
public class StateGame extends State {
  
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
    GameObject paddleLeft = new Paddle().setLeftPlayer(true).setPos(10, height*0.5F);
    addPaddle((Paddle)paddleLeft);
    GameObject paddleRight = new Paddle().setLeftPlayer(false).setPos(width-10, height*0.5F);
    addPaddle((Paddle)paddleRight);
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
    line(width * 0.5, 0, width * 0.5, height);
    noStroke();
  
    //Draws the input visualizer on the bottom of the screen.
    if(keys[0]) rect(width * 0.5F - 10, height - 11F, 5, 5);
    if(keys[1]) rect(width * 0.5F - 10, height - 6F,  5, 5);
    if(keys[2]) rect(width * 0.5F - 15, height - 6F,  5, 5);
    if(keys[3]) rect(width * 0.5F -  5, height - 6F,  5, 5);
    if(keys[4]) rect(width * 0.5F + 10, height - 11F, 5, 5);
    if(keys[5]) rect(width * 0.5F + 10, height - 6F,  5, 5);
    if(keys[6]) rect(width * 0.5F +  5, height - 6F,  5, 5);
    if(keys[7]) rect(width * 0.5F + 15, height - 6F,  5, 5);
    
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
