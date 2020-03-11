import grafica.*;

Slider slider_L;
Slider slider_k;
Slider slider_x0;

GPlot plot;

void setup()
{
  size(800, 800);
  
  slider_L = new Slider(new PVector(10, 20), 100, 10, 0, 100, "N", 25); // TODO nom des variables here
  slider_k = new Slider(new PVector(10, 60), 100, 10, 0, 5, "k", 25);
  slider_x0 = new Slider(new PVector(10, 100), 100, 10, 0, 20, "x0", 25);
  
  plot = new GPlot(this);
  plot.setPos(25, 200);
  plot.setDim(600, 400);
  
  //plot.setXLim(0, 100);
  //plot.setYLim(0, 50);

  // Set the plot title and the axis labels
  plot.setTitleText("A very simple example");
  plot.getXAxis().setAxisLabelText("x axis");
  plot.getYAxis().setAxisLabelText("y axis");
  
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
  plot.getYAxis().setTickLength(0); // graduations ou pas ?
  plot.getYAxis().setRotateTickLabels(false); // rotate les graduations ?
  plot.getYAxis().setTickLabelOffset(7); //distance graduations de l'axis
  
  // Add the points
  //plot.setPoints(points);
  plot.setPointSize(10);
  plot.setPointColor(255);
  
  plot.setLineColor(255);
  plot.setLineWidth(3);
  
  plot.beginDraw();
  plot.setAxesOffset(0);
  plot.drawXAxis();
  plot.drawYAxis();
  plot.drawTitle();
  plot.drawPoints();
  plot.drawLines();
  
  plot.endDraw();
}

void draw()
{
  background(220);
  
  slider_L.display();
  slider_k.display();
  slider_x0.display();
  
  int nPoints = 100;
  GPointsArray points = new GPointsArray(nPoints);

  for (int i = 0; i < nPoints; i++)
  {
    points.add(i, slider_L.getValue() / (1 + exp(-slider_k.getValue()* (i - slider_x0.getValue()))));
  }
  
  plot.setPoints(points);
  
  plot.beginDraw();
  plot.setAxesOffset(0);
  plot.drawXAxis();
  plot.drawYAxis();
  plot.drawTitle();
  plot.drawPoints();
  plot.drawLines();
  plot.endDraw();
}

void mousePressed()
{
  slider_L.mousePressed_class(mouseX);
  slider_k.mousePressed_class(mouseX);
  slider_x0.mousePressed_class(mouseX);
}
  
void mouseDragged()
{
  slider_L.mouseDragged_class(mouseX);
  slider_k.mouseDragged_class(mouseX);
  slider_x0.mouseDragged_class(mouseX);
}

void mouseReleased()
{
   slider_L.mouseReleased_class();
   slider_k.mouseReleased_class();
   slider_x0.mouseReleased_class();
}
