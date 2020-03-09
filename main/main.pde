int carres_number = 10;
GridDisplayer gD;

void setup()
{
  size(800, 800);
  
  noStroke();
  background(0);
  
  gD = new GridDisplayer(new PVector(50, 60), 400, carres_number);
  
  int[][] grid = generateInitialGrid(carres_number);
  
  gD.display(grid);
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
