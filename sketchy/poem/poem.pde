/*
Claire Luikart
 ciluikart@gmail.com
 1/17/2022
 */


float startTime = 0;
verse[] poem;

void setup() {
  size(1024, 768);
  setup_();
}

void setup_() {
  background(0);
  startTime = millis();
  int[] co = {25, 255, 105};
  verse[] p = 
  {
    new verse("this", 10, 40, 2, 30, co),
    new verse("is"  , 50, 55, 4, 20, co),
    new verse("a...", 65, 75, 6, 50, co),
    new verse("test", 80, 15, 8, 80, co)
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

  // drawCenter();
  // drawGrid();

  strokeWeight(1);
  stroke(0, 0, 0, 128);

  drawTxt();
}

void drawTxt() {
  float timeElapse = (millis() - startTime)/1000;

  for (int i = 0; i < poem.length; i++) {
    if (!poem[i].drawn && !poem[i].clickToProgress && poem[i].startDelay <= timeElapse) {
      textSize(poem[i].fontSize);
      text(poem[i].words, poem[i].posX, poem[i].posY);
      poem[i].updatePos();
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
  int posX;
  int posY;
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
    endDelay = 10;
    R = col[0];
    G = col[1];
    B = col[2];
    vx = 0;
    vy = 1;
  }
  
  void updatePos(){
   posX += vx;
   posY += vy; 
  }

}
