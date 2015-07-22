public class Paddle extends GameObject{
  
  private float width, height;
  private boolean rightSide;
  
  public Paddle() {
    this(false);
  }
  
  public Paddle(boolean side){
    width = 20;
    height = 20;
    rightSide = side;
  }
  
  //Sets the side to be right if true and left if false
  public Paddle setSide(boolean flag) {
    rightSide = flag;
    return this;
  }
  
  public Paddle setSize(float w, float h) {
    width = w;
    height = h;
    return this;
  }
  
  public void update(){
    super.update();
    int dx = 0, dy = 0;
    if(rightSide) {
      dx -= keys[6] ? 1 : 0;
      dx += keys[7] ? 1 : 0;
      dy -= keys[4] ? 1 : 0;
      dy += keys[5] ? 1 : 0;
    } else {
      dx -= keys[2] ? 1 : 0;
      dx += keys[3] ? 1 : 0;
      dy -= keys[0] ? 1 : 0;
      dy += keys[1] ? 1 : 0;
    }
    setPos(posX + dx, posY + dy);
  }

  public void render(double framestep){
    super.render(framestep);
    double[] pos = getPartialPos(framestep);
    rect((float)pos[0], (float)pos[1], width, height);
  }
}
