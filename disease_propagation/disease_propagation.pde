import grafica.*;

int carres_number = 100;
GridDisplayer gD;
GridUpdater gU;

Cell[][] grid;

int time = 0;
boolean finished = false;

boolean logscale = false;
float minLim = 0;

Plot plot_NTotalInfectes;
Plot plot_NCurrentInfectes;
Plot plot_TxCroissance;

Slider contagiositeSlider;
Slider tauxGuerisonSlider;
Slider tauxVoyageSlider;

void setup()
{
  //fullScreen();
  size(2500, 1200);
  
  noStroke();
  background(0);
  
  gD = new GridDisplayer(new PVector(0, 0), 500, carres_number);
  gU = new GridUpdater();
  
  grid = generateInitialGrid(carres_number);
  
  plot_NTotalInfectes = new Plot(this, new PVector(25, 500), "temps", "infectés");
  plot_NCurrentInfectes = new Plot(this, new PVector(800, 500), "temps", "infectés courant");
  plot_TxCroissance = new Plot(this, new PVector(1575, 500), "temps", "croissance");
  
  plot_TxCroissance.setYLim(1, 1.5);
  
  contagiositeSlider = new Slider(new PVector(530, 100), 200, 30, 0, 0.3, "contagiosité", 25);
  tauxGuerisonSlider = new Slider(new PVector(530, 150), 200, 30, 0, 0.5, "taux de guérison", 25);
  tauxVoyageSlider = new Slider(new PVector(530, 200), 200, 30, 0, 1, "taux de voyage", 25);
  
  contagiositeSlider.setValue(0.01);
  tauxGuerisonSlider.setValue(0.01);
  tauxVoyageSlider.setValue(0.5);
}

void draw()
{
  background(0);
  
  contagiositeSlider.display();
  tauxGuerisonSlider.display();
  tauxVoyageSlider.display();
  
  if(logscale)
  {
    minLim = 0.01;
  }else
  {
    minLim = 0;
  }
  
  if(!finished)
  {
    gU.updateParams(contagiositeSlider.getValue(), tauxGuerisonSlider.getValue(), tauxVoyageSlider.getValue());
    grid = gU.update(grid);
    plot_NTotalInfectes.addPoint(time, gU.totalInfected);
    plot_NTotalInfectes.setXLim(minLim, time);
    
    plot_NCurrentInfectes.addPoint(time, gU.currentInfected);
    plot_NCurrentInfectes.setXLim(minLim, time);
    
    plot_TxCroissance.addPoint(time, gU.txCroissance);
    plot_TxCroissance.setXLim(minLim, time);
  }
  
  gD.display(grid);
  
  plot_NTotalInfectes.display();
  plot_NCurrentInfectes.display();
  plot_TxCroissance.display();
  
  time++;
  
  plot_NTotalInfectes.setYLim(minLim, gU.totalInfected);
  plot_NCurrentInfectes.setYLim(minLim, gU.maxCurrentInfected);
  if((gU.currentInfected <= 10000) && (gU.totalInfected >= carres_number*carres_number))
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

void mousePressed()
{
  contagiositeSlider.mousePressed_class(mouseX);
  tauxGuerisonSlider.mousePressed_class(mouseX);
  tauxVoyageSlider.mousePressed_class(mouseX);
}
  
void mouseDragged()
{
  contagiositeSlider.mouseDragged_class(mouseX);
  tauxGuerisonSlider.mouseDragged_class(mouseX);
  tauxVoyageSlider.mouseDragged_class(mouseX);  
}

void mouseReleased()
{
  contagiositeSlider.mouseReleased_class();
  tauxGuerisonSlider.mouseReleased_class();
   tauxVoyageSlider.mouseReleased_class();   
}
