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
  
  PFont cmuFont;
  
  Slider(PVector _startingPos, float _size, float _slider_radius, float _minValue, float _maxValue, String _nameValue, float _nameSize)
  {
    startingPos = _startingPos;
    size = _size;
    slider_radius = _slider_radius;
    
    minValue = _minValue;
    maxValue = _maxValue;
    nameValue = _nameValue;
    nameSize = _nameSize;
    
    posx = 0.8;//defaultValue;
    posy = startingPos.y;
    
    cmuFont = createFont("cmunrm.ttf", nameSize);
  }
  
  void display()
  {
    strokeWeight(5);
    stroke(255);
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
    
    fill(255, 9, 50);
    circle(posx, posy, slider_radius);
    noStroke();
    fill(255);
    textSize(25);
    textFont(cmuFont);
    text(nameValue + " = " + nf(map(posx, startingPos.x, startingPos.x+size, minValue, maxValue), 1, 2), startingPos.x+size+20, posy+5);
  }
  
  void setValue(float newValue)
  {
    // expects newValue to be in the range specified in the constructor.
    posx = map(newValue, minValue, maxValue, startingPos.x, startingPos.x+size);
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
