public abstract class GameObject {
  
  protected double posX, posY, pPosX, pPosY;
  private Color c;
  
  public GameObject(){
    c = new Color(255,255,255);
  }
  
  public GameObject setColor(int red, int green, int blue){
    c.setColor(red,green,blue);
    return this;
  }

  public void update() {
    pPosX = posX;
    pPosY = posY;
  }

  public void render(double framestep) {
    c.setFill();
  }

  public <T extends GameObject> T setPos(double x, double y) {
    posX = x;
    posY = y;
    return (T)this;
  }
  
  //Get the partial position of the game object's current position
  protected double[] getPartialPos(double framestep) {
    return getPartialPos(posX, posY, pPosX, pPosY, framestep);
  }

  protected double[] getPartialPos(double x, double y, double px, double py, double framestep) {
    double[] pos = new double[2];
    double dx = x - px, dy = y - py;
    pos[0] = px + dx * framestep;
    pos[1] = py + dy * framestep;
    return pos;
  }
  
  //Getters
  public double getPosX(){ return posX; }
  public double getPosY(){ return posY; } 
  
}
