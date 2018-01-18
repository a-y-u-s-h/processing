PImage monalisa; 
int factor = 1;

void setup() {
  size(1260, 396);
  monalisa = loadImage("1.jpg");
  monalisa.resize(630, 396);
  image(monalisa, 0, 0);
  monalisa.filter(GRAY);
}

int index(int x, int y) {
  return x + y * monalisa.width;
}

void draw() {
  monalisa.loadPixels();
  for (int y = 0; y < monalisa.height-1; y++) {
    for (int x = 1; x < monalisa.width-1; x++) {
      color pix = monalisa.pixels[index(x, y)];
      float oldR = red(pix);
      float oldG = green(pix);
      float oldB = blue(pix);
      int newR = round(factor * oldR / 255) * (255 /factor);
      int newG = round(factor * oldG / 255) * (255 /factor);
      int newB = round(factor * oldB / 255) * (255 /factor);
      monalisa.pixels[index(x, y)] = color(newR, newG, newB);

      float errR = oldR - newR;
      float errG = oldG - newG;
      float errB = oldB - newB;


      int index = index(x+1, y);
      color c = monalisa.pixels[index];
      float r = red(c);
      float g = green(c);
      float b = blue(c);
      r = r + errR * 7/16.0;
      g = g + errG * 7/16.0;
      b = b + errB * 7/16.0;
      monalisa.pixels[index] = color(r, g, b);

      index = index(x-1, y+1);
      c = monalisa.pixels[index];
      r = red(c);
      g = green(c);
      b = blue(c);
      r = r + errR * 3/16.0;
      g = g + errG * 3/16.0;
      b = b + errB * 3/16.0;
      monalisa.pixels[index] = color(r, g, b);

      index = index(x, y+1);
      c = monalisa.pixels[index];
      r = red(c);
      g = green(c);
      b = blue(c);
      r = r + errR * 5/16.0;
      g = g + errG * 5/16.0;
      b = b + errB * 5/16.0;
      monalisa.pixels[index] = color(r, g, b);


      index = index(x+1, y+1);
      c = monalisa.pixels[index];
      r = red(c);
      g = green(c);
      b = blue(c);
      r = r + errR * 1/16.0;
      g = g + errG * 1/16.0;
      b = b + errB * 1/16.0;
      monalisa.pixels[index] = color(r, g, b);
    }
  }
  monalisa.updatePixels();
  image(monalisa, width * 0.5, 0);
}
