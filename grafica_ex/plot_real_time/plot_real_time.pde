import grafica.*;

GPlot plot;

float x = 0;
float load = 0;

void setup() {
  size(800, 800);
  background(150);

  // Prepare the points for the plot
  int nPoints = 100;
  GPointsArray points = new GPointsArray(nPoints);

  for (int i = 0; i < nPoints; i++) {
    points.add(i, 10*noise(0.1*i));
  }

  // Create a new plot and set its position on the screen
  plot = new GPlot(this);
  plot.setPos(25, 25);
  plot.setDim(600, 400);
  
  plot.setXLim(0, 10);
  plot.setYLim(0, 10);

  // Set the plot title and the axis labels
  plot.getXAxis().setAxisLabelText("x axis");
  plot.getYAxis().setAxisLabelText("y axis");
  
  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
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
  
  float[] ticks = plot.getYAxis().getTicks();
  float[] newTicks = new float[ticks.length-1];
  arrayCopy(ticks, 1, newTicks, 0, newTicks.length);
  plot.getYAxis().setTicks(newTicks);
  
  //String[] ticksLabels = {"heyy", "bonjour", "bonjour", "bonjour", "bonjour"}; pour set le label des graduations (ie : remplacer chiffres par dates en abcisses)
  //plot.getYAxis().setTickLabels(ticksLabels);
  
  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  plot.getXAxis().setLineColor(255);
  plot.getXAxis().setLineWidth(3);
  plot.getXAxis().setFontColor(255);
  plot.getXAxis().setFontName("cmunrm.ttf");
  plot.getXAxis().setFontSize(20);
  
  plot.getXAxis().getAxisLabel().setFontColor(255);
  plot.getXAxis().getAxisLabel().setFontSize(40);
  plot.getXAxis().getAxisLabel().setFontName("cmunrm.ttf");
  
  plot.getXAxis().setNTicks(5); //nombre de graduations
  plot.getXAxis().setTickLength(0); // graduations ou pas ?
  plot.getXAxis().setRotateTickLabels(false); // rotate les graduations ?
  plot.getXAxis().setTickLabelOffset(7); //distance graduations de l'axis
  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  
  
  // Add the points
  //plot.setPoints(points);
  plot.setPointSize(10);
  plot.setPointColor(255);
  
  plot.setLineColor(255);
  plot.setLineWidth(3);
  

  // Draw it!
  plot.beginDraw();
  plot.setAxesOffset(0);
  //plot.drawBackground();
  //plot.drawBox();
  plot.drawXAxis();
  plot.drawYAxis();
  //plot.drawTopAxis();
  //plot.drawRightAxis();
  plot.drawTitle();
  plot.drawPoints();
  plot.drawLines();
  
  plot.endDraw();
  
  // A VOIR : 
  //plot.activatePanning();
  //plot1.activateZooming(1.2, CENTER, CENTER);
  //plot1.activatePointLabels();
  //plot2.activateZooming(1.5);
  //plot3.activateCentering(LEFT, GPlot.CTRLMOD);
  //plot4.activateZooming();
  
  // + setLogScale
  
  //possible de faire : setBgColor(int color)
  // setBoxBgColor(int color)
  // setBoxLineColor(int color)
  
  // setLabelBgColor(int color)
  // setFontColor, setFontSize : ne marche pas
  }
  
void draw()
{
  background(150);
  plot.beginDraw();
  plot.setAxesOffset(0);
  plot.drawXAxis();
  plot.drawYAxis();
  plot.drawTitle();
  plot.drawPoints();
  plot.drawLines();
  
  plot.endDraw();
  
  x += 1/180.0;
  load += random(1)/180.0;
  
  plot.addPoint(x, load); 
}
