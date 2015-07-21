/*
 * Color class.
 * When instantiating a new color, use new Color(red,green,blu);
 *
 */
class Color{
  
  private int r, g, b;
  
  public Color(int red, int green, int blue){
    r = red;
    g = green;
    b = blue;
  }
  
  /* Processing is janky and hence cannot use this method
  public static Color create(int red, int green, int blue){
    return new Color(red, green, blue);
  }
  */
  
  //Cloning Method
  public Color clone(){
    Color c = new Color(r,g,b);
    return c;
  }
  
  //Action Methods
  public void setFill(){
    fill(r,g,b);  
  }
  public void setStroke(){
    stroke(r,g,b);
  }
  
  //Setters
  public void setRed(int val){ r = val; }
  public void setGreen(int val){ g = val; }
  public void setBlue(int val){ b = val; }
  
  public Color setColor(int red, int green, int blue){
    r = red;
    g = green;
    b = blue;
    return clone();
  }
  
  //Getters/Accessors
  public int getRed(){ return r; }
  public int getGreen(){ return g; }
  public int getBlue(){ return b; }
  
  
  
}
