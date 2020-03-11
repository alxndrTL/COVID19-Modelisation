Slider slider;

void setup()
{
  size(800, 800);

  slider = new Slider(new PVector(40, 40), 200, 20, 0, 100, "a", 25);
  
  //PFont cmuFont = createFont("cmunrm.ttf", 50);
  //textFont(cmuFont);
}


void draw()
{  

  background(200);
  slider.display();
  
  //text("Salut", width/2, height/2);
}

void mousePressed()
{
  slider.mousePressed_class(mouseX);
}
  
void mouseDragged()
{
  slider.mouseDragged_class(mouseX);  
}

void mouseReleased()
{
   slider.mouseReleased_class();  
}
