public static final double MS_PER_UPDATE = 6;

double previous = System.currentTimeMillis();
double lag = 0.0;

ArrayList<GameObject> objectList = new ArrayList<GameObject>();
ArrayList<Paddle> paddleList = new ArrayList<Paddle>();
ArrayList<Ball> ballList = new ArrayList<Ball>();

public void setup(){
  size(800, 450);
  smooth();
  
  Ball ball = new Ball();
  ball.setPos(100, 100);
  addBall(ball);
  Paddle paddle = new Paddle();
  paddle.setPos(400, 300);
  addPaddle(paddle);
}

public void draw(){
  double current = System.currentTimeMillis();
  double elapsed = current - previous;
  previous = current;
  lag += elapsed;

  processInput();

  while (lag >= MS_PER_UPDATE)
  {
    update();
    lag -= MS_PER_UPDATE;
  }

  render(lag/MS_PER_UPDATE);
} 

public void render(double framestep){
  background(0);
  for(GameObject obj : objectList) obj.render(framestep);
}

public void processInput(){
  
}

public void update(){
  for(GameObject obj : objectList) obj.update();
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
