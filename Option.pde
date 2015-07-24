class Option extends Button{
  
  private float value, min, max;
  
  public Option(String s, float f){
    super(s, 30);
    value = f;
    min = Float.MIN_VALUE;
    max = Float.MAX_VALUE;
  }
  
  public Option(String s, float f, float minimum, float maximum){
    this(s,f);
    min = minimum;
    max = maximum;
  }
  
  
  //Setters
  public void setValue(float f){
    value = Math.max(f, min);
    value = Math.min(value, max);
  }
  
  //Getters
  public float getValue(){
    return value;
  }
  public float getMax(){
    return max;
  }
  public float getMin(){
    return min;
  }
  
}
