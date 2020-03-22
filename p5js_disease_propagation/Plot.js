class Plot
{
  constructor(parent, pos, xLabel, yLabel)
  {
    this.plot = new GPlot(parent);
    this.plot.setPos(pos.x, pos.y);
    this.plot.setDim(600, 400);

    this.plot.getXAxis().setAxisLabelText(xLabel);
    this.plot.getYAxis().setAxisLabelText(yLabel);
    this.plot.getYAxis().getAxisLabel().setOffset(60);

    //plot.getYAxis().setOffset(-5);
    this.plot.getYAxis().setLineColor(255);
    this.plot.getYAxis().setLineWidth(3);
    this.plot.getYAxis().setFontColor(255);
    this.plot.getYAxis().setFontName("cmunrm.ttf");
    this.plot.getYAxis().setFontSize(20);

    this.plot.getYAxis().getAxisLabel().setFontColor(255);
    this.plot.getYAxis().getAxisLabel().setFontSize(40);
    this.plot.getYAxis().getAxisLabel().setFontName("cmunrm.ttf");

    this.plot.getYAxis().setNTicks(5); //nombre de graduations
    this.plot.getYAxis().setTickLength(0); // graduations (traits) ou pas ?
    this.plot.getYAxis().setRotateTickLabels(false); // rotate les graduations ?
    this.plot.getYAxis().setTickLabelOffset(7); //distance graduations de l'axis

    this.plot.getXAxis().setLineColor(255);
    this.plot.getXAxis().setLineWidth(3);
    this.plot.getXAxis().setFontColor(255);
    this.plot.getXAxis().setFontName("cmunrm.ttf");
    this.plot.getXAxis().setFontSize(20);

    this.plot.getXAxis().getAxisLabel().setFontColor(255);
    this.plot.getXAxis().getAxisLabel().setFontSize(40);
    this.plot.getXAxis().getAxisLabel().setFontName("cmunrm.ttf");

    this.plot.getXAxis().setNTicks(5); //nombre de graduations
    this.plot.getXAxis().setTickLength(0); // graduations (traits) ou pas ?
    this.plot.getXAxis().setRotateTickLabels(false); // rotate les graduations ?
    this.plot.getXAxis().setTickLabelOffset(7); //distance graduations de l'axis

    this.plot.setPointSize(5);
    this.plot.setPointColor(255);

    this.plot.setLineColor(255);
    this.plot.setLineWidth(3);
  }

  display()
  {
    this.plot.beginDraw();
    this.plot.setAxesOffset(0);
    this.plot.drawXAxis();
    this.plot.drawYAxis();
    this.plot.drawPoints();
    this.plot.drawLines();
    this.plot.endDraw();
  }

  addPoint(x, y)
  {
    this.plot.addPoint(x, y);
  }

  setXLim(min, max)
  {
    this.plot.setXLim(min, max);
  }

  setYLim(min, max)
  {
    this.plot.setYLim(min, max);
  }

  setLogScale(logType)
  {
    this.plot.setLogScale(logType);
  }

  setXAxisLabel(label)
  {
    this.plot.getXAxis().setAxisLabelText(label);
  }

  setYAxisLabel(label)
  {
    this.plot.getYAxis().setAxisLabelText(label);
  }
}
