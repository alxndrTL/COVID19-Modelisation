class GridDisplayer
{
  constructor(_start_point, _width_size, _height_size, _width_num, _height_num)
  {
    this.width_size = _width_size;
    this.height_size = _height_size;
    this.width_num = _width_num;
    this.height_num = _height_num;

    this.start_point = _start_point;
    this.stop_point = p5.Vector.add(this.start_point, new p5.Vector(this.width_size, this.height_size))
  }

  display(grid)
  {
    noStroke();

    for (var i = 0; i < this.height_num; i++)
    {
      for (var j = 0; j < this.width_num; j++)
      {
        let x = map(j, 0, this.width_num, this.start_point.x, this.stop_point.x);
        let y = map(i, 0, this.height_num, this.start_point.y, this.stop_point.y);

        if(grid[i][j].state == 0)
        {
          fill(255); // sain : blanc
        }
        else if(grid[i][j].state == 1)
        {
          fill(255, 0, 0); // infecte : rouge
        }else if(grid[i][j].state == 2)
        {
          fill(0, 255, 0); // gueri : vert
        }else
        {
          fill(255);
        }

        rect(x, y, this.width_size/this.width_num, this.height_size/this.height_num); //better if its a square ie. width_size/width_num = height_size/height_num
      }
    }
  }
}
