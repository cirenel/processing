float maxradius = 20;
float radius = 10;
circ[] dots;
int NUMDOTS = 500;
float maxspeed = 50;
float vx=0;
float vy = 0;
int ctrack = 0;
int[][] colors =
  {{13, 8, 135},
  {51, 5, 151},
  {80, 2, 162},
  {106, 0, 168},
  {132, 5, 167},
  {156, 23, 158},
  {177, 42, 144},
  {195, 61, 128},
  {211, 81, 113},
  {225, 100, 98},
  {237, 121, 83},
  {246, 143, 68},
  {252, 166, 54},
  {254, 192, 41},
  {249, 220, 36},
  {240, 249, 33}};

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
    dots[i] = new circ(radius);
  }
  noStroke();
}

void keyReleased() {
  if (key == CODED) {
    println("VX: "+vx+"\nVY: "+vy+"\n");
    if (keyCode == UP && vy >= -1*maxspeed) {
      vy= vy-1;
    } else if (keyCode == DOWN && vy <= maxspeed) {
      vy = vy + 1;
    } else if (keyCode == LEFT && vx >= -1*maxspeed) {
      vx = vx -1 ;
    } else if (keyCode == RIGHT && vx <= maxspeed) {
      vx = vx +1 ;
    }
  }
}

void draw() {
  filter(BLUR);

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



  for (int i = 0; i< NUMDOTS; i++) {
    if (dots[i].r < maxradius ) {
      if (Math.random() > 0.5)
        dots[i].r += (int)(Math.random() * 2);
      else
        dots[i].r -= (int)(Math.random() * 2);
    }

    if (dots[i].r > maxradius) dots[i].r = maxradius;
    if (dots[i].r < 0) dots[i].r = radius;

    fill(dots[i].R, dots[i].G, dots[i].B);
    ellipse(dots[i].posX, dots[i].posY, dots[i].r, dots[i].r);

    dots[i].R += (int)Math.round((2*Math.random())-(2*Math.random()));
    dots[i].G += (int)Math.round((2*Math.random())-(2*Math.random()));
    dots[i].B += (int)Math.round((2*Math.random())-(2*Math.random()));

    if (dots[i].posX >= width || dots[i].posX <= 0) {
      dots[i] = new circ(radius);
    } else if (Math.random()>=0.9) {
      dots[i].posX -= vx ;
    } else {
      dots[i].posX += vx;
    }

    if (dots[i].posY >= height || dots[i].posY <= 0) {
      dots[i] = new circ(radius);
    } else if (Math.random()>=0.9) {
      dots[i].posX -= vy ;
    } else {
      dots[i].posY += vy;
    }
  }
  
  drawCenter();

  
  strokeWeight(1);
  stroke(0,0,0);
}


void drawCenter(){
    stroke(colors[ctrack][0],colors[ctrack][1],colors[ctrack][2], 128);
  strokeWeight(5);
  fill(0,0,0,64);
  ellipse((int)(width/2),(int)(height/2),100*vx,100*vy);
  if(ctrack >= colors.length - 1){
    ctrack = 0;
  } else {
    ctrack++;
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
  public circ(float radius) {
    posX = (int)(Math.random()*width);
    posY = (int)(Math.random()*height);
    r = radius;
    vx = 0; //(float)((Math.random()*maxspeed) - (maxspeed/2));
    vy = 0; //(float)((Math.random()*maxspeed) - (maxspeed/2));

    int[] c = colors[(int)(Math.random() * colors.length)];

    R= c[0];//(int)(Math.random()*255);
    G= c[1];//(int)(Math.random()*255);
    B= c[2];//(int)(Math.random()*255);
  }
}
