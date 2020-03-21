import grafica.*;

class Plot
{
  GPlot plot;
  
  Plot(PApplet parent, PVector pos, String xLabel, String yLabel)
  {
    plot = new GPlot(parent);
    plot.setPos(pos.x, pos.y);
    plot.setDim(600, 400);
  
    // Set the plot title and the axis labels
    plot.getXAxis().setAxisLabelText(xLabel);
    plot.getYAxis().setAxisLabelText(yLabel);
    plot.getYAxis().getAxisLabel().setOffset(60);
    
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
    
    plot.setPointSize(5);
    plot.setPointColor(255);
    
    plot.setLineColor(255);
    plot.setLineWidth(3);
  }
  
  void display()
  {
    plot.beginDraw();
    plot.setAxesOffset(0);
    plot.drawXAxis();
    plot.drawYAxis();
    plot.drawPoints();
    plot.drawLines();
    plot.endDraw();
  }
  
  void addPoint(float x, float y)
  {
    plot.addPoint(x, y);
  }
  
  void setXLim(float min, float max)
  {
    plot.setXLim(min, max);
  }
  
  void setYLim(float min, float max)
  {
    plot.setYLim(min, max);
  }
  
  void setLogScale(String logType)
  {
    plot.setLogScale(logType);
  }
  
  void setXAxisLabel(String label)
  {
    plot.getXAxis().setAxisLabelText(label);
  }
  
  void setYAxisLabel(String label)
  {
    plot.getYAxis().setAxisLabelText(label);
  }
}
