public class Ball extends GameObject{
  
  float speedX, speedY;
  
  public Ball(){
    speedX = speedY = 4;
  }
  
  public void update(){
    super.update();
  }

  public void render(double framestep){
    super.render(framestep);
    Vector vec = getPartialPos(framestep);
    ellipse((float)vec.getX(), (float)vec.getY(), 20, 20);
  }
}
