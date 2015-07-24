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
    if(getPosX() <= size*0.5F){
      vel.setX(Math.abs(vel.getX()));
      setSpeed(speed + increment/10);
    }
    if(getPosX() >= width - size*0.5F){
      vel.setX(-Math.abs(vel.getX()));
      setSpeed(speed + increment/10);
    }
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
  
  public boolean ballBeyondPaddle() {
    if(getPosX() <= size*0.5F || getPosY() >= width - size*0.5F) return true;
    return false;
  }
  
  public boolean collidesWithPaddle() {
    //temp
    return false;
  }
  
  private void handlePaddleCollision() {
    double predX = getPosX() + vel.getX(), predY = getPosY() + vel.getY();
    if(positionOutOfBounds()) return; //ball is going to collide anyways
    
    double d = Math.sqrt(predX * predX + predY * predY);
    int times = (int)(d / 10D);
    double offsetX = predX / times, offsetY = predY / times;
    for(int i = 0; i < times; i++) {
      double x = getPosX() + offsetX * i, y = getPosY() + offsetY * i;
      if(collidesWithPaddle()) {
        //change direction
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
