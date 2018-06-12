int n = 10;
float m = 0;
float r = 280;
float a = TWO_PI/(float)n;
int h = 0;
PFont f;

void setup() {
  size(800, 800);
  strokeWeight(0.3);
  colorMode(HSB);
  f = loadFont("Lato-Light-18.vlw");
  textFont(f);
}

void draw() {
  loadPixels();
    for(int i = 0; i < width; i++){
      for(int j = 0; j < height; j++){
        int loc = i + j * width;
        int c = int(240-dist(i, j, 400, 400)*0.1);
        pixels[loc] = color(h, 5, c);
      }
    }
  updatePixels();
  translate(height/2, height/2);
  
  //h = int((2550/n)*m)/10;
  h = 0;
  stroke(h, 10, 25);
  fill(h, 10, 25);
  
  for(int i = 0; i < n; i++) {
    line(r*sin(a*i), r*cos(a*i), r*sin(a*i*m), r*cos(a*i*m));
  }
  
  m = (m + 0.0005) % n;
  
  if (m < 0) {
    m += n;
  }
  
  textAlign(CENTER);
  text(m, 0, 340);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      m += 1;
    }
    if (keyCode == DOWN) {
      m -= 1;
    }
    if (keyCode == RIGHT) {
      n += 1;
      a = TWO_PI/(float)n;
    }
    if (keyCode == LEFT && n > 1) {
      n -= 1;
      a = TWO_PI/(float)n;
    }
  }
}
  