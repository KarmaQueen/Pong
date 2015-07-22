public class StateMenu extends State{
  
  private ArrayList<Button> buttons = new ArrayList<Button>();
  private Button clickedButton;
  
  public void init(Pong pong){
    super.init(pong);
    clickedButton = null;
    buttons.add((Button)new Button("Play").setSize(50).setOriginalSize(50).setEnlargedSize(60).setPos(width - 100, height - 50)); //ID: 0
    buttons.add((Button)new Button("Options").setSize(25).setOriginalSize(25).setEnlargedSize(30).setPos(100, height - 40)); //ID: 1
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
    case 0: game.setState(new StateGame()); //Start game
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
