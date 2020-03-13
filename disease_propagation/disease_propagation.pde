import grafica.*;

int carres_number = 500;
GridDisplayer gD;
GridUpdater gU;

Cell[][] grid;

int time = 0;
boolean finished = false;

boolean logscale = false;
float minLim = 0;

Plot plot_NTotalInfectes;
Plot plot_NCurrentInfectes;

void setup()
{
  size(2000, 1000);
  
  noStroke();
  background(0);
  
  gD = new GridDisplayer(new PVector(0, 0), 500, carres_number);
  gU = new GridUpdater();
  
  grid = generateInitialGrid(carres_number);
  
  plot_NTotalInfectes = new Plot(this, new PVector(25, 500), "temps", "infectés");
  plot_NCurrentInfectes = new Plot(this, new PVector(800, 500), "temps", "infectés courant"); 
}

void draw()
{
  background(0);
  
  if(logscale)
  {
    minLim = 0.01;
  }else
  {
    minLim = 0;
  }
  
  if(!finished)
  {
    grid = gU.update(grid);
    plot_NTotalInfectes.addPoint(time, gU.totalInfected);
    plot_NTotalInfectes.setXLim(minLim, time);
    
    plot_NCurrentInfectes.addPoint(time, gU.currentInfected);
    plot_NCurrentInfectes.setXLim(minLim, time);
  }
  
  gD.display(grid);
  
  plot_NTotalInfectes.display();
  plot_NCurrentInfectes.display();
  
  time++;
  
  plot_NTotalInfectes.setYLim(minLim, gU.totalInfected);
  plot_NCurrentInfectes.setYLim(minLim, gU.maxCurrentInfected);
  if((gU.currentInfected <= 10000) && (gU.totalInfected >= carres_number*carres_number))
  {
    finished = true;
  }
}

Cell[][] generateInitialGrid(int num)
{
  Cell[][] grid = new Cell[num][num];
  
  for(int i = 0; i < num; i++)
  {
    for(int j = 0; j < num; j++)
    {
      grid[i][j] = new Cell(0);
    }
  }
  
  int row = round(random(0.25*float(num), 0.75*float(num))); //make sure the starting point is in the center of the CA
  int col = round(random(0.25*float(num)/4, 0.75*float(num)));
  grid[row][col].state = 1;
  gU.currentInfected++;
  gU.totalInfected ++;
  
  
  return grid;
}
