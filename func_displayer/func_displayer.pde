float slider_radius = 20;
float posx, posy;
boolean over = false;
boolean locked = false;
float xoff;
float fundo;

Slider slider;

void setup()
{
  size(500, 500);
  posx = width/2;
  posy = height/2;
  
  slider = new Slider(new PVector(40, 40), 200, 20);
}


void draw()
{  
  fundo = posx;
  background(200);
  line(175, posy, 325, posy);
  
  if (dist(mouseX, mouseY, posx, posy) < slider_radius) {
    fill(200);
    over = true;
  }
  else {
    fill(255);
    over = false;
  }

  if (posx < 175) {
    posx = 175;
  }
  
  if (posx > 325) {
    posx = 325;
  }
  
  //println(posx);

  circle(posx, posy, slider_radius);
  
  
  slider.display();
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
