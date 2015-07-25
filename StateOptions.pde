class StateOptions extends State {
  
  private ArrayList<Button> buttons = new ArrayList<Button>();
  private boolean flag;
  
  private float enterTime = 100, timer = 50;
  
  private float optionChange = 0.1F;
  private float optionChangeFast = 0.02F;
  
  DecimalFormat df = new DecimalFormat("#.#");
  
  public void init(Pong pong) {
    super.init(pong);
    buttons.add(new Button("Back", 25, width - 80, height + 30)); //ID: 1
    
    for(int i = 0; i < Pong.options.size(); i++){
      //sets the position of the Option text
      float ht = 70 + i*50;
      Pong.options.get(i).setPos(250 - enterTime*2, ht);
      buttons.add(new Button("<",                                       40, width - 220 + enterTime, ht));
      buttons.add(new Button(df.format(Pong.options.get(i).getValue()), 40, width - 140 + enterTime, ht));
      buttons.add(new Button(">",                                       40, width - 60  + enterTime, ht));
    }
    
    buttons.add(new Button("Reset", 25, width - 160 , height + 30)); //ID: 19
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
    float change = optionChange;
    if(!flag) {
      timer--;
      if(timer > 1)
        return;
      change = optionChangeFast;
    } else {
      timer = 50;
    }
    switch(id){
    case 0:
      exiting = true;
      nextState = new StateMenu(); //Back to Menu
      break;
    case 1: case 4:case 7: case 10: case 13: case 16:
      changeOptionVal(Pong.options.get((id - 1)/3), keys[9]?-10*change:-change);
      buttons.get(id + 1).setText(df.format(Pong.options.get((id - 1)/3).getValue()));
      break;
    case 3: case 6:case 9: case 12: case 15: case 18:
      changeOptionVal(Pong.options.get((id - 1)/3), keys[9]?10*change:change);
      buttons.get(id - 1).setText(df.format(Pong.options.get((id - 1)/3).getValue()));
      break;
    case 19:
      options.get(0).setValue(options.get(0).getDefaultVal());
      options.get(1).setValue(options.get(1).getDefaultVal());
      options.get(2).setValue(options.get(2).getDefaultVal());
      options.get(3).setValue(options.get(3).getDefaultVal());
      options.get(4).setValue(options.get(4).getDefaultVal());
      options.get(5).setValue(options.get(5).getDefaultVal());
      int index = 0;
      for(int i = 2; i < 19; i += 3){
        buttons.get(i).setText(df.format(Pong.options.get(index).getValue()));
        index++;
      }
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
    b = buttons.get(19);
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
    b = buttons.get(19);
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
