class StateOptions extends State {
  
  private ArrayList<Button> buttons = new ArrayList<Button>();
  
  public void init(Pong pong) {
    super.init(pong);
    buttons.add((Button)new Button("Back").setSize(25).setOriginalSize(25).setEnlargedSize(30).setPos(width - 80, height + 30)); //ID: 1
  }
  
  public void deinit(){
    
  }
  
  public void doUpdate(){
    Button b;
    for(int i = 0; i < buttons.size(); i++){
      b = buttons.get(i);
      b.update();
      if(b.isClicked()) buttonAction(i);
    }
  }
  
  /**
   *  Every time a button is clicked, this function runs, executing corresponding to the ID of the button given.
   *  Parameters: int id: the parameter
   */
  public void buttonAction(int id){
    switch(id){
    case 0:
      exiting = true;
      nextState = new StateMenu(); //Back to Menu
      break;
    default: break;  
    }
  }
  
  //IMPLEMENT
  public void doEnteringUpdate(){
    Button b = buttons.get(0);
    b.setPos(b.getPosX(), b.getPosY() - 4);
    if(b.getPosY() <= height - 40) entering = false;
  }
  
  public void doExitingUpdate(){
    Button b = buttons.get(0);
    b.setPos(b.getPosX(), b.getPosY() + 4);
    if(b.getPosY() >= height + 30) game.setState(nextState);
  }
  
  public void doEnteringRender(double framestep){
    doRender(framestep);
  }
  public void doExitingRender(double framestep){
    doRender(framestep);
  }
  
  public void doRender(double framestep){
    background(0);
    for(Button b : buttons) b.render(framestep);
  } 
}
