  // display a 2 dimensional grid

class GridDisplayer
{
  PVector start_point;
  PVector stop_point;
  float width_size;
  float height_size;
  int width_num;
  int height_num;
  
  GridDisplayer(PVector _start_point, float _width_size, float _height_size, int _width_num, int _height_num)
  {
    start_point = _start_point;
    
    width_size = _width_size;
    height_size = _height_size;
    
    width_num = _width_num;
    height_num = _height_num;
    
    stop_point = PVector.add(start_point, new PVector(width_size, height_size));
  }
  
  void display(Cell[][] grid)
  {
    noStroke();
    
    for(int i = 0; i < height_num; i++)
    {
      for(int j = 0; j < width_num; j++)
      {
        float x = map(j, 0, width_num, start_point.x, stop_point.x); // IT WAS INVERTED!!!!!
        float y = map(i, 0, height_num, start_point.y, stop_point.y);
        
        if(grid[i][j].state == 0)
        {
          fill(255); // sain : blanc
        }
        else if(grid[i][j].state == 1)
        {
          fill(255, 0, 0); // infecte : rouge
        }else if(grid[i][j].state == 2)
        {
          fill(0, 255, 0); // gueri : vert
        }else
        {
          fill(255);
        }
        
        //square(x, y, size/num);
        rect(x, y, width_size/width_num, height_size/height_num); //better if its a square ie. width_size/width_num = height_size/height_num
      }
    }
  }
  
}
