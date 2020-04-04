class GridUpdater
{
  float contagiosite = 0.1;
  float tauxVoyage = 0.5;
  float tauxGuerison = 0.01;
  
  int currentInfected = 0;
  int totalInfected = 0;
  
  int maxCurrentInfected = 0;
  
  float txCroissance = 0;
  
  GridUpdater() {} // TODO : params ??

  Cell[][] update(Cell[][] grid)
  {    
    //int num = grid.length;
    int width_num = grid[0].length;
    int height_num = grid.length;

    Cell[][] newGrid = new Cell[height_num][width_num];    
    arrayCopy(grid, newGrid);

    for (int i = 1; i < height_num-1; i++)
    {
      for (int j = 1; j < width_num-1; j++)
      {
        int numInfectedNeighbors = infectedNeighbors(grid, i, j);
        
        if(grid[i][j].state == 1)
        {
          if(numInfectedNeighbors < 2)
          {
            newGrid[i][j].state = 0;
          }else if(numInfectedNeighbors > 3)
          {
            newGrid[i][j].state = 0;
          }else if(numInfectedNeighbors == 3)
          {
            newGrid[i][j].state = 1;
          }else if(numInfectedNeighbors == 2)
          {
            newGrid[i][j].state = 1;
          }else
          {
            println("AILLE");
          }
        }else
        {
          if (numInfectedNeighbors == 3)
          {
            newGrid[i][j].state = 1;
          } else {
            newGrid[i][j].state = 0;
          }
        }
      }
    }
    
    return newGrid;
  }
  
  void updateParams(float newContagiosite, float newTauxGuerison, float newTauxVoyage)
  {
    contagiosite = newContagiosite;
    tauxVoyage = newTauxVoyage;
    tauxGuerison = newTauxGuerison;
  }

  int infectedNeighbors(Cell[][] grid, int row, int col)
  {
    //int num = grid.length;
    int width_num = grid[0].length;
    int height_num = grid.length;
    
    int numInfectedNeighbors = 0;

    for (int i = row-1; i <= row+1; i++)
    {
      for (int j = col-1; j <= col+1; j++)
      {        
        if(((i >= 0) && (i <= height_num-1)) && ((j >= 0) && (j <= width_num-1)))
        {
          if (grid[i][j].state == 1)
          {
            if ((i != row) || (j != col)) // ne pas compter la cell dans le nombre de voisins
            {
              numInfectedNeighbors++;
            }
          }
        }
      }
    }

    return numInfectedNeighbors;
  }
}
