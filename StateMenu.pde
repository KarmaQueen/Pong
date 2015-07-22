public class StateMenu extends State{
  
  private ArrayList<Button> buttons = new ArrayList<Button>();
  private Button clickedButton;

  
  public void init(Pong pong){
    super.init(pong);
    clickedButton = null;
    buttons.add((Button)new Button("Play").setSize(50).setOriginalSize(50).setEnlargedSize(60).setPos(width*0.5F, height + 50)); //ID: 0
    buttons.add((Button)new Button("Options").setSize(25).setOriginalSize(25).setEnlargedSize(30).setPos(width - 220, height + 60)); //ID: 1
    buttons.add((Button)new Button("Quit").setSize(25).setOriginalSize(25).setEnlargedSize(30).setPos(width - 80, height + 60));
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
      nextState = new StateGame(); //Start game
      break;
    case 1: 
      exiting = true;
      nextState = new StateOptions(); //Open Menu
      break;
    case 2:
      exiting = true;
      System.exit(0); //exits game
      break;
    default: break;  
    }
  }
  
  //IMPLEMENT
  public void doEnteringUpdate(){
    for(Button b : buttons)
      b.setPos(b.getPosX(), b.getPosY() - 4);
    if(buttons.get(0).getPosY() <= height - 50) entering = false;
  }
  
  public void doExitingUpdate(){
    for(Button b : buttons)
      b.setPos(b.getPosX(), b.getPosY() + 4);
    if(buttons.get(0).getPosY() > height + 30) game.setState(nextState);
  }
  
  public void doEnteringRender(double framestep){
    doRender(framestep);
  }
  public void doExitingRender(double framestep){
    doRender(framestep);
  }
  
  public void doRender(double framestep){
    background(0);
    
    for(GameObject go : buttons){
      go.render(framestep);
    }
  }
  
}
