class StateOptions extends State {
  
  private ArrayList<Button> buttons = new ArrayList<Button>();
  
  public void init(Pong pong) {
    super.init(pong);
    buttons.add((Button)new Button("Back").setSize(25).setOriginalSize(25).setEnlargedSize(30).setPos(width - 80, height - 40)); //ID: 1
  }
  
  public void deinit(){
    
  }
  
  public void update(){
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
      game.setState(new StateMenu()); //Back to Menu
      break;
    default: break;  
    }
  }
  
  public void render(double framestep){
    background(0);
    for(Button b : buttons) b.render(framestep);
  } 
}
