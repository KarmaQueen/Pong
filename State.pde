public abstract class State {
  
  protected Pong game;
  protected boolean entering, exiting;
  protected State nextState;
  
  public void init(Pong pong) {
    game = pong;
    entering = true;
    exiting = false;
  }
  
  public abstract void deinit();
  
  public void update(){
    if(entering){
      doEnteringUpdate();
    }
    else if(exiting){
      doExitingUpdate();
    } else
      doUpdate();    
  }
  
  
  public abstract void doUpdate();
  public abstract void doEnteringUpdate();
  public abstract void doExitingUpdate();
  
  public void render(double framestep){
    if(entering){
      doEnteringRender(framestep);
    }
    else if(exiting){
      doExitingRender(framestep);
    } else
      doRender(framestep);  
  }
  
  public abstract void doRender(double framestep);
  
  public abstract void doEnteringRender(double framestep);
  public abstract void doExitingRender(double framestep);
}
