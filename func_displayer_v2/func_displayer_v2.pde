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

void mousePressed()
{
  slider_N.mousePressed_class(mouseX);
  slider_k.mousePressed_class(mouseX);
  slider_x0.mousePressed_class(mouseX);
}
  
void mouseDragged()
{
  slider_N.mouseDragged_class(mouseX);
  slider_k.mouseDragged_class(mouseX);
  slider_x0.mouseDragged_class(mouseX);
}

void mouseReleased()
{
   slider_N.mouseReleased_class();
   slider_k.mouseReleased_class();
   slider_x0.mouseReleased_class();
}
