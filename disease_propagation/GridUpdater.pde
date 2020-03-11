class GridUpdater
{
  GridUpdater()
  {
  }

  Cell[][] update(Cell[][] grid)
  {
    int num = grid.length;

    Cell[][] newGrid = new Cell[num][num];
    for (int i = 0; i < newGrid.length; i++) // TODO : simply copy grid into newGrid
    {
      for (int j = 0; j < newGrid.length; j++)
      {
        newGrid[i][j] = new Cell(0);
      }
    }

    for (int i = 1; i < num-1; i++)
    {
      for (int j = 1; j < num-1; j++)
      {
        int numInfectedNeighbors = infectedNeighbors(grid, i, j);
        
        if (grid[i][j].state == 0)
        {
          float p_infection = min(0.50 * numInfectedNeighbors, 0.2);
          if(random(0, 1) < p_infection)
          {
            newGrid[i][j].state = 1;
          }
        } else
        {
          
        }
      }
    }
    return newGrid;
  }

  int infectedNeighbors(Cell[][] grid, int row, int col) //change variables ? x and y look like coordinate, but here these are indices
    //assume x, y are superior to 0, and inferior to grid.length-1 // TODO : gerer le cas ou x,y = 0 ou x,y = grid.length-1
  {
    int numInfectedNeighbors = 0; // -1 to not count the cell itself as a neighbor

    for (int i = row-1; i < row+2; i++) //put <= i+1 instead, plus joli
    {
      for (int j = col-1; j < col+2; j++)
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

    return numInfectedNeighbors;
  }
}
