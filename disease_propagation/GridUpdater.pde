class GridUpdater
{
  float contagiosite = 0.1;
  float tauxVoyage = 0.5;
  float tauxGuerison = 0.01;
  
  float currentInfected = 0;
  float totalInfected = 0;
  
  float maxCurrentInfected = 0;
  
  GridUpdater() {} // TODO : params ??

  Cell[][] update(Cell[][] grid)
  {
    int num = grid.length;

    Cell[][] newGrid = new Cell[num][num];    
    arrayCopy(grid, newGrid);

    for (int i = 0; i < num; i++)
    {
      for (int j = 0; j < num; j++)
      {
        if(grid[i][j].state == 0)
        {
          int numInfectedNeighbors = infectedNeighbors(grid, i, j);
          float p_infection = min(contagiosite * numInfectedNeighbors, 1);
          
          if(random(0, 1) < p_infection)
          {
            newGrid[i][j].state = 1;
            currentInfected++;
            totalInfected++;
          }
        } else if(grid[i][j].state == 1)
        {
          //guerison avec une certaine prob
          if(random(0, 1) < tauxGuerison)
          {
            newGrid[i][j].state = 2;
            currentInfected--;
          }
          
        }
      }
    }
    
    //if(random(0, 1) < 0.01 + (1/(totalInfected))) //déplacement
    if(random(0, 1) < tauxVoyage)
    {
      int random_row = round(random(0, num-1));
      int random_col = round(random(0, num-1));
      
      if(newGrid[random_row][random_col].state == 0)
      {
        newGrid[random_row][random_col].state = 1;
        currentInfected++;
        totalInfected++;
      } 
    }
    
    maxCurrentInfected = max(maxCurrentInfected, currentInfected);
    
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
    int num = grid.length;
    int numInfectedNeighbors = 0;

    for (int i = row-1; i <= row+1; i++)
    {
      for (int j = col-1; j <= col+1; j++)
      {        
        if(((i >= 0) && (i <= num-1)) && ((j >= 0) && (j <= num-1)))
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
