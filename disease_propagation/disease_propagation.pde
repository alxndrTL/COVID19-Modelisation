import grafica.*;

int carres_number = 500;
GridDisplayer gD;
GridUpdater gU;

Cell[][] grid;

int time = 0;
boolean finished = false;

boolean logscale = false;
float minLim = 0;

GPlot plot;

void setup()
{
  size(1000, 1000);
  
  noStroke();
  background(0);
  
  gD = new GridDisplayer(new PVector(0, 0), 500, carres_number);
  gU = new GridUpdater();
  
  grid = generateInitialGrid(carres_number);
  
  plot = new GPlot(this);
  plot.setPos(25, 500);
  plot.setDim(600, 400);

  // Set the plot title and the axis labels
  plot.getXAxis().setAxisLabelText("temps");
  plot.getYAxis().setAxisLabelText("infectes");
  
  //plot.getYAxis().setOffset(-5);
  plot.getYAxis().setLineColor(255);
  plot.getYAxis().setLineWidth(3);
  plot.getYAxis().setFontColor(255);
  plot.getYAxis().setFontName("cmunrm.ttf");
  plot.getYAxis().setFontSize(20);
  
  plot.getYAxis().getAxisLabel().setFontColor(255);
  plot.getYAxis().getAxisLabel().setFontSize(40);
  plot.getYAxis().getAxisLabel().setFontName("cmunrm.ttf");
  
  plot.getYAxis().setNTicks(5); //nombre de graduations
  plot.getYAxis().setTickLength(0); // graduations (traits) ou pas ?
  plot.getYAxis().setRotateTickLabels(false); // rotate les graduations ?
  plot.getYAxis().setTickLabelOffset(7); //distance graduations de l'axis
  
  plot.getXAxis().setLineColor(255);
  plot.getXAxis().setLineWidth(3);
  plot.getXAxis().setFontColor(255);
  plot.getXAxis().setFontName("cmunrm.ttf");
  plot.getXAxis().setFontSize(20);
  
  plot.getXAxis().getAxisLabel().setFontColor(255);
  plot.getXAxis().getAxisLabel().setFontSize(40);
  plot.getXAxis().getAxisLabel().setFontName("cmunrm.ttf");
  
  plot.getXAxis().setNTicks(5); //nombre de graduations
  plot.getXAxis().setTickLength(0); // graduations (traits) ou pas ?
  plot.getXAxis().setRotateTickLabels(false); // rotate les graduations ?
  plot.getXAxis().setTickLabelOffset(7); //distance graduations de l'axis
  
  plot.setPointSize(10);
  plot.setPointColor(255);
  
  plot.setLineColor(255);
  plot.setLineWidth(3);
  
  plot.beginDraw();
  plot.setAxesOffset(0);
  plot.drawXAxis();
  plot.drawYAxis();
  plot.drawPoints();
  plot.drawLines();
  plot.endDraw();
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
    plot.addPoint(time, gU.totalInfected);
    plot.setXLim(minLim, time);
  }
  
  gD.display(grid);
  
  plot.beginDraw();
  plot.setAxesOffset(0);
  plot.drawXAxis();
  plot.drawYAxis();
  plot.drawPoints();
  plot.drawLines();
  plot.endDraw();
  
  time++;
  
  plot.setYLim(minLim, gU.totalInfected);
  if(gU.totalInfected >= carres_number*carres_number)
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
  gU.totalInfected ++;
  
  return grid;
}

void mouseClicked()
{
  logscale = !logscale;
  
  if (logscale) {
    plot.setLogScale("y");
    plot.getYAxis().setAxisLabelText("log(infectes)");
  }
  else {
    plot.setLogScale("");
    plot.getYAxis().setAxisLabelText("infectes");
  }
}
