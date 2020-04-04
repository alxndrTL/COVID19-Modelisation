class Slider
{
  PVector startingPos;
  float size;
  float slider_radius;
  
  float minValue, maxValue;
  String nameValue;
  float nameSize;
  
  float posx, posy;
  boolean over = false;
  boolean locked = false;
  float xoff;
  
  Slider(PVector _startingPos, float _size, float _slider_radius, float _minValue, float _maxValue, String _nameValue, float _nameSize)
  {
    startingPos = _startingPos;
    size = _size;
    slider_radius = _slider_radius;
    
    minValue = _minValue;
    maxValue = _maxValue;
    nameValue = _nameValue;
    nameSize = _nameSize;
    
    posx = (startingPos.x + startingPos.x + size)/2;
    posy = startingPos.y;
    
    PFont cmuFont = createFont("cmunrm.ttf", nameSize);
    textFont(cmuFont);
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
    fill(255);
    text(nameValue + " = " + posx, startingPos.x+size+15, posy+5);
  }
  
  float getValue()
  {
    return map(posx, startingPos.x, startingPos.x+size, minValue, maxValue);
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
