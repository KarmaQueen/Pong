public class Ball extends GameObject{
  
  private Vector vel;
  private float speed, increment;
  private float size;
  
  public Ball(float size){
    this();
    this.size = size;
    setHitbox(size, size);
  }
  
  public Ball(){
    speed = Pong.options.get(1).getValue();
    increment = Pong.options.get(2).getValue();
    vel = new Vector(3*(Math.random() - 0.5D), Math.random() - 0.5D).normalise(speed);
    size = 12;
    setHitbox(size, size);
  }
  
  public void resetBall(){
    setPos(width*0.5F, height*0.5F);
    speed = Pong.options.get(1).getValue();
    increment = Pong.options.get(2).getValue();
    vel = new Vector(3*(Math.random() - 0.5D), Math.random() - 0.5D).normalise(speed);
  }
  
  private void handleWallCollision() {
    if(getPosY() <= size*0.5F){
      vel.setY(Math.abs(vel.getY()));
      setSpeed(speed + increment/10);
    }
    if(getPosY() >= height - size*0.5F){
      vel.setY(-Math.abs(vel.getY()));
      setSpeed(speed + increment/10);
    }
  }
  
  public boolean positionOutOfBounds(double x, double y) {
    if(x <= size*0.5F || x >= width - size*0.5F) return true;
    if(y <= size*0.5F || y >= height - size*0.5F) return true;
    return false;
  }
  
  //Check if the ball went beyond the paddle. (Someone missed the ball and lost)
  public boolean ballBeyondPaddle() {
    if(getPosX() <= 0 || getPosX() >= width) return true;
    return false;
  }
  
  public boolean collidesWithPaddle(Paddle paddle, double x, double y) {
    double dx = Math.abs(x - paddle.getPosX()), dy = Math.abs(y - paddle.getPosY());
    return dx <= (size + paddle.getWidth()) * 0.5F || dy <= (size + paddle.getHeight()) * 0.5F;
  }
  
  private void handlePaddleCollision() {
//    double predX = getPosX() + vel.getX(), predY = getPosY() + vel.getY();
//    if(positionOutOfBounds(predX, predY)) return; //ball is going to collide anyways
//    
//    double d = vel.getLength();
//    int times = Math.max(1, (int)(d / 5D));
//    double offsetX = vel.getX() / times, offsetY = vel.getY() / times;
//    System.out.println(offsetX + "\t\t" + offsetY);
//    boolean collided = false;
//    
//    for(int i = 0; i <= times && !collided; i++) { //use <= to check both ends of the spectrum
//      double x = getPosX() + offsetX * i, y = getPosY() + offsetY * i;
//      StateGame game = (StateGame)getCurrentState();
//      
//      for(Paddle paddle : game.getPaddleList()) {
//        if(collidesWithPaddle(paddle, x, y)) {
//          if(getPosX() <= width*0.5F) vel.setVec(Math.abs(vel.getX()), vel.getY());
//          else vel.setVec(-Math.abs(vel.getX()), vel.getY());
//          collided = true;
//          break;
//        }
//      }
//    }
    
    for(Paddle paddle : ((StateGame)getCurrentState()).getPaddleList()) {
      if(collidesWithPaddle(paddle, getPosX(), getPosY())) {
        if(getPosX() <= width*0.5F) vel.setVec(Math.abs(vel.getX()), vel.getY());
        else vel.setVec(-Math.abs(vel.getX()), vel.getY());
        break;
      }
    }
  }
  
  public void update(){
    super.update();
    
    handleWallCollision();
    handlePaddleCollision();
    
    setPos(getPosX() + vel.getX(), getPosY() + vel.getY());
  }

  public void render(double framestep){
    super.render(framestep);
    Vector vec = getPartialPos(framestep);
    ellipse((float)vec.getX(), (float)vec.getY(), size, size);
  }
  
  public Ball setSpeed(float f){
    speed = f;
    vel = vel.normalise(f);
    return this;
  }
  
  public float getSpeed(){
    return speed;
  }
  
  public float getSize(){
    return size;
  }
}
