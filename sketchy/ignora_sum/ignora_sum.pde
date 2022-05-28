/*
Claire Luikart
 ciluikart@gmail.com
 1/17/2022
 */


float startTime = 0;
verse[] poem;
float X = width/2;
float Y = height/2;
float rad = 10; 
float vX = 5; 
float vY = 5;

void setup() {
  size(800, 450);
  setup_();
}

void setup_() {
  background(0);
  startTime = millis();
  int[] co = {255, 255, 255};
  int font = 25;

  int timeScale = 5;
  verse[] p =
    {
    new verse("keep chained the beast of ignorance lest it devour your sanity", 10, (2*font), 0*timeScale, font, co),
    new verse("tethering not your identity to your intellectual self ", 30, (3*font), 1*timeScale, font, co),
    new verse("for They will rip it away as jetsam", 30, (4*font), 2*timeScale, font, co),
    new verse("irrelevant–", 30, (5*font), 3*timeScale, font, co),
    new verse("inconvenient to Their cause–  ", 50, (6*font), 4*timeScale, font, co),
    new verse("when flawed but pressing reason gives way to raw", 30, (7*font), 5*timeScale, font, co),
    new verse("untethered human hatred incarnate", 30, (8*font), 6*timeScale, font, co),
    new verse("I can no longer find the strength I once could", 30, (9*font), 7*timeScale, font, co),
    new verse("in the potential for better futures", 30, (10*font), 8*timeScale, font, co),
    new verse("I can’t when too soon ago true ", 30, (11*font), 9*timeScale, font, co),
    new verse("unempathetic faces crooned ", 30, (12*font), 10*timeScale, font, co),
    new verse("their necks broken and shattered to stare", 30, (13*font), 11*timeScale, font, co),
    new verse("And threw such slander to my unwavering question.", 80, (14*font), 12*timeScale, font, co)
  };

  poem = p;

  noStroke();
}

void keyReleased() {

  for ( int i = 0; i < poem.length; i++) {
    float curSec = (millis()/1000);
    if (poem[i].clickToProgress) {
      println("here");
      poem[i].clickToProgress = false;
      poem[i].startDelay = 0;
      poem[i].endDelay += curSec;
      break;
    }
  }

  if (key == CODED) {
    if (keyCode == UP) {
    } else if (keyCode == DOWN ) {
    } else if (keyCode == LEFT) {
    } else if (keyCode == RIGHT) {
    }
  } else if (key == RETURN || key == ENTER) {
  }
}

void draw() {
  filter(BLUR);
 if(X-rad<0 || X+rad>width){
    vX = -1*vX;
  }
  if(Y-rad<0 || Y+rad>height){
    vY = -1*vY;
  }
fill(255);
  ellipse(X,Y, 50,50);
  X+=vX;
  Y+=vY;
  
 
  strokeWeight(1);
  stroke(0, 0, 0, 128);

  drawTxt();
}

void drawTxt() {
  float timeElapse = (millis() - startTime)/1000;

  for (int i = 0; i < poem.length; i++) {
    if (!poem[i].drawn && !poem[i].clickToProgress && poem[i].startDelay <= timeElapse) {
      textSize(poem[i].fontSize);
      fill(255,255,255);
      text(poem[i].words, poem[i].posX, poem[i].posY);
            fill(255,255,255);
      text(poem[i].words, poem[i].posX+2, poem[i].posY+2);
      fill(0,0,0);
      text(poem[i].words, poem[i].posX+1, poem[i].posY+1);
      poem[i].updatePos();
      poem[i].updateColor();
    }
    if (poem[i].startDelay + poem[i].endDelay < timeElapse) {
      poem[i].drawn = true;
    }
  }
}

void drawGrid()
{
}
void drawCenter()
{
}
void loop()
{
}


class verse {
  String words;
  float posX;
  float posY;
  int fontSize;
  int R, G, B;
  float vx, vy;
  int startDelay, endDelay;
  boolean clickToProgress;
  boolean drawn;

  public verse(String w, int x, int y, int delay, int fSize, int[] col) {
    words = w;
    posX = x;
    posY = y;
    fontSize = fSize;
    clickToProgress = false;
    drawn = false;
    startDelay = delay;
    endDelay =10;
    R = col[0];
    G = col[1];
    B = col[2];
    vx = 0;
    vy = 0;
  }

  void updatePos() {
    posX += vx;
    posY += vy;
  }

  void updateColor() {
    if (R>=50) {
      R--;
      G--;
      B--;
    }
  }
}
