class GridUpdater
{
  GridUpdater()
  {
  }
  
  Cell[][] updateGrid(Cell[][] grid)
  {
    int num = grid.length;
    Cell[][] newGrid = new Cell[grid.length][num];
    
    for(int i = 1; i < num-1; i++)
    {
      for(int j = 1; j < num-1; j++)
      {
        int numAliveNeighbors = aliveNeighbors(grid, i, j);
        
        if(grid[i][j].state == 1)
        {
          if(numAliveNeighbors < 2)
          {
            grid[i][j].state = 0; // underpopulation
          }else if(numAliveNeighbors > 3)
          {
            grid[i][j].state = 0; // overpopulation
          }else if(numAliveNeighbors == 3)
          {
            grid[i][j].state = 1;
          }else if(numAliveNeighbors == 2)
          {
            grid[i][j].state = 1;
          }else
          {
            println("AILLE AILLE OUILLE...");
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
    
    for(int i = x-1; i < i+2; i++) //put <= i+1 instead, plus joli
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
