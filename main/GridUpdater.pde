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
        
      }
      
    }
    
    
    return newGrid;
  }
  
  int neightbors(Cell[][] grid, int x, int y) //change variables ? x and y look like coordinate, but here these are indices
  //assume x, y are superior to 1, and inferior to grid.length-1
  {
    for(int i = x-1; i < i+2; i++) //put <= i+1 instead, plus joli
    {
      for(int j = 1; j < num-1; j++)
      {
        
      }
      
    }
    
    return 0;
  }
  
}
