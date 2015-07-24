class StateOptions extends State {
  
  private ArrayList<Button> buttons = new ArrayList<Button>();
  private ArrayList<Button> incrementDecrement = new ArrayList<Button>();
  private boolean flag;
  
  private float enterTime = 100;
  
  DecimalFormat df = new DecimalFormat("#.#");
  
  public void init(Pong pong) {
    super.init(pong);
    buttons.add(new Button("Back", 25,width - 80, height + 30)); //ID: 1
    
    for(int i = 0; i < Pong.options.size(); i++){
      //sets the position of the Option text
      float ht = 70 + i*50;
      Pong.options.get(i).setPos(250 - enterTime*2, ht);
      buttons.add(new Button("<",                                       40, width - 220 + enterTime, ht));
      buttons.add(new Button(df.format(Pong.options.get(i).getValue()), 40, width - 140 + enterTime, ht));
      buttons.add(new Button(">",                                       40, width - 60  + enterTime, ht));
    }
  }
  
  public void deinit(){
    
  }
  
  public void doUpdate(){
    //THIS PART IS WEIRD
    Button b;
    if(mousePressed){
      if(flag){
        for(int i = 0; i < buttons.size(); i++){
          b = buttons.get(i);
          if(b.isHovered()){
            buttonAction(i);
          }
        }
        flag = false;
      }
    } else flag = true;
    //END OF WEIRD PART
    
    for(int i = 0; i < buttons.size(); i++){
      b = buttons.get(i);
      b.update();
      if(b.isClicked()) buttonAction(i);
    }
    for(Option o : Pong.options){
      o.update();
    }
  }
  
  /**
   *  Every time a button is clicked, this function runs, executing corresponding to the ID of the button given.
   *  Parameters: int id: the parameter
   */
  public void buttonAction(int id){
    if(!flag) return;
    switch(id){
    case 0:
      exiting = true;
      nextState = new StateMenu(); //Back to Menu
      break;
    case 1: case 4:case 7: case 10: case 13: case 16: case 19: case 22:  
      changeOptionVal(Pong.options.get((id - 1)/3), keys[9]?-1F:-0.1F);
      buttons.get(id + 1).setText(df.format(Pong.options.get((id - 1)/3).getValue()));
      break;
    case 3: case 6:case 9: case 12: case 15: case 18: case 21: case 24:  
      changeOptionVal(Pong.options.get((id - 1)/3), keys[9]?1F:0.1F);
      buttons.get(id - 1).setText(df.format(Pong.options.get((id - 1)/3).getValue()));
      break;
    default: break;  
    }
  }
  
  private void changeOptionVal(Option o, float change){
    o.setValue(o.getValue() + change);
  }
  
  //IMPLEMENT
  public void doEnteringUpdate(){
    Button b = buttons.get(0);
    b.setPos(b.getPosX(), b.getPosY() - 4);
    if(b.getPosY() <= height - 40) entering = false;
    
    for(int i = 1; i < buttons.size(); i++){
      b = buttons.get(i);
      b.setPos(b.getPosX() - 6, b.getPosY());
    }
    for(Option o : Pong.options){
      o.setPos(o.getPosX() + 12, o.getPosY());
    }
  }
  
  public void doExitingUpdate(){
    Button b = buttons.get(0);
    b.setPos(b.getPosX(), b.getPosY() + 4);
    
    if(b.getPosY() >= height + 30) game.setState(nextState);
    
    for(int i = 1; i < buttons.size(); i++){
      b = buttons.get(i);
      b.setPos(b.getPosX() + 6, b.getPosY());
    }
    for(Option o : Pong.options){
      o.setPos(o.getPosX() - 12, o.getPosY());
    }
    
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
    
    for(Option o : Pong.options) o.render(framestep);
  } 
}
