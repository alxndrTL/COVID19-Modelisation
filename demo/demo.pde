int width_num = 100; //480 ou 960
int height_num = 100; //125 ou 250

GridDisplayer gD;
GridUpdater gU;

Cell[][] grid;

void setup()
{
  fullScreen();
  //size(800, 800);
  
  noStroke();
  background(0);
  
  gD = new GridDisplayer(new PVector(width/2-250, height/2-250), 500, 500, width_num, height_num);
  gU = new GridUpdater();
  
  grid = generateInitialGrid(width_num, height_num);
  gD.display(grid);
  
  //grid = gU.update(grid);
  //gD.display(grid);
}

void draw()
{
  background(0);
  grid = gU.update(grid);
  gD.display(grid);
}

Cell[][] generateInitialGrid(int width_num, int height_num)
{
  Cell[][] grid = new Cell[height_num][width_num];
  
  for(int i = 0; i < height_num; i++)
  {
    for(int j = 0; j < width_num; j++)
    {
      //grid[i][j] = new Cell(0);
      grid[i][j] = new Cell(round(random(0, 1)));
    }
  }
  
  //int row = round(random(0.25*float(height_num), 0.75*float(height_num))); //make sure the starting point is in the center of the CA
  //int col = round(random(0.25*float(width_num)/4, 0.75*float(width_num)));
  //grid[row][col].state = 1;
  //gU.currentInfected++;
  //gU.totalInfected ++;
  
  //grid[4][4].state = 1;
  //grid[5][4].state = 1;
  //grid[5][3].state = 2;
  //grid[5][7].state = 2;
  
  return grid;
}
