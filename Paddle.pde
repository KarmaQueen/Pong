public class Paddle extends GameObject{
  
  private float width, height;
  
  public Paddle(){
    width = 20;
    height = 20;
  }
  
  public void setSize(float w, float h) {
    width = w;
    height = h;
  }
  
  public void update(){
    super.update();
  }

  public void render(double framestep){
    fill(255);
    double[] pos = getPartialPos(framestep);
    rect((float)pos[0], (float)pos[1], width, height);
  }

  public void handleInputs(){
  
  }  
}
