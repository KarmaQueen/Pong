public class Paddle extends GameObject{
  
  private float speed = 4;
  private float paddleWidth, paddleHeight;
  private boolean leftPlayer;
  
  public Paddle(){
    paddleWidth = 10;
    paddleHeight = 60;
    setHitbox(10,60);
  }
  
  public void update(){
    super.update();
    
    //Updates the paddle's position by reading the input into the game.
    if(leftPlayer){
      if(Pong.keys[0]) setPos(getPosX(), getPosY() - speed);
      if(Pong.keys[1]) setPos(getPosX(), getPosY() + speed);
      if(Pong.keys[2]) setPos(getPosX() - speed, getPosY());
      if(Pong.keys[3]) setPos(getPosX() + speed, getPosY());
    } else {
      if(Pong.keys[4]) setPos(getPosX(), getPosY() - speed);
      if(Pong.keys[5]) setPos(getPosX(), getPosY() + speed);
      if(Pong.keys[6]) setPos(getPosX() - speed, getPosY());
      if(Pong.keys[7]) setPos(getPosX() + speed, getPosY());
    }
  }

  public void render(double framestep){
    super.render(framestep);
    double[] pos = getPartialPos(framestep);
    rect((float)pos[0], (float)pos[1], paddleWidth, paddleHeight);
  }
  
  /** 
   * Sets whether this paddle is controlled by the left player or the right.
   * Parameters: boolean b: if controlled by the left player, insert true. if not, false.
   */
  public Paddle setLeftPlayer(boolean b){
    leftPlayer = b;
    return this;
  }
  
  public boolean constrictToScreen(){
    return true;
  }
  
  //Setters
  public Paddle setSize(float w, float h) {
    paddleWidth = w;
    paddleHeight = h;
    return (Paddle)setHitbox(w,h);
  }
}
