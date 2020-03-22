class GridUpdater
{
  constructor()
  {
    this.contagiosite = 0.1;
    this.tauxVoyage = 0.5;
    this.tauxGuerison = 0.01;

    this.currentInfected = 0;
    this.totalInfected = 0;
    this.maxCurrentInfected = 0;
  }

  update(grid)
  {
    let width_num = grid[0].length;
    let height_num = grid.length;

    let newGrid = [];
    for (var i = 0; i < 10; i++)
    {
      newGrid[i] = [];
      for (var j = 0; j < 10; j++) {
        newGrid[i][j] = new Cell(grid[i][j].state);
      }
    }

    for (var i = 0; i < height_num; i++)
    {
      for (var j = 0; j < width_num; j++)
      {
        if(grid[i][j].state == 0)
        {
          let numInfectedNeighbors = this.infectedNeighbors(grid, i, j);
          let p_infection = min(this.contagiosite * numInfectedNeighbors, 1);

          if(random(0, 1) < p_infection)
          {
            newGrid[i][j].state = 1;
            this.currentInfected++;
            this.totalInfected++;
          }
        }else if(grid[i][j].state == 1)
        {
          //guerison avec une certaine prob
          if(random(0, 1) < this.tauxGuerison)
          {
            newGrid[i][j].state = 2;
            this.currentInfected--;
          }
        }
      }
    }

    if(random(0, 1) < this.tauxVoyage) //déplacement
    {
      let random_row = round(random(0, height_num-1));
      let random_col = round(random(0, width_num-1));

      if(newGrid[random_row][random_col].state == 0)
      {
        newGrid[random_row][random_col].state = 1;
        this.currentInfected++;
        this.totalInfected++;
      }
    }

    this.maxCurrentInfected = max(this.maxCurrentInfected, this.currentInfected);

    return newGrid;
  }

  infectedNeighbors(grid, row, col)
  {
    let width_num = grid[0].length;
    let height_num = grid.length;

    let numInfectedNeighbors = 0;

    for (var i = row-1; i <= row+1; i++)
    {
      for (var j = col-1; j <= col+1; j++)
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
