public class Ball extends GameObject{
  
  private float speedX, speedY;
  private float size;
  
  public Ball(float size){
    this();
    this.size = size;
  }
  
  public Ball(){
    speedX = speedY = 4;
  }
  
  public void update(){
    super.update();
    setPos(getPosX() + speedX, getPosY() + speedY);
  }

  public void render(double framestep){
    super.render(framestep);
    Vector vec = getPartialPos(framestep);
    ellipse((float)vec.getX(), (float)vec.getY(), size, size);
  }
  
  public float getSize(){
    return size;
  }
}
