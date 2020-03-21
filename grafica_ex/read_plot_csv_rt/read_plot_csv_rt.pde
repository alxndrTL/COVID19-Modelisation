import grafica.*;

Plot plot;

int grad_spacing = 2; //3 pour Chine, 1 pour France

int draws_counter = 0;

int rowNumber;
int[] y_infected;

void setup()
{
  size(1500, 1200);
  //fullScreen();
  
  background(0);
  frameRate(10);
  
  Table table = loadTable("italie_20.csv", "header");
  table.setColumnType("Date", Table.STRING);
  table.setColumnType("Infectes", Table.INT);  
  
  rowNumber = table.getRowCount();
  
  String[] xTicksLabels = new String[ceil(rowNumber/float(grad_spacing))];
  y_infected = new int[rowNumber];

  for(int row = 0; row < rowNumber; row++) {
    String date = table.getString(row, "Date");
    int infected = table.getInt(row, "Infectes");
    
    if(row%grad_spacing==0)
    {
      xTicksLabels[row/grad_spacing] = date.substring(0, 5);
    }
    
    y_infected[row] = infected;
  }
  
  GPointsArray points = new GPointsArray(xTicksLabels.length);
  
  for (int i = 0; i < rowNumber; i++)
  {
    points.add(i, y_infected[i]);
  }
  
  plot = new Plot(this, new PVector(width/2-650, height/2-350), "temps", "infectés", rowNumber, xTicksLabels.length);
  plot.plot.getXAxis().setTickLabels(xTicksLabels);
  plot.setYLim(0, 50000); //84000 pour la Chine, 13000 pour la France, 50000 pour l'Italie
  
  //plot.plot.setPoints(points);
  //plot.display();
  
}

void draw()
{
  background(0);
  
  plot.display();
  
  if(draws_counter < rowNumber)
  {
    plot.addPoint(draws_counter, y_infected[draws_counter]);
  }
  
  draws_counter++;
}
