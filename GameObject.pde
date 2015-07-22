public abstract class GameObject {
  
  //hitbox
  private float hboxX, hboxY;
  private Vector pos, pPos;
  private Color c;
  
  public GameObject(){
    pos = new Vector();
    pPos = new Vector();
    c = new Color(255,255,255);
  }
  
  public void update() {
    pPos.setVec(pos);
  }

  public void render(double framestep) {
    c.setFill();
  }
  
  //Get the partial position of the game object's current position usually for rendering
  protected Vector getPartialPos(double framestep) {
    return getPartialPos(pos, pPos, framestep);
  }
  
  protected Vector getPartialPos(Vector vec, Vector pVec, double framestep) {
    return getPartialPos(vec.getX(), vec.getY(), pVec.getX(), pVec.getY(), framestep);
  }

  protected Vector getPartialPos(double x, double y, double px, double py, double framestep) {
    double dx = x - px, dy = y - py;
    return new Vector(px + dx * framestep, py + dy * framestep);
  }
  
  //Override these if needed
  public boolean constrictToScreen(){
    return false;
  }
  public <T extends GameObject> T setPos(double x, double y) {
    if(constrictToScreen()){
      x = Math.max(hboxX*0.5F, x);
      y = Math.max(hboxY*0.5F, y);
      x = Math.min(width -  hboxX*0.5F, x);
      y = Math.min(height - hboxY*0.5F, y);
    }
    pos.setVec(x, y);
    return (T)this;
  }
  
  //Setters
  public <T extends GameObject> T setColor(int red, int green, int blue){
    c.setColor(red,green,blue);
    return (T)this;
  }
  
  public <T extends GameObject> T setHitbox(float x, float y){
    hboxX = x;
    hboxY = y;
    return (T)this;
  }
  
  
  //Getters
  public Vector getPos() { return pos; }
}
