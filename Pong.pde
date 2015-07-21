final double MS_PER_UPDATE = 6;

double previous = System.currentTimeMillis();
double lag = 0.0;

void setup(){
  size(800, 450);
  smooth();
}

void draw(){
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

void render(double framestep){
  background(0);
  
}

void processInput(){
  
}

void update(){
  
}
