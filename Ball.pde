public class Ball extends GameObject{
  
  private Vector vel;
  private float speed, increment;
  private float size;
  
  public Ball(float size){
    this();
    this.size = size;
    setHitbox(size, size);
  }
  
  public Ball(){
    speed = Pong.options.get(1).getValue();
    vel = new Vector(Math.random() - 0.5D, Math.random() - 0.5D).normalise(speed);
    size = 12;
    setHitbox(size, size);
    increment = 0.1F;
  }
  
  public void update(){
    super.update();
    
    if(getPosX() <= size*0.5F){
      vel.setX(Math.abs(vel.getX()));
      setSpeed(speed + increment);
    }
    if(getPosX() >= width - size*0.5F){
      vel.setX(-Math.abs(vel.getX()));
      setSpeed(speed + increment);
    }
    if(getPosY() <= size*0.5F){
      vel.setY(Math.abs(vel.getY()));
      setSpeed(speed + increment);
    }
    if(getPosY() >= height - size*0.5F){
      vel.setY(-Math.abs(vel.getY()));
      setSpeed(speed + increment);
    }
    
    setPos(getPosX() + vel.getX(), getPosY() + vel.getY());
  }

  public void render(double framestep){
    super.render(framestep);
    Vector vec = getPartialPos(framestep);
    ellipse((float)vec.getX(), (float)vec.getY(), size, size);
  }
  
  public Ball setSpeed(float f){
    speed = f;
    vel = vel.normalise(f);
    return this;
  }
  
  public float getSpeed(){
    return speed;
  }
  
  public float getSize(){
    return size;
  }
}
