int carres_number = 100;

void setup()
{
  size(800, 800);
  
  noStroke();
  
  background(0);
  
  
  int[][] grid = generateInitialGrid(carres_number);
  float start = 0;
  float stop_x = width;
  float stop_y = height;
  
  for(int i = 0; i < carres_number; i++)
  {
    for(int j = 0; j < carres_number; j++)
    {
      float x = map(i, 0, carres_number, start, stop_x);
      float y = map(i, 0, carres_number, start, stop_y);
      
      if(grid[i][j] == 0)
      {
        fill(238, 130, 238);
      }
      else
      {
        fill(100, 150, 160);
      }
      
      square(x, y, stop_x/carres_number);
    }
  }
}

void draw()
{
}

int[][] generateInitialGrid(int num)
{
  int[][] grid = new int[num][num];
  
  for(int i = 0; i < num; i++)
  {
    for(int j = 0; j < num; j++)
    {
      grid[i][j] = round(random(0, 1));
    }
  }
  
  return grid;
}
