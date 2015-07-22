public class Ball extends GameObject{
  
  private float speedX, speedY;
  private float size;
  
  public Ball(float size){
    this();
    this.size = size;
    setHitbox(size, size);
  }
  
  public Ball(){
    speedX = speedY = 4;
    size = 12;
    setHitbox(size, size);
  }
  
  public void update(){
    super.update();
    
    if(getPosX() <= size*0.5F) speedX = Math.abs(speedX);
    if(getPosX() >= width - size*0.5F) speedX = -Math.abs(speedX);
    if(getPosY() <= size*0.5F) speedY = Math.abs(speedY);
    if(getPosY() >= height - size*0.5F) speedY = -Math.abs(speedY);
    
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
