int carres_number = 100;
GridDisplayer gD;

void setup()
{
  size(800, 800);
  
  noStroke();
  background(0);
  
  gD = new GridDisplayer(new PVector(50, 60), 400, carres_number);
  
  Cell[][] grid = generateInitialGrid(carres_number);
  
  println(grid.length);
  
  gD.display(grid);
}

void draw()
{
}

Cell[][] generateInitialGrid(int num)
{
  Cell[][] grid = new Cell[num][num];
  
  for(int i = 0; i < num; i++)
  {
    for(int j = 0; j < num; j++)
    {
      grid[i][j] = new Cell(round(random(0, 1)));
    }
  }
  
  return grid;
}
