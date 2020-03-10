import grafica.*;

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
  GPlot plot = new GPlot(this);
  plot.setPos(25, 25);
  plot.setDim(600, 400);
  
  plot.setXLim(0, 10);
  plot.setYLim(0, 10);

  // Set the plot title and the axis labels
  plot.setTitleText("A very simple example");
  plot.getXAxis().setAxisLabelText("x axis");
  plot.getYAxis().setAxisLabelText("y axis");
  
  //plot.getYAxis().setOffset(-5);
  plot.getYAxis().setLineColor(255);
  plot.getYAxis().setLineWidth(3);
  plot.getYAxis().setFontColor(255);
  
  plot.getYAxis().getAxisLabel().setFontColor(255);
  plot.getYAxis().getAxisLabel().setFontSize(40);
  
  
  // Add the points
  plot.setPoints(points);
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
