class GridUpdater
{
  float totalInfected = 0;
  
  GridUpdater() {} // TODO : params ??

  Cell[][] update(Cell[][] grid)
  {
    int num = grid.length;

    Cell[][] newGrid = new Cell[num][num];    
    arrayCopy(grid, newGrid);

    for (int i = 0; i < num; i++) // 1 num-1
    {
      for (int j = 0; j < num; j++) // 1 num-1
      {
        int numInfectedNeighbors = infectedNeighbors(grid, i, j);
        
        if (grid[i][j].state == 0)
        {
          float p_infection = min(0.10 * numInfectedNeighbors, 1);
          if(random(0, 1) < p_infection)
          {
            newGrid[i][j].state = 1;
            totalInfected++;
          }
        } else
        {
          
        }
      }
    }
    return newGrid;
  }

  int infectedNeighbors(Cell[][] grid, int row, int col)
    //assume x, y are superior to 0, and inferior to grid.length-1 // TODO : gerer le cas ou x,y = 0 ou x,y = grid.length-1
  {
    int num = grid.length;
    int numInfectedNeighbors = 0; // -1 to not count the cell itself as a neighbor

    for (int i = row-1; i < row+2; i++) //put <= i+1 instead, plus joli
    {
      for (int j = col-1; j < col+2; j++)
      {
        if((i < 0) || (i > num-1))
        {
          
        }else if((j < 0) || (j > num-1))
        {
          
        }else
        {
          if (grid[i][j].state == 1)
          {
            if ((i != row) || (j != col))
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
