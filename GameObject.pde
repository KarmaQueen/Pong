public abstract class GameObject {
  
  private Color c;
  
  //hitbox
  private float hboxX, hboxY;
  private double posX, posY, pPosX, pPosY;
  
  public GameObject(){
    c = new Color(255,255,255);
  }
  
  public void update() {
    pPosX = posX;
    pPosY = posY;
  }

  public void render(double framestep) {
    c.setFill();
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
  
  //Override these if needed
  public boolean constrictToScreen(){
    return false;
  }
  public GameObject setPos(double x, double y) {
    if(constrictToScreen()){
      x = Math.max(hboxX*0.5F, x);
      y = Math.max(hboxY*0.5F, y);
      x = Math.min(width -  hboxX*0.5F, x);
      y = Math.min(height - hboxY*0.5F, y);
    }
    posX = x;
    posY = y;
    return this;
  }
  
  //Setters
  public GameObject setColor(int red, int green, int blue){
    c.setColor(red,green,blue);
    return this;
  }
  
  public GameObject setHitbox(float x, float y){
    hboxX = x;
    hboxY = y;
    return this;
  }
  
  //Getters
  public double getPosX(){ return posX; }
  public double getPosY(){ return posY; } 
  
}
