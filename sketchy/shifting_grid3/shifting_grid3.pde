/*
Claire Luikart
ciluikart@gmail.com 
1/17/2022
*/

float maxradius = 20;
float radius = 10;
circ[] dots;
int NUMDOTS = 500;
float maxspeed = 10;
float vx=0;
float vy = 0;
int ctrack = 0;
float lastKey = 0;
float startTime = 0;
int[][] colors =
  {{0, 0, 4},
  {1, 1, 6},
  {2, 1, 10},
  {2, 2, 14},
  {4, 3, 18},
  {5, 4, 23},
  {7, 5, 27},
  {9, 6, 32},
  {11, 7, 36},
  {13, 8, 41},
  {16, 9, 45},
  {18, 10, 50},
  {21, 11, 55},
  {24, 12, 60},
  {27, 12, 65},
  {30, 12, 70},
  {33, 12, 74},
  {37, 12, 79},
  {40, 11, 83},
  {44, 11, 87},
  {47, 10, 91},
  {51, 10, 94},
  {54, 9, 97},
  {58, 9, 99},
  {61, 9, 101},
  {64, 10, 103},
  {68, 10, 105},
  {71, 11, 106},
  {75, 12, 107},
  {78, 13, 108},
  {81, 14, 108},
  {84, 15, 109},
  {87, 16, 110},
  {91, 17, 110},
  {94, 18, 110},
  {97, 20, 110},
  {100, 21, 110},
  {103, 22, 110},
  {107, 23, 110},
  {110, 24, 110},
  {113, 26, 110},
  {116, 27, 110},
  {119, 28, 109},
  {123, 29, 109},
  {126, 30, 108},
  {129, 31, 108},
  {132, 32, 107},
  {135, 33, 106},
  {139, 35, 106},
  {142, 36, 105},
  {145, 37, 104},
  {148, 38, 103},
  {151, 39, 102},
  {154, 40, 101},
  {158, 42, 99},
  {161, 43, 98},
  {164, 44, 97},
  {167, 45, 95},
  {170, 47, 94},
  {173, 48, 92},
  {176, 49, 91},
  {179, 51, 89},
  {182, 52, 87},
  {185, 54, 86},
  {188, 55, 84},
  {191, 57, 82},
  {194, 59, 80},
  {197, 61, 78},
  {200, 63, 76},
  {203, 65, 74},
  {205, 67, 72},
  {208, 69, 69},
  {210, 71, 67},
  {213, 73, 65},
  {215, 75, 63},
  {218, 78, 60},
  {220, 80, 58},
  {222, 83, 56},
  {225, 85, 53},
  {227, 88, 51},
  {229, 91, 49},
  {231, 94, 46},
  {232, 97, 44},
  {234, 100, 41},
  {236, 103, 39},
  {238, 106, 36},
  {239, 109, 34},
  {241, 112, 31},
  {242, 116, 28},
  {243, 119, 26},
  {244, 122, 23},
  {246, 126, 21},
  {247, 129, 18},
  {247, 133, 15},
  {248, 136, 13},
  {249, 140, 10},
  {250, 144, 8},
  {250, 147, 7},
  {251, 151, 6},
  {251, 155, 6},
  {252, 158, 7},
  {252, 162, 9},
  {252, 166, 11},
  {252, 170, 15},
  {252, 174, 18},
  {252, 178, 22},
  {251, 182, 26},
  {251, 185, 30},
  {251, 189, 35},
  {250, 193, 40},
  {250, 197, 45},
  {249, 201, 50},
  {248, 205, 55},
  {247, 209, 61},
  {246, 213, 66},
  {245, 217, 73},
  {245, 221, 79},
  {244, 225, 86},
  {243, 228, 93},
  {242, 232, 101},
  {241, 236, 109},
  {241, 239, 117},
  {242, 242, 125},
  {243, 245, 134},
  {244, 248, 142},
  {246, 250, 150},
  {249, 252, 157},
  {252, 255, 164}};
/*{{13, 8, 135},  {51, 5, 151},  {80, 2, 162},  {106, 0, 168},  {132, 5, 167},  {156, 23, 158},  {177, 42, 144},  {195, 61, 128},  {211, 81, 113},  {225, 100, 98},  {237, 121, 83},  {246, 143, 68},  {252, 166, 54}, {254, 192, 41},  {249, 220, 36},  {240, 249, 33}};*/

void setup() {
  size(1024, 768);
  setup_();
}

void setup_() {
  background(0);
  startTime = millis(); 
  dots = new circ[NUMDOTS];
  for (int i = 0; i< NUMDOTS; i++) {
    int x = (int)(Math.random()*width);
    int y = (int)(Math.random()*height);
    dots[i] = new circ(radius);
  }
  noStroke();
}

void keyReleased() {
  if (key == CODED) {
    lastKey = millis();
  //  println("VX: "+vx+"\nVY: "+vy+"\n");
    if (keyCode == UP && vy >= -1*maxspeed) {
      vy= vy-1;
    } else if (keyCode == DOWN && vy <= maxspeed) {
      vy = vy + 1;
    } else if (keyCode == LEFT && vx >= -1*maxspeed) {
      vx = vx -1 ;
    } else if (keyCode == RIGHT && vx <= maxspeed) {
      vx = vx +1 ;
    } 
  }else if (key == RETURN || key == ENTER){
      vx = 0;
      vy = 0;
    }
}

void draw() {
  boolean lastInput = (millis() - lastKey)/1000 >= 10;
  


  

//  println((millis() - lastKey)/1000);
  if (lastInput) {
    if (vx < maxspeed || vx > -1*maxspeed) {
      if (Math.random() <= 0.1) {
        vx+=(Math.random());
      } else if (Math.random() >= 0.9) {
        vx-=(Math.random());
      }
    }

    if (vy < maxspeed || vy > -1*maxspeed) {
      if (Math.random() <= 0.1) {
        vy+=(Math.random());
      } else if (Math.random() >= 0.9) {
        vy-=(Math.random());
      }
    }

    if (Math.random() <= 0.1 && Math.random() >= 0.9) {
      vy = -1*vy;
      println("negate vy");
    }

    if (Math.random() <= 0.1 && Math.random() >= 0.9) {
      vx = -1*vx;
      println("negate vx");
    }

    if (Math.random() <= 0.1 && Math.random() >= 0.9) {
      vy = vx;
      println("vy = vx");
    }

    if (Math.random() <= 0.1 && Math.random() >= 0.9) {
      vx = vy;
      println("vx = vy");
    }
  } else {
       filter(BLUR); 
  }

  for (int i = 0; i< NUMDOTS; i++) {
    if (dots[i].r < maxradius ) {
      if (Math.random() > 0.5)
        dots[i].r += (int)(Math.random() * 2);
      else
        dots[i].r -= (int)(Math.random() * 2);
    }

    if (dots[i].r > maxradius) {
      dots[i].r = maxradius;
    }
    if (dots[i].r < radius) {
      dots[i].r = radius;
    }

    fill(dots[i].R, dots[i].G, dots[i].B);
    ellipse(dots[i].posX, dots[i].posY, dots[i].r, dots[i].r);
    point(dots[i].posX, dots[i].posY);

    /* dots[i].R += (int)Math.round((2*Math.random())-(2*Math.random()));
     dots[i].G += (int)Math.round((2*Math.random())-(2*Math.random()));
     dots[i].B += (int)Math.round((2*Math.random())-(2*Math.random()));*/

    if (dots[i].posX >= width || dots[i].posX <= 0) {
      dots[i] = new circ(radius);
    } else if (Math.random()>=0.9 && lastInput) {
      dots[i].posX -= vx ;
    } else {
      dots[i].posX += vx;
    }

    if (dots[i].posY >= height || dots[i].posY <= 0) {
      dots[i] = new circ(radius);
    } else if (Math.random()>=0.9 && lastInput) {
      dots[i].posY -= vy ;
    } else {
      dots[i].posY += vy;
    }
    dots[i].updateColor();
  }

  // drawCenter();

  // drawGrid();


  strokeWeight(1);
  stroke(0, 0, 0, 128);
  
  drawTxt();
}

void drawTxt(){
  float timeElapse = (millis() - startTime)/1000;
  if( timeElapse >= 5 ){
    fill(255);
    textSize(30);
    text("this is a test", 42, 42);
    fill(0);
    textSize(30);
    text("this is a test", 38, 38);
  }
}

void drawGrid() {
  for (int i = 0; i < colors.length; i++) {
    stroke(255, 255, 255, 100);
    strokeWeight(3);

    int factor = ((width/colors.length)*i)%width;
    line(factor, 0, factor, height);  //x1 y1 x2 y2

    factor = ((height/colors.length)*i )%height;
    line(0, factor, width, factor);
  }
}
void drawCenter() {
  stroke(colors[ctrack][0], colors[ctrack][1], colors[ctrack][2], 128);
  strokeWeight(5);
  fill(0, 0, 0, 64);
  ellipse((int)(width/2), (int)(height/2), 100*vx, 100*vy);
  if (ctrack >= colors.length - 1) {
    ctrack = 0;
  } else {
    ctrack++;
  }
}

void loop()
{
}


class line{
  char[] chars; 
  int posX; 
  int posY;
  int fontSize; 
  int R,G,B;
  float vx,vy;
  int secDelay;
  
}

class circ {
  int posX;
  int posY;
  float vx, vy;
  int R, G, B;
  float r;
  public circ(float radius) {
    posX = (int)(Math.random()*width);
    posY = (int)(Math.random()*height);
    r = radius;
    vx = 0; //(float)((Math.random()*maxspeed) - (maxspeed/2));
    vy = 0; //(float)((Math.random()*maxspeed) - (maxspeed/2));

    updateColor();

    //int[] c = colors[(int)(Math.random() * colors.length)];

    // R= c[0];//(int)(Math.random()*255);
    // G= c[1];//(int)(Math.random()*255);
    // B= c[2];//(int)(Math.random()*255);
  }

  void updateColor() {

    int factor = (int)(((float)posY/height)*(colors.length-1));

    /*
      factor = 0;
     while( !(posY <= ((int)((height/colors.length)*factor))%height) && factor < colors.length-1)
     {
     factor++;
     }    println(factor);*/

    factor = colors.length-factor-1;
    if (factor >=0 && factor < colors.length) {
      R = colors[factor][0];
      G = colors[factor][1];
      B = colors[factor][2];
    }
  }
}
