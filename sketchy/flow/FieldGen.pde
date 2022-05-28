int  offset = 200;
int maxline = 200;
int minline = 10;

void setup() {
  size(500, 500);
  setup_();
}

void setup_() {
  background(0);

  noStroke();
}

int genRand(int min, int max) {
  return (int)( Math.random() * (max-min) + min);
}

//https://processing.org/examples/lineargradient.html

void draw() {

  int xmin = -offset;
  int xmax = width+offset;
  int ymin = -offset;
  int ymax = height+offset;
  int numLine = genRand(minline, maxline);
  
  for (int i = 0; i < numLine; i++ ) {

    strokeWeight(genRand(1,10));
    stroke(genRand(10, 255), genRand(10, 250));
    fill(0, 0, 0, genRand(25, 125));
    int x1, y1, x2, y2, x3, y3, x4, y4;
    x1 = genRand(xmin, xmax);
    x2 = genRand(xmin, xmax);
    x3 = genRand(xmin, xmax);
    x4 = genRand(xmin, xmax);
    y1 = genRand(ymin, ymax);
    y2 = genRand(ymin, ymax);
    y3 = genRand(ymin, ymax);
    y4 = genRand(ymin, ymax);
    bezier(x1, y1, x2, y2, x3, y3, x4, y4);
  }
  //https://zliu.org/post/weighted-random/
  filter(BLUR, genRand(0,5));



  saveFrame();

  Flow f = new Flow();

  int kernel = 5;

  for (int i = 0; i < 500; i++) {
    for (int j = 0; j < 500; j++) {
      double R = f.field[i][j][0]+get(i, j);
      double G = f.field[i][j][1]+get(i, j);
      double B = f.field[i][j][2]+get(i, j);

      double numPix = 0;
      for (int k = 0; k < kernel; k++) {
        if (i + k < 500) {
          R+=f.field[i+k][j][0]*(kernel - (double)k/kernel);
          G+=f.field[i+k][j][1]*(kernel - (double)k/kernel);
          B+=f.field[i+k][j][2]*(kernel - (double)k/kernel);
          numPix++;
        }
        if (i - k >= 0) {
          R+=f.field[i-k][j][0]*(kernel - (double)k/kernel);
          G+=f.field[i-k][j][1]*(kernel - (double)k/kernel);
          B+=f.field[i-k][j][2]*(kernel - (double)k/kernel);
          numPix++;
        }
        if (j + k < 500) {
          R+=f.field[i][j+k][0]*(kernel - (double)k/kernel);
          G+=f.field[i][j+k][1]*(kernel - (double)k/kernel);
          B+=f.field[i][j+k][2]*(kernel - (double)k/kernel);
          numPix++;
        }
        if (j - k >=0) {
          R+=f.field[i][j-k][0]*(kernel - (double)k/kernel);
          G+=f.field[i][j-k][1]*(kernel - (double)k/kernel);
          B+=f.field[i][j-k][2]*(kernel - (double)k/kernel);
          numPix++;
        }


        if (i + k < 500 && j + k < 500) {
          R+=f.field[i+k][j+k][0]*(kernel - (double)k/kernel)/2;
          G+=f.field[i+k][j+k][1]*(kernel - (double)k/kernel)/2;
          B+=f.field[i+k][j+k][2]*(kernel - (double)k/kernel)/2;
          numPix++;
        }
        if (i + k < 500 && j - k >= 0) {
          R+=f.field[i+k][j-k][0]*(kernel - (double)k/kernel)/2;
          G+=f.field[i+k][j-k][1]*(kernel - (double)k/kernel)/2;
          B+=f.field[i+k][j-k][2]*(kernel - (double)k/kernel)/2;
          numPix++;
        }

        if (i - k >= 0 &&  j + k < 500) {
          R+=f.field[i-k][j+k][0]*(kernel - (double)k/kernel)/2;
          G+=f.field[i-k][j+k][1]*(kernel - (double)k/kernel)/2;
          B+=f.field[i-k][j+k][2]*(kernel - (double)k/kernel)/2;
          numPix++;
        }

        if (i - k >= 0 && j - k >= 0) {
          R+=f.field[i-k][j-k][0]*(kernel - (double)k/kernel)/2;
          G+=f.field[i-k][j-k][1]*(kernel - (double)k/kernel)/2;
          B+=f.field[i-k][j-k][2]*(kernel - (double)k/kernel)/2;
          numPix++;
        }
      }


      double avgR = 255 * (R / numPix / kernel);
      double avgG = 255 * (G / numPix / kernel);
      double avgB = 255 * (B / numPix / kernel);

      color c = color((int)(avgR), (int)(avgG), (int)(avgB));
      //      color c = color((int) (255*f.field[i][j][0]),(int) (255*f.field[i][j][1]),(int) (255*f.field[i][j][2]));
      set(i, j, c);
    }
  }
}

void loop()
{
}
