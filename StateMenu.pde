public class StateMenu extends State{
  
  private ArrayList<GameObject> buttons = new ArrayList<GameObject>();
  private Button clickedButton;
  
  public void init(Pong pong){
    super.init(pong);
    clickedButton = null;
    buttons.add(new Button("Play").setHitBox(100,50).setPos(width - 150, height - 90)); //ID: 0
    
  }
  
  public void deinit(){
    
  }
  
  public void update(){
    
    Button b;
    for(int i = 0; i < buttons.size(); i++){
      b = (Button)buttons.get(i);
      b.update();
      if(b.isClicked()) buttonAction(i);
    }
    
  }
  
  public void buttonAction(int id){
    switch(id){
    case 0: game.setState(new StateGame());
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
