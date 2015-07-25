import java.util.Random;
import java.text.DecimalFormat;

public static final double MS_PER_UPDATE = 7;

public static ArrayList<Option> options = new ArrayList<Option>();

public static Random random;

private static float halfwidth;
private static PFont font;
private static boolean keys[];
private double previous = System.currentTimeMillis();
private double lag = 0.0;

private State currentState;



public void setup() {
  size(800, 450);
  smooth();
  rectMode(CENTER);
  noStroke();
  keys = new boolean[10];
  halfwidth = width*0.5F;
  font = createFont("Minecraft.ttf", 50);
  random = new Random();
  frameRate(300);
  textAlign(CENTER, CENTER);
  setState(new StateMenu());
  
  //add options here
  options.add(new Option("Paddle Speed", 5, 0.1, 50));
  options.add(new Option("Ball Speed", 3, 0.1, 50));
  options.add(new Option("Ball Speed Increase", 1, 0.3, 50));
  options.add(new Option("Paddle Size", 60, 0.1, 500));
  options.add(new Option("Ball Size", 12, 0.1, 50));
  options.add(new Option("Paddle Width", -99, -99, -99));
}

public void draw() {
  double current = System.currentTimeMillis();
  double elapsed = current - previous;
  previous = current;
  lag += elapsed;

  while (lag >= MS_PER_UPDATE) {
    update();
    lag -= MS_PER_UPDATE;
  }

  render(lag/MS_PER_UPDATE);
}

//registers boolean values to keys[] if there are any inputs
public void keyPressed() {
  if(key == 'w' || key == 'W') keys[0] = true;
  if(key == 's' || key == 'S') keys[1] = true;
  if(key == 'a' || key == 'A') keys[2] = true;
  if(key == 'd' || key == 'D') keys[3] = true;
  if(keyCode == UP)            keys[4] = true;
  if(keyCode == DOWN)          keys[5] = true;
  if(keyCode == LEFT)          keys[6] = true;
  if(keyCode == RIGHT)         keys[7] = true;
  if(key == ' ')               keys[8] = true;
  if(keyCode == SHIFT)         keys[9] = true;
}

public void keyReleased() {
  if(key == 'w' || key == 'W') keys[0] = false;
  if(key == 's' || key == 'S') keys[1] = false;
  if(key == 'a' || key == 'A') keys[2] = false;
  if(key == 'd' || key == 'D') keys[3] = false;
  if(keyCode == UP)            keys[4] = false;
  if(keyCode == DOWN)          keys[5] = false;
  if(keyCode == LEFT)          keys[6] = false;
  if(keyCode == RIGHT)         keys[7] = false;
  if(key == ' ')               keys[8] = false;
  if(keyCode == SHIFT)         keys[9] = false;
}

public void render(double framestep) {
  currentState.render(framestep);
}

public void update() {
  currentState.update();
}

public void setState(State state) {
  if(currentState != null) currentState.deinit();
  currentState = state;
  currentState.init(this);
}

public State getCurrentState() {
  return currentState;
}

