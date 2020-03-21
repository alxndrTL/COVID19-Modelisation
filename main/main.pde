int carres_number = 100;
GridDisplayer gD;
GridUpdater gU;

Cell[][] grid;

void setup()
{
  fullScreen();
  //size(800, 800);
  
  noStroke();
  background(0);
  
  gD = new GridDisplayer(new PVector(width/2-250, height/2-250), 500, carres_number);
  gU = new GridUpdater();
  
  grid = generateInitialGrid(carres_number);  
}

void draw()
{
  grid = gU.update(grid);
  gD.display(grid);
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
