public static final double MS_PER_UPDATE = 6;

private float halfwidth;

private boolean keys[];
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
  
  setState(new GameState());
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

boolean dr=false;

public void render(double framestep) {
  background(0); //clears the screen
  
  
  //Draws the input visualizer on the bottom of the screen.
  noStroke();
  if(keys[0]) rect(width * 0.5F - 10, height - 11F, 5, 5);
  if(keys[1]) rect(width * 0.5F - 10, height - 6F,  5, 5);
  if(keys[2]) rect(width * 0.5F - 15, height - 6F,  5, 5);
  if(keys[3]) rect(width * 0.5F -  5, height - 6F,  5, 5);
  if(keys[4]) rect(width * 0.5F + 10, height - 11F, 5, 5);
  if(keys[5]) rect(width * 0.5F + 10, height - 6F,  5, 5);
  if(keys[6]) rect(width * 0.5F +  5, height - 6F,  5, 5);
  if(keys[7]) rect(width * 0.5F + 15, height - 6F,  5, 5);
  
  /* Deprecated
  boolean left;
  int val;
  for(int i = 0; i < keys.length; i++) {
    if(keys[i]) {
    left = i < 4;
    val = i%4;
    rect(
      halfwidth + (left? -1 : 1)*(10 + (val==2? 5 : 0) - (val==3? 5 : 0)),
      450 - (val==0? 11 : 6),
      5,5);
    }
  } */
  
  currentState.render(framestep);
}

public void update() {
  dr = keys[0];
  
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

