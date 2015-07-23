public class Vector {
  
  private double xCoord, yCoord;
  
  //Constructors
  public Vector() {
    this(0D, 0D);
  }
  public Vector(double x, double y) {
    xCoord = x;
    yCoord = y;
  }
  
  public Vector normalise(){
    double len = getDistance(ZERO, this);
    xCoord /= len;
    yCoord /= len;
    return this;
  }
  public Vector normalise(double d){
    return normalise().scalar(d);
  }
  
  public Vector scalar(double d){
    xCoord *= d;
    yCoord *= d;
    return this;
  }
  
  //Setters
  public Vector setVec(double x, double y) {
    xCoord = x;
    yCoord = y;
    return this;
  }
  public Vector setX(double x) {
    xCoord = x;
    return this;
  }
  public Vector setY(double y) {
    yCoord = y;
    return this;
  }
  public Vector setVec(Vector vec) {
    xCoord = vec.getX();
    yCoord = vec.getY();
    return this;
  }
  
  
  //Getters
  public double getX() {
    return xCoord;
  }
  public double getY() {
    return yCoord;
  }
}

//These methods can be accessed directly by all other classes

public final Vector ZERO = new Vector(0,0);

public Vector createVector(double x, double y) {
  return new Vector(x, y);
}

public double getDistance(Vector vec1, Vector vec2) {
  return Math.sqrt(getDistanceSq(vec1, vec2));
}

public double getDistanceSq(Vector vec1, Vector vec2) {
  double dx = vec1.xCoord - vec2.xCoord;
  double dy = vec1.yCoord - vec2.yCoord;
  return dx * dx + dy * dy;
}


