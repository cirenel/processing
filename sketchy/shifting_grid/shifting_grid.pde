float maxradius = 20;
circ[] dots;
int NUMDOTS = 20;
float maxspeed = 10; 

void setup() {
  size(1024, 768);
  setup_();
}

void setup_() {
  background(0);
  dots = new circ[NUMDOTS];
  for (int i = 0; i< NUMDOTS; i++) {

    int x = (int)(Math.random()*width);
    int y = (int)(Math.random()*height);
    dots[i] = new circ(x, y, (int)(Math.random()*maxradius));
  }
  noStroke();
}

void draw() {
    if(Math.random() > 0.89){
   saveFrame(); 
  }
  filter(BLUR);
///clear();
  for (int i = 0; i< NUMDOTS; i++) {
    if(dots[i].vx <= maxspeed && dots[i].vx >= -1*maxspeed) dots[i].vx += (float)((Math.random())-0.5)/2;
    if(dots[i].vy <= maxspeed && dots[i].vy >= -1*maxspeed) dots[i].vy += (float)((Math.random())-0.5)/2;
  }
  // background(0);
  for (int i = 0; i< NUMDOTS; i++) {
    fill(dots[i].R, dots[i].G, dots[i].B);
    ellipse(dots[i].posX, dots[i].posY, dots[i].r, dots[i].r);
    fill(dots[i].R+50, dots[i].G+50, dots[i].B+50);    
    ellipse(dots[i].posX, dots[i].posY, dots[i].r-3, dots[i].r-3);
    
    dots[i].r += (float)((Math.random())-0.5);
    
    dots[i].R += (int)Math.round((2*Math.random())-(2*Math.random()));
    dots[i].G += (int)Math.round((2*Math.random())-(2*Math.random()));
    dots[i].B += (int)Math.round((2*Math.random())-(2*Math.random()));
    
    dots[i].posX += dots[i].vx;
    dots[i].posY += dots[i].vy;
    if (dots[i].posY<=0 || dots[i].posY>=height) {
      dots[i].vy = (-1 * dots[i].vy);
    }
    if (dots[i].posX<=0 || dots[i].posX>=width) {
      dots[i].vx = (-1 * dots[i].vx);
    }
  }
}

void loop()
{
  

  
}


class circ {
  int posX;
  int posY;
  float vx, vy;
  int R, G, B;
  float r;
  public circ(int x, int y, float radius) {
    posX = x;
    posY = y;
    r = radius;
    vx = (float)((Math.random()*maxspeed) - (maxspeed/2));
    vy = (float)((Math.random()*maxspeed) - (maxspeed/2));

    R =(int)(Math.random()*255);
    G= (int)(Math.random()*255);
    B= (int)(Math.random()*255);

  }
}
