import grafica.*;

Plot plot;
Plot plot_gr;

int grad_spacing = 3; //3 pour Chine, 1 pour France

int draws_counter = 0;

int rowNumber;
int[] y_infected;
float[] y_growthfactor;


void setup()
{
  size(1500, 1200);
  background(0);
  frameRate(10);
  
  Table table = loadTable("chine_16.csv", "header");
  table.setColumnType("Date", Table.STRING);
  table.setColumnType("Infectes", Table.INT);  
  
  rowNumber = table.getRowCount();
  
  String[] xTicksLabels = new String[ceil(rowNumber/float(grad_spacing))];
  y_infected = new int[rowNumber];
  y_growthfactor = new float[rowNumber];

  for(int row = 0; row < rowNumber; row++) {
    String date = table.getString(row, "Date");
    int infected = table.getInt(row, "Infectes");
    float gr = table.getFloat(row, "Croissance");
    
    if(row%grad_spacing==0)
    {
      xTicksLabels[row/grad_spacing] = date.substring(0, 5);
    }
    
    y_infected[row] = infected;
    
    if(!Float.isNaN(gr))
     {
       y_growthfactor[row] = gr; 
     }
  }
  
  GPointsArray points = new GPointsArray(xTicksLabels.length);
  GPointsArray gr_points = new GPointsArray(xTicksLabels.length);
  
  for (int i = 0; i < rowNumber; i++)
  {
    points.add(i, y_infected[i]);
  }
  
  for (int i = 0; i < rowNumber-1; i++)
  {
    gr_points.add(i, y_growthfactor[i]);
  }
  
  plot = new Plot(this, new PVector(50, 10), "temps", "infectés", rowNumber, xTicksLabels.length);
  plot.plot.getXAxis().setTickLabels(xTicksLabels);
  plot.setYLim(0, 84000); //84000 pour la Chine, 6000 pour la France
  
  //plot.plot.setPoints(points);
  //plot.display();
  
  plot_gr = new Plot(this, new PVector(50, 600), "temps", "croissance par jour", rowNumber, xTicksLabels.length);
  plot_gr.plot.getXAxis().setTickLabels(xTicksLabels);
  plot_gr.setYLim(1, 2.5);
  
  //plot_gr.plot.setPoints(gr_points);
  //plot_gr.display();
}

void draw()
{
  background(0);
  
  plot.display();
  plot_gr.display();
  
  if(draws_counter < rowNumber)
  {
    plot.addPoint(draws_counter, y_infected[draws_counter]);
  }
  
  if(draws_counter < rowNumber-1)
  {
    plot_gr.addPoint(draws_counter, y_growthfactor[draws_counter]);
  }
  
  draws_counter++;
}
