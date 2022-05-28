class Flow {
  double[][][] field;
  double[][] licField;
  //  PVector[][] field;
  int col, row, res;

//http://www.zhanpingliu.org/research/flowvis/lic/lic.htm

  Flow() {
    col = 500;//width/res;
    row = 500;//height/res;
    field = new double[col][row][3];//new PVector[col][row];
    Fill();
    Lic();
  }



  void Fill() {
    
    for ( int i = 0; i < col; i++ ) {
      for ( int j = 0; j < row; j++) {

        field[i][j][0] = Math.random();
        field[i][j][1] = Math.random();
        field[i][j][2] = Math.random();

      /*  if (i > 0) {
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
        }*/
      }
    }
  }

  void Lic() {
  }
}
