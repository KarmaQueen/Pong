public class Button extends GameObject{
  
  private boolean isClicked;
  private boolean isHovered;
  private String text;
  private int size, originalSize, enlargedSize;
  private boolean flag;
  
  //Please use these constructors for initialisation
  public Button(String text, int size){
    this();
    setText(text);
    setSize(size);
    setOriginalSize(size);
    setEnlargedSize(size*6/5);
  }
  public Button(String text, int size, double x, double y){
    this(text, size);
    setPos(x,y);
  }
  
  
  
  //Not advised to use these
  public Button(String text){
    this();
    setText(text);
  }
  public Button(){
    isClicked = false;
    text = "";
    size = originalSize = 50;
    enlargedSize = 50;
    flag = false;
  }
  
  public void update(){
    super.update();
    
    isHovered = mouseX >= getPos().getX() - textWidth(text)*size/50 && mouseY >= getPos().getY() - size*0.5F && 
                mouseX <= getPos().getX() + textWidth(text)*size/50 && mouseY <= getPos().getY() + size*0.5F; 
    
    //boolean flag is used so the button's click isn't registered multiple times.
    if(mousePressed){
      if(flag){
        if(isHovered) isClicked = true;
        }
        flag = false;
    } else {
      flag = true;
      isClicked = false;
    }
    
    setSize(isHovered? enlargedSize : originalSize);
    
  }
  
  public void render(double framestep){
    super.render(framestep);
    textAlign(CENTER, CENTER);
    textFont(Pong.font, size);
    text(text, (float)getPos().getX(), (float)getPos().getY());
  }
  
  //Setters
  public Button setSize(int n){
    this.size = n;
    return this;
  }
  public Button setText(String text){
    this.text = text;
    return this;
  }
  
  public Button setOriginalSize(int n){
    this.originalSize = n;
    return this;
  }
  
  public Button setEnlargedSize(int n){
    this.enlargedSize = n;
    return this;
  }
  
  //Getters
  public boolean isClicked(){
    return isClicked;
  }
  public boolean isHovered(){
    return isHovered;
  }
  
  
}
