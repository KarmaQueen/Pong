public class Button extends GameObject{
  
  private boolean isClicked;
  private String text;
  private int size;
  private int textWidth, textHeight;
  private boolean flag;
  
  
  public Button(String text){
    this();
    setText(text);
  }
  
  public Button(){
    isClicked = false;
    text = "";
    size = 50;
    flag = false;
  }
  
  public void update(){
    super.update();
    
    //boolean flag is used so the button's click isn't registered multiple times.
    if(mousePressed){
      if(flag){
        //Sees whether the mouse is in range of the button
        if(mouseX >= getPosX() && mouseY >= getPosY() && 
           mouseX <= getPosX() + textWidth(text) && mouseY <= getPosY() + size){
          isClicked = true; 
        }
        flag = false;
      }
    } else flag = true;
  }
  
  public void render(double framestep){
    super.render(framestep);
    textAlign(LEFT, TOP);
    textFont(Pong.font, 50);
    text(text, (float)getPosX(), (float)getPosY());
  }
  
  //Setters
  public void setSize(int size){
    this.size = size;
  }
  public void setText(String text){
    this.text = text;
  }
  public Button setHitBox(int x, int y){
    textWidth = x;
    textHeight = y;
    return this;
  }
  
  //Getters
  public boolean isClicked(){
    return isClicked;
  }
  
  
}
