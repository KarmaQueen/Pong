import java.util.Random;

public static final double MS_PER_UPDATE = 6;

public static Random r;

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
  keys = new boolean[9];
  halfwidth = width*0.5F;
  font = createFont("Minecraft.ttf", 50);
  r = new Random();
  frameRate(300);
  textAlign(CENTER, CENTER);
  setState(new StateMenu());
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

