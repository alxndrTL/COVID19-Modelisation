void setup()
{
  Table table = loadTable("france.csv", "header");
  table.setColumnType("Date", Table.STRING);
  table.setColumnType("Infectes", Table.INT);  
  
  // Save the data in two GPointsArrays
  //GPointsArray pointsOktoberfest = new GPointsArray();
  //GPointsArray pointsElections = new GPointsArray();
  
  int rowNumber = table.getRowCount();
  
  String[] xTicksLabels = new String[rowNumber];

  for (int row = 0; row < rowNumber; row++) {
    String date = table.getString(row, "Date");
    int infected = table.getInt(row, "Infectes");
    
    //println(date, infected);
    
    float x = map(row, 0, rowNumber, 0, 1);
    float y = infected;
    xTicksLabels[row] = date;
    
    //println(x, y);
    
    //pointsOktoberfest.add(date, oktoberfestCount, monthNames[month]);
    //pointsElections.add(date, electionsCount, monthNames[month]);
  }
}
