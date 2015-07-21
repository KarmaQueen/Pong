abstract class State {
  
  private Pong game;
  
  public void init(Pong pong) {
    game = pong;
  }
  
  public abstract void deinit();
  
  public abstract void update();
  
  public abstract void render(double framestep);
}
