public static final double MS_PER_UPDATE = 6;

double previous = System.currentTimeMillis();
double lag = 0.0;

public void setup(){
  size(800, 450);
  smooth();
}

public void draw(){
  double current = System.currentTimeMillis();
  double elapsed = current - previous;
  previous = current;
  lag += elapsed;

  processInput();

  while (lag >= MS_PER_UPDATE)
  {
    update();
    lag -= MS_PER_UPDATE;
  }

  render(lag/MS_PER_UPDATE);
}

public void render(double framestep){
  background(0);
  
}

public void processInput(){
  
}

public void update(){
  
}
