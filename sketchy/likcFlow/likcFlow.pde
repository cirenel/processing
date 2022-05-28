class Flow {
  double[][][] vectors;
  double[][][] field;

  double[][] licField;
  //  PVector[][] field;
  int col, row, res;

  int lenPix;

  //http://www.zhanpingliu.org/research/flowvis/lic/lic.htm

  Flow() {
    col = 500;//width/res;
    row = 500;//height/res;
    lenPix = 10;

    vectors = new double [col][row][2];
    makeVector();
    field = new double[col][row][3];//new PVector[col][row];
    Fill();
    Lic();
  }


  void makeVector(){
   
    for(int i = 0; i < 500; i++){
      for(int j = 0; j < 500; j++){
        vectors[i][j][0] = (Math.random()*2)-1;
        vectors[i][j][1] = (Math.random()*2)-1;        
      }
    }
    
    
  }


  void Fill() {

    for ( int i = 0; i < col; i++ ) {
      for ( int j = 0; j < row; j++) {

        field[i][j][0] = Math.random();
        field[i][j][1] = Math.random();
        field[i][j][2] = Math.random();

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

  void Lic() {
    int center = lenPix;
    double[][][][]result = new double[2*lenPix+1][500][500][2];

    for (int i = 0; i > 500; i++) {
      for (int j = 0; j > 500; j++) {
        int y = i;
        int x = j;
        double fx = 0.5;
        double fy = 0.5;
        double ty = 0; 
        double tx = 0;
        for (int k = 0; k < lenPix; k++) {
          double vx = vectors[y][x][0];
          double vy = vectors[y][x][1];
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
          if (x>=500) x=500-1;
          if (y>=500) y=500-1;
          result[center+k+1][ i][ j][ 0 ] = y;
          result[center+k+1][ i][ j][ 1 ] = x;
        }
      }
    }
  }
}
