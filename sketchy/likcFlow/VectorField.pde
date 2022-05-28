PVector[][] vfield;
double[][][] field;
double[][][][]result;
int col = 500;
int row = 500;
int lenPix = 10;

void setup() {

  size(500, 500);
  // makeField();
}

void makeField() {

  vfield = new PVector[width][height];

  float max = 0;
  boolean stopI = false;
  for (int i = col/2 + 1; i < col; i++) {
    boolean stopJ = false;
    for (int j = row/2 + 1; j < row; j++) {
      double x = ((Math.random()*(i*5))-(Math.random()*(i*5)));
      double y = ((Math.random()*(j*5))-(Math.random()*(j*5)));
      double z = ((Math.random()*2)-(Math.random()*2));

      if (vfield[i][j]==null) {
        vfield[i][j] = new PVector((int)(x), (int)(y));
      }
      if (i > 0 && j > 0 && i < col-2 && j < row-2 ) {
        boolean N = (vfield[i][j-1] != null);
        boolean S = (vfield[i][j+1] != null);
        boolean E = (vfield[i+1][j] != null);
        boolean W = (vfield[i-1][j] != null);
        /*println("N     S     E     W");
         println(N+" "+S+" "+E+" "+W);
         println(i+"  "+j);
         */
        if (N && Math.random()>=0.50) {
          vfield[i][j] = new PVector( vfield[i][j].x + (int)(vfield[i][j-1].x ), vfield[i][j].y+(int)(vfield[i][j-1].y+y) );
        } else if (S && Math.random()>=0.50) {

          vfield[i][j] = new PVector(  vfield[i][j].x +(int)(vfield[i][j+1].x), vfield[i][j].y+(int)(vfield[i][j+1].y) );
        } else if (E && Math.random()>=0.50) {
          vfield[i][j] = new PVector(  vfield[i][j].x +(int)(vfield[i+1][j].x), vfield[i][j].y+(int)(vfield[i+1][j].y) );
        } else if (W && Math.random()>=0.50) {
          vfield[i][j] = new PVector(  vfield[i][j].x +(int)(vfield[i-1][j].x), vfield[i][j].y+(int)(vfield[i-1][j].y) );
        } else if (N ) {
          vfield[i][j] = new PVector( vfield[i][j].x -(int)(vfield[i][j-1].x ), vfield[i][j].y-(int)(vfield[i][j-1].y+y) );
        } else if (S ) {

          vfield[i][j] = new PVector(  vfield[i][j].x -(int)(vfield[i][j+1].x), vfield[i][j].y-(int)(vfield[i][j+1].y) );
        } else if (E) {
          vfield[i][j] = new PVector(  vfield[i][j].x -(int)(vfield[i+1][j].x), vfield[i][j].y-(int)(vfield[i+1][j].y) );
        } else if (W) {
          vfield[i][j] = new PVector(  vfield[i][j].x -(int)(vfield[i-1][j].x), vfield[i][j].y-(int)(vfield[i-1][j].y) );
        }

        if (vfield[i][j].mag() > max) {
          max = vfield[i][j].mag();
        }

        if (vfield[j][i] == null) {
          vfield[j][i] = new PVector(-1*vfield[i][j].x, -1*vfield[i][j].y);
        }
        // vfield[i][j].normalize();
        // println(vfield[i][j]);
      }
      if (j == row-1 && !stopJ) {
        j = -1;
        stopJ = true;
      } else if (j == row-1 && stopJ) {
        stopJ=false;
        break;
      }
    }
    if (i== col-1 && !stopI) {
      i = -1;
      stopI = true;
    } else if (i== col-1 && stopI) {
      stopI=false;
      break;
    }
  }
  println("MAX "+max);
}



void draw() {
  makeField();
  println("!");
  
  drawVect(true,false, 0, col/2, 5, row/2, row, 10, 100);
  /*for (int i = 0; i < row; i++) {
    for (int j = 0; j < col; j++) {
      // print(i+" "+j);
      int v = (int)Math.abs(vfield[i][j].x%255);
      color cc = color(v, v, v);
      set(i, j, cc);
    }
  }
  saveFrame("xvect");
  for (int i = 0; i < row; i++) {
    for (int j = 0; j < col; j++) {
      int v = (int) vfield[i][j].y%255;
      color cc = color(v, v, v);
      set(i, j, cc);
    }
  }
  saveFrame("yvect");*/
  /*makeStatic();
   Lic();
   double[][] flatRes = new double[col][row];
   flatRes = flatten();
   for (int i = 0; i < row; i++) {
   for (int j = 0; j < col; j++) {
   color c = color((int)(flatRes[i][j]*field[i][j][1]));
   // println(c);
   set(i, j, c);
   }
   }*/
  strokeWeight(2);
  /*
  //  for (int i = row-1; i >=0; i--) {
  //   for (int j = col-1; j >=0; j--) {
  for (int i = 0; i < col/2; i++) {
    for (int j = 0; j <row/2; j++) {
      PVector cur = vfield[col-i-1][row-j-1];
      ;
      cur.sub(vfield[i][j]);
      cur.normalize();
      //  vect.normalize();
      cur.mult(150);

      // translate(i,j);
      //  vfield[i][j].normalize();
      //  vfield[i][j].mult(50);
      stroke((int) vfield[i][j].x%255, (int) vfield[i][j].y%255, (int)(vfield[i][j].y+vfield[i][j].x)%255, 64);


      // line(i,j, vfield[i][j].x, vfield[i][j].y);

      line(i, j, cur.x, cur.y);
      line(col-i-1, row-j-1, cur.x, cur.y);
    }
  }

  for (int i = col/2+1; i >=0; i--) {
    for (int j = row/2+1; j >=0; j--) {
      PVector cur = vfield[col-i-1][row-j-1];
      ;
      cur.sub(vfield[i][j]);
      cur.normalize();
      //  vect.normalize();
      cur.mult(150);

      // translate(i,j);
      //  vfield[i][j].normalize();
      //  vfield[i][j].mult(50);
      stroke((int) vfield[i][j].x%255, (int) vfield[i][j].y%255, (int)(vfield[i][j].y+vfield[i][j].x)%255, 64);


      // line(i,j, vfield[i][j].x, vfield[i][j].y);

      line(i, j, cur.x, cur.y);
      line(col-i-1, row-j-1, cur.x, cur.y);
    }
  }
  for (int i = col-1; i >=col/2; i--) {
    for (int j = row-1; j >=row/2; j--) {
      PVector cur = vfield[i][j];
      ;
      cur.sub(vfield[col-i-1][row-j-1]);
      cur.normalize();
      //  vect.normalize();
      cur.mult(150);

      // translate(i,j);
      //  vfield[i][j].normalize();
      //  vfield[i][j].mult(50);
      stroke((int) vfield[i][j].x%255, (int) vfield[i][j].y%255, (int)(vfield[i][j].y+vfield[i][j].x)%255, 64);


      // line(i,j, vfield[i][j].x, vfield[i][j].y);

      line(i, j, cur.x, cur.y);
      line(col-i-1, row-j-1, cur.x, cur.y);
    }
  }

  for (int j = row-1; j >=row/2; j--) {
    for (int i = col-1; i >=col/2; i--) {
      PVector cur = vfield[i][j];
      ;
      cur.sub(vfield[col-i-1][row-j-1]);
      cur.normalize();
      //  vect.normalize();
      cur.mult(150);

      // translate(i,j);
      //  vfield[i][j].normalize();
      //  vfield[i][j].mult(50);
      stroke((int) vfield[i][j].x%255, (int) vfield[i][j].y%255, (int)(vfield[i][j].y+vfield[i][j].x)%255, 64);


      // line(i,j, vfield[i][j].x, vfield[i][j].y);

      line(i, j, cur.x, cur.y);
      line(col-i-1, row-j-1, cur.x, cur.y);
    }
  }
*/

  saveFrame();
}

void drawVect(boolean dirR, boolean dirC,  int startC, int endC, int offsetC, int startR, int endR, int offsetR, int multi) {

  if (!dirR) offsetR*=-1;
  if (!dirC) offsetC*=-1;

  int c = startC;
  int r = startR;
  while (c!=endC) {
    while (r!=endR) {

      PVector cur = vfield[r][c];
      cur.sub(vfield[col-r-1][row-c-1]);
      cur.normalize();
      cur.mult(multi);

      

      line(r, c, cur.x, cur.y);
      line(col-r-1, row-c-1, cur.x, cur.y);
      

      r+=offsetR;
    }
    c+=offsetC;
    r = startR;
  }
}


double[][] flatten() {
  double[][] ret = new double[col][row];


  for (int i = 0; i < row; i++) {
    for (int j = 0; j < col; j++) {
      double avgX = 0;
      double avgY = 0;
      for (int k = 0; k <2*lenPix+1; k++ ) {
        avgX += result[k][i][j][0];
        avgY += result[k][i][j][1];
      }

      ret[i][j] = (avgY+avgX)/(2*(2*lenPix+1));
    }
  }

  return ret;
}

void Lic() {
  int center = lenPix;
  result = new double[2*lenPix+1][col][row][2];

  for (int i = 0; i < row; i++) {
    for (int j = 0; j < col; j++) {
      int x = i;
      int y = j;
      double fx = 0.5;
      double fy = 0.5;
      double ty = 0;
      double tx = 0;
      for (int k = 0; k < lenPix; k++) {
        double vx = (vfield[x][y]).x;
        double vy = (vfield[x][y]).y;
        //   println(vx+" "+vy);
        //print x, y, vx, vy
        if (vx>=0)
          tx = (1-fx)/vx;
        else
          tx = -fx/vx;
        if (vy>=0)
          ty = (1-fy)/vy;
        else
          ty = -fy/vy;

        if (tx<ty) {
          if (vx>0) {
            x+=1;
            fy+=vy*tx;
            fx=0.;
          } else {
            x-=1;
            fy+=vy*tx;
            fx=1.;
          }
        } else {
          if (vy>0) {
            y+=1;
            fx+=vx*ty;
            fy=0.;
          } else {
            y-=1;
            fx+=vx*ty;
            fy=1.;
          }
        }
        if (x<0) x=0;
        if (y<0) y=0;
        if (x>=col) x=col-1;
        if (y>=row) y=row-1;
        result[center+k+1][i][j][ 0 ] = x;
        result[center+k+1][i][j][ 1 ] = y;
      }
    }
  }
}

void makeStatic() {

  field = new double[col][row][3];
  for ( int i = 0; i < col; i++ ) {
    for ( int j = 0; j < row; j++) {

      field[i][j][0] = Math.random()*255;
      field[i][j][1] = Math.random()*255;
      field[i][j][2] = Math.random()*255;

      if (i > 0) {
        field[i][j][0]+=field[i-1][j][0];
        field[i][j][0]/=2;

        field[i][j][1]+=field[i-1][j][1];
        field[i][j][1]/=2;

        field[i][j][2]+=field[i-1][j][2];
        field[i][j][2]/=2;
      }
      if (j > 0) {
        field[i][j][0]+=field[i][j-1][0];
        field[i][j][0]/=2;

        field[i][j][1]+=field[i][j-1][1];
        field[i][j][1]/=2;

        field[i][j][2]+=field[i][j-1][2];
        field[i][j][2]/=2;
      }
    }
  }
}

void drawRays() {

  background(0);

  PVector mouse = new PVector(mouseX, mouseY);

  for (int i = 0; i <= 1000; i+=10) {
    for (int j = 0; j <= 1000; j+=10) {
      // PVector vect = field[i][j];

      //vect.sub(mouse);

      //  vect.x-=mouse.x;
      //  vect.y-=mouse.y;
      //  vect.normalize();
      //  vect.mult(150);

      // translate(i,j);
      stroke( (i+j)/8 );
      strokeWeight(2);
      line(mouse.x, mouse.y, i, j);
    }
  }
  // filter(BLUR, 4);
}
