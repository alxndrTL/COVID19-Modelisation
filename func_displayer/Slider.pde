class Slider
{
  PVector startingPos;
  float size;
  float slider_radius;
  
  float posx, posy;
  boolean over = false;
  boolean locked = false;
  float xoff;
  
  Slider(PVector _startingPos, float _size, float _slider_radius) // TODO : titre, nom de la grandeur pour la display par la suite... (fioritures)
  {
    startingPos = _startingPos;
    size = _size;
    slider_radius = _slider_radius;
    
    posx = (startingPos.x + startingPos.x + size)/2;
    posy = startingPos.y;
  }
  
  void display()
  {
    line(startingPos.x, posy, startingPos.x+size, posy);
    
    if (dist(mouseX, mouseY, posx, posy) < slider_radius) //overlay
    {
      fill(200);
      over = true;
    }else
    {
      fill(255);
      over = false;
    }
    
    posx = max(posx, startingPos.x);
    posx = min(posx, startingPos.x+size);
    
    circle(posx, posy, slider_radius);
  }
  
  void mousePressed_class(float mousex)
  {
    if (over)
    {
      locked = true;
      xoff = mousex-posx;
    }
  }
  
  void mouseDragged_class(float mousex)
  {
    if (locked)
    {
      posx = mousex-xoff;
    }
  }
  
  void mouseReleased_class()
  {
    locked = false;
  }
}
