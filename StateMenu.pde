public class StateMenu extends State{
  
  private ArrayList<Button> buttons = new ArrayList<Button>();
  private Button clickedButton;
  
  private boolean startExiting;
  private State nextState;
  
  public void init(Pong pong){
    super.init(pong);
    clickedButton = null;
    buttons.add((Button)new Button("Play").setSize(50).setOriginalSize(50).setEnlargedSize(60).setPos(width*0.5F, height - 50)); //ID: 0
    buttons.add((Button)new Button("Options").setSize(25).setOriginalSize(25).setEnlargedSize(30).setPos(width - 220, height - 40)); //ID: 1
    buttons.add((Button)new Button("Quit").setSize(25).setOriginalSize(25).setEnlargedSize(30).setPos(width - 80, height - 40));
    startExiting = false;
  }
  
  public void deinit(){
    
  }
  
  public void update(){
    if(!startExiting){
      Button b;
      for(int i = 0; i < buttons.size(); i++){
        b = buttons.get(i);
        b.update();
      if(b.isClicked()) buttonAction(i);
      }
    } else {
      for(Button b : buttons) b.setPos(b.getPosX(), b.getPosY() + 4);
      if(buttons.get(0).getPosY() > height + 20) game.setState(nextState);
    }
  }
  
  /**
   *  Every time a button is clicked, this function runs, executing corresponding to the ID of the button given.
   *  Parameters: int id: the parameter
   */
  public void buttonAction(int id){
    switch(id){
    case 0:
      startExiting = true;
      nextState = new StateGame(); //Start game
      break;
    case 1: 
      startExiting = true;
      nextState = new StateOptions(); //Open Menu
      break;
    case 2:
      System.exit(0); //exits game
      break;
    default: break;  
    }
  }
  
  public void render(double framestep){
    background(0);
    
    for(GameObject go : buttons){
      go.render(framestep);
    }
  }
  
}
