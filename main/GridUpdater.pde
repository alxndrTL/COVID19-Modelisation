class GridUpdater
{
  GridUpdater()
  {
  }
  
  Cell[][] update(Cell[][] grid)
  {
    int num = grid.length;
    
    Cell[][] newGrid = new Cell[num][num];
    for(int i = 0; i < newGrid.length; i++) // TODO : simply copy grid into newGrid
    {
      for(int j = 0; j < newGrid.length; i++)
      {
        newGrid[i][j] = new Cell(0);
      }
    }
    
    for(int i = 1; i < num-1; i++)
    {
      for(int j = 1; j < num-1; j++)
      {
        int numAliveNeighbors = aliveNeighbors(grid, i, j);
        
        if(grid[i][j].state == 1)
        {
          if(numAliveNeighbors < 2)
          {
            newGrid[i][j].state = 0; // underpopulation
          }else if(numAliveNeighbors > 3)
          {
            newGrid[i][j].state = 0; // overpopulation
          }else if(numAliveNeighbors == 3) // TODO : reunir == 2 et == 3 par un ou
          {
            newGrid[i][j].state = 1;
          }else if(numAliveNeighbors == 2)
          {
            newGrid[i][j].state = 1;
          }else // TODO : REMOVE LE ELSE SI TOUT VA BIEN
          {
            println("AILLE AILLE OUILLE...");
          }
        }else
        {
          if(numAliveNeighbors == 3)
          {
            newGrid[i][j].state = 1; // reproduction
          }else {
            newGrid[i][j].state = 0;
          }
        }
      }
    }
    
    
    return newGrid;
  }
  
  int aliveNeighbors(Cell[][] grid, int x, int y) //change variables ? x and y look like coordinate, but here these are indices
  //assume x, y are superior to 0, and inferior to grid.length-1 // TODO : gerer le cas ou x,y = 0 ou x,y = grid.length-1
  {
    int numAliveNeighbors = 0;
    
    for(int i = x-1; i < x+2; i++) //put <= i+1 instead, plus joli
    {
      for(int j = y-1; j < y+2; j++)
      {
        if(grid[i][j].state == 1)
        {
          numAliveNeighbors++;
        }
      }
    }
    
    return numAliveNeighbors;
  }
  
}
