let width_num = 10;
let height_num = 10;
let grid;
let gD;
let gU;

let plot_totalInfectes;
let plot_currentInfectes;

let minLim = 0;

let time = 0;
let enPause = false;
let boolDrawPauseOverlay = false;
let retroFont;

function preload()
{
  retroFont = loadFont('assets/Retro-Gaming.ttf');
}

function setup()
{
  createCanvas(windowWidth, windowHeight);

  gU = new GridUpdater();
  gD = new GridDisplayer(new p5.Vector(0, 0), 100, 100, width_num, height_num);
  grid = generateInitialGrid(width_num, height_num);

  plot_totalInfectes = new Plot(this, new p5.Vector(width/3-300, 200), "temps", "infectés");
  plot_currentInfectes = new Plot(this, new p5.Vector(width/3*2-300, 200), "temps", "infectés courant");
}

function draw()
{
  background(0);

  //TODO : display sliders

if(!enPause)
{
  iterate();
}

  gD.display(grid);
  plot_totalInfectes.display();
  plot_currentInfectes.display();

  if(boolDrawPauseOverlay)
  {
    drawPauseOverlay();
  }
}

function iterate()
{
  //TODO : update params from sliders to gU
  grid = gU.update(grid);

  plot_totalInfectes.addPoint(time, gU.totalInfected);
  plot_totalInfectes.setXLim(minLim, time);
  plot_totalInfectes.setYLim(minLim, gU.totalInfected);

  plot_currentInfectes.addPoint(time, gU.currentInfected);
  plot_currentInfectes.setXLim(minLim, time);
  plot_currentInfectes.setYLim(minLim, gU.maxCurrentInfected);

  time++;
}

function drawPauseOverlay()
{
  fill(0);
  rect(width/2-295, 500-100, 590, 200);

  fill(255);
  textSize(200);
  textFont(retroFont);
  text("PAUSE", width/2-295, 500-100, 590, 200);
}

function generateInitialGrid(width_num, height_num)
{
  let newGrid = [];

  for (var i = 0; i < height_num; i++) {
    newGrid[i] = [];
    for (var j = 0; j < width_num; j++) {
      newGrid[i][j] = new Cell(0);
    }
  }

  let row = round(random(0.25*float(height_num), 0.75*float(height_num))); //make sure the starting point is in the center of the CA
  let col = round(random(0.25*float(width_num)/4, 0.75*float(width_num)));
  newGrid[row][col].state = 1;
  gU.currentInfected++;
  gU.totalInfected ++;

  return newGrid;
}

function keyPressed()
{
  if(key == ' ')
  {
    if(enPause)
    {
      enPause = false;
      boolDrawPauseOverlay = false;
    }else
    {
      enPause = true;
      boolDrawPauseOverlay = true;
    }
  }

  if((keyCode == RIGHT) && (enPause))
  {
    boolDrawPauseOverlay = false;
    iterate();
  }
}
