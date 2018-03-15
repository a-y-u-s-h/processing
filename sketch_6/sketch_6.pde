int n = 10;
Blob[] blobs = new Blob[n];

void setup () {
  size(700, 500);
  colorMode(HSB, 100);
  for (int i = 0; i < n; i++) {
    blobs[i] = (new Blob(random(width * 0.2, width * 0.8), random(height * 0.2, height * 0.8)));
  }
}

void draw () {
  background(50);
  loadPixels();
  for (int x = 0; x < width; x++ ) {
    for (int y = 0; y < height; y++) {
      int index = x + y * width;
      float sum = 0;
      for (int i = 0; i < n; i++) {
        float d = dist(blobs[i].position.x, blobs[i].position.y, x, y);
        int multiplier;
        if (frameCount % (100 + i * 5) == 0) {
          multiplier = 10;
        } else {
          multiplier = 300;
        }
        sum += multiplier * blobs[i].radius / d;
      }
  
      
      color  c = color(
        map(sum, 0, 900, 15, 0), 
        map(sum, 0, 900, 100, 40), 
        map(sum, 0, 1200, 100, 50)
        );


      pixels[index] = color(c);
    }
  }
  updatePixels();

  for (int i = 0; i < n; i++) {
    blobs[i].update(i);
  }
}