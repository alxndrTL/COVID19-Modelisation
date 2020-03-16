import grafica.*;

Plot plot;
Plot plot_gr;

void setup()
{
  size(1500, 1200);
  background(0);
  
  Table table = loadTable("chine_15.csv", "header"); // 53 rows for Chine
  table.setColumnType("Date", Table.STRING);
  table.setColumnType("Infectes", Table.INT);  
  
  int rowNumber = table.getRowCount();
  
  String[] xTicksLabels = new String[rowNumber];
  int[] y_infected = new int[rowNumber];
  float[] y_growthfactor = new float[rowNumber];

  for(int row = 0; row < rowNumber; row++) {
    String date = table.getString(row, "Date");
    int infected = table.getInt(row, "Infectes");
    float gr = table.getFloat(row, "Croissance");
    
    xTicksLabels[row] = date.substring(0, 5);
    y_infected[row] = infected;
    
    if(!Float.isNaN(gr))
     {
       y_growthfactor[row] = gr; 
     }
  }
  
  GPointsArray points = new GPointsArray(xTicksLabels.length);
  GPointsArray gr_points = new GPointsArray(xTicksLabels.length);
  
  for (int i = 0; i < xTicksLabels.length; i++)
  {
    points.add(i, y_infected[i]);
    gr_points.add(i, y_growthfactor[i]);
  }
  
  plot = new Plot(this, new PVector(50, 10), "temps", "infectés");
  plot.plot.getXAxis().setTickLabels(xTicksLabels);
  
  plot.plot.setPoints(points);
  plot.display();
  
  plot_gr = new Plot(this, new PVector(50, 600), "temps", "infectés");
  plot_gr.plot.getXAxis().setTickLabels(xTicksLabels);
  
  plot_gr.plot.setPoints(gr_points);
  plot_gr.display();
}
