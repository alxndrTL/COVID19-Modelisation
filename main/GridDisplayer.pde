// display a 2 dimensional grid

class GridDisplayer
{
  PVector start_point;
  PVector stop_point;
  float size;
  int num;
  
  GridDisplayer(PVector _start_point, float _size, int _num)
  {
    start_point = _start_point;
    size = _size;
    num = _num;
    
    stop_point = PVector.add(start_point, new PVector(size, size));
    print(start_point.x);
  }
  
  void display(int[][] grid)
  {    
    for(int i = 0; i < num; i++)
    {
      for(int j = 0; j < num; j++)
      {
        float x = map(i, 0, num, start_point.x, stop_point.x);
        float y = map(j, 0, num, start_point.y, stop_point.y);
      
        if(grid[i][j] == 0)
        {
          fill(238, 130, 238);
        }
        else
        {
          fill(100, 150, 160);
        }
        
        square(x, y, size/num);
      }
    }
  }
  
}
