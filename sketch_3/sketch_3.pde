int maxIterations = 100;
float maxModulus = 500;

void setup () {
  size(800, 600);
  colorMode(HSB, 255);
}

void draw () {


  loadPixels();
  for ( int x = 0; x < width; x += 1 ) {
    for ( int y = 0; y < height; y += 1 ) {
      int index = x + y * width;

      float a = map(x, 0, width, -2.5, 2);
      float b = map(y, 0, height, -2, 2);

      int n = 0;
      int z = 0;

      float ca = a;
      float cb = b;
      float modulus = 0;
      float red;
      float green;
      float blue;

      while (n < maxIterations) {
        float aa = a * a - b * b;
        float bb = 2 * a * b ;

        a = aa + ca;
        b = bb + cb;
        modulus = abs(aa + bb);

        if (modulus > maxModulus) {
          break;
        }
        n++;
      }

      // Normalize these values first
      red = map(n, 0, maxIterations, 0, 1);
      green = map(n, 0, maxIterations, 0, 1);
      blue = map(n, 0, maxIterations, 0, 1);

      red = map(sqrt(red), 0, 1, 0, 50 + map(red, 0, 100, 0, 100 + 100 * sin(frameCount * 0.1)));
      green = map(sqrt(green), 0, 1, 0, 150 + map(blue, 0, 100, 0, 35 + 25 * cos(frameCount * 0.1)));
      blue = map(sqrt(blue), 0, 1, 0, 100 + map(green, 0, 100, 0, 155));

      pixels[index] = color(red, green, blue, 255);
    }
  }
  updatePixels();
}