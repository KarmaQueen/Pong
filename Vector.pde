public class Vector {
  
  private double xCoord, yCoord;
  
  public Vector() {
    this(0D, 0D);
  }
  
  public Vector(double x, double y) {
    xCoord = x;
    yCoord = y;
  }
  
  public Vector setVec(double x, double y) {
    xCoord = x;
    yCoord = y;
    return this;
  }
  
  public Vector setVec(Vector vec) {
    xCoord = vec.getX();
    yCoord = vec.getY();
    return this;
  }
  
  public double getX() {
    return xCoord;
  }
  
  public double getY() {
    return yCoord;
  }
}

//These methods can be accessed directly by all other classes

Vector createVector(double x, double y) {
  return new Vector(x, y);
}

double getDistance(Vector vec1, Vector vec2) {
  return Math.sqrt(getDistanceSq(vec1, vec2));
}

double getDistanceSq(Vector vec1, Vector vec2) {
  double dx = vec1.xCoord - vec2.xCoord;
  double dy = vec1.yCoord - vec2.yCoord;
  return dx * dx + dy * dy;
}
