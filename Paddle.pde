public class Paddle extends GameObject{
  
  private float speed;
  private float paddleWidth, paddleHeight;
  private boolean leftPlayer;
  
  public Paddle(){
    paddleWidth = 10;
    paddleHeight = Pong.options.get(3).getValue();
    setHitbox(10,60);
    
    speed = Pong.options.get(0).getValue();
  }
  
  public void update(){
    super.update();
    
    //Updates the paddle's position by reading the input into the game.
    if(leftPlayer){
      if(Pong.keys[0]) setPos(getPos().getX(), getPos().getY() - speed);
      if(Pong.keys[1]) setPos(getPos().getX(), getPos().getY() + speed);
      if(Pong.keys[2]) setPos(getPos().getX() - speed, getPos().getY());
      if(Pong.keys[3]) setPos(getPos().getX() + speed, getPos().getY());
    } else {
      if(Pong.keys[4]) setPos(getPos().getX(), getPos().getY() - speed);
      if(Pong.keys[5]) setPos(getPos().getX(), getPos().getY() + speed);
      if(Pong.keys[6]) setPos(getPos().getX() - speed, getPos().getY());
      if(Pong.keys[7]) setPos(getPos().getX() + speed, getPos().getY());
    }
  }

  public void render(double framestep){
    super.render(framestep);
    Vector vec = getPartialPos(framestep);
    rect((float)vec.getX(), (float)vec.getY(), paddleWidth, paddleHeight);
  }
  
  /** 
   * Sets whether this paddle is controlled by the left player or the right.
   * Parameters: boolean b: if controlled by the left player, insert true. if not, false.
   */
  public Paddle setLeftPlayer(boolean b){
    leftPlayer = b;
    return this;
  }
  
  //Setters
  public Paddle setSize(float w, float h) {
    paddleWidth = w;
    paddleHeight = h;
    return setHitbox(w,h);
  }
  
  //Getters
  public boolean getLeftPlayer() {
    return leftPlayer;
  }
  
  public float getWidth() {
    return paddleWidth;
  }
  
  public float getHeight() {
    return paddleHeight;
  }
}
