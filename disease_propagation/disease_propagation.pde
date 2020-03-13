import grafica.*;

int carres_number = 500;
GridDisplayer gD;
GridUpdater gU;

Cell[][] grid;

int time = 0;
boolean finished = false;

boolean logscale = false;
float minLim = 0;

GPlot plot_NTotalinfectes;
GPlot plot_NCurrentinfectes;

void setup()
{
  size(2000, 1000);
  
  noStroke();
  background(0);
  
  gD = new GridDisplayer(new PVector(0, 0), 500, carres_number);
  gU = new GridUpdater();
  
  grid = generateInitialGrid(carres_number);
  
  plot_NTotalinfectes = new GPlot(this);
  plot_NTotalinfectes.setPos(25, 500);
  plot_NTotalinfectes.setDim(600, 400);

  // Set the plot title and the axis labels
  plot_NTotalinfectes.getXAxis().setAxisLabelText("temps");
  plot_NTotalinfectes.getYAxis().setAxisLabelText("infectes");
  
  //plot.getYAxis().setOffset(-5);
  plot_NTotalinfectes.getYAxis().setLineColor(255);
  plot_NTotalinfectes.getYAxis().setLineWidth(3);
  plot_NTotalinfectes.getYAxis().setFontColor(255);
  plot_NTotalinfectes.getYAxis().setFontName("cmunrm.ttf");
  plot_NTotalinfectes.getYAxis().setFontSize(20);
  
  plot_NTotalinfectes.getYAxis().getAxisLabel().setFontColor(255);
  plot_NTotalinfectes.getYAxis().getAxisLabel().setFontSize(40);
  plot_NTotalinfectes.getYAxis().getAxisLabel().setFontName("cmunrm.ttf");
  
  plot_NTotalinfectes.getYAxis().setNTicks(5); //nombre de graduations
  plot_NTotalinfectes.getYAxis().setTickLength(0); // graduations (traits) ou pas ?
  plot_NTotalinfectes.getYAxis().setRotateTickLabels(false); // rotate les graduations ?
  plot_NTotalinfectes.getYAxis().setTickLabelOffset(7); //distance graduations de l'axis
  
  plot_NTotalinfectes.getXAxis().setLineColor(255);
  plot_NTotalinfectes.getXAxis().setLineWidth(3);
  plot_NTotalinfectes.getXAxis().setFontColor(255);
  plot_NTotalinfectes.getXAxis().setFontName("cmunrm.ttf");
  plot_NTotalinfectes.getXAxis().setFontSize(20);
  
  plot_NTotalinfectes.getXAxis().getAxisLabel().setFontColor(255);
  plot_NTotalinfectes.getXAxis().getAxisLabel().setFontSize(40);
  plot_NTotalinfectes.getXAxis().getAxisLabel().setFontName("cmunrm.ttf");
  
  plot_NTotalinfectes.getXAxis().setNTicks(5); //nombre de graduations
  plot_NTotalinfectes.getXAxis().setTickLength(0); // graduations (traits) ou pas ?
  plot_NTotalinfectes.getXAxis().setRotateTickLabels(false); // rotate les graduations ?
  plot_NTotalinfectes.getXAxis().setTickLabelOffset(7); //distance graduations de l'axis
  
  plot_NTotalinfectes.setPointSize(10);
  plot_NTotalinfectes.setPointColor(255);
  
  plot_NTotalinfectes.setLineColor(255);
  plot_NTotalinfectes.setLineWidth(3);
  
  plot_NTotalinfectes.beginDraw();
  plot_NTotalinfectes.setAxesOffset(0);
  plot_NTotalinfectes.drawXAxis();
  plot_NTotalinfectes.drawYAxis();
  plot_NTotalinfectes.drawPoints();
  plot_NTotalinfectes.drawLines();
  plot_NTotalinfectes.endDraw();
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
    plot_NTotalinfectes.addPoint(time, gU.totalInfected);
    plot_NTotalinfectes.setXLim(minLim, time);
  }
  
  gD.display(grid);
  
  plot_NTotalinfectes.beginDraw();
  plot_NTotalinfectes.setAxesOffset(0);
  plot_NTotalinfectes.drawXAxis();
  plot_NTotalinfectes.drawYAxis();
  plot_NTotalinfectes.drawPoints();
  plot_NTotalinfectes.drawLines();
  plot_NTotalinfectes.endDraw();
  
  time++;
  
  plot_NTotalinfectes.setYLim(minLim, gU.totalInfected);
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
  gU.currentInfected++;
  gU.totalInfected ++;
  
  
  return grid;
}

void mouseClicked()
{
  logscale = !logscale;
  
  if (logscale) {
    plot_NTotalinfectes.setLogScale("y");
    plot_NTotalinfectes.getYAxis().setAxisLabelText("log(infectes)");
  }
  else {
    plot_NTotalinfectes.setLogScale("");
    plot_NTotalinfectes.getYAxis().setAxisLabelText("infectes");
  }
}
