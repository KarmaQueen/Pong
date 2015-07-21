public abstract class GameObject {
  
  private double x, y, dx, dy;

  public abstract void update();

  public abstract void render(double framestep);

  public abstract void handleInputs();  
  
}
