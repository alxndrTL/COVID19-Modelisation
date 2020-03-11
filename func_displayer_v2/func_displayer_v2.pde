Slider slider_N;
Slider slider_k;
Slider slider_x0;

void setup()
{
  size(800, 800);
  
  slider_N = new Slider(new PVector(10, 10), 100, 10, 0, 1, "N", 25);
  slider_k = new Slider(new PVector(10, 50), 100, 10, 0, 1, "k", 25);
  slider_x0 = new Slider(new PVector(10, 90), 100, 10, 0, 1, "x0", 25);
}

void draw()
{
  background(220);
  
  slider_N.display();
  slider_k.display();
  slider_x0.display();
}

//TODO : moussePressed, mais attention si il ya plusieurs sliders !! la bise
