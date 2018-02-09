/**
 * Langton's Ant :
 * 
 * A cellular automata system that produces interesting patterns.
 **/


int[][] grid; 
int x; 
int y; 
int direction;


int ANT_UP    = 0;
int ANT_RIGHT = 1;
int ANT_DOWN  = 2;
int ANT_LEFT  = 3;


void turnRight() {
  direction++;
  if (direction > ANT_LEFT) {
    direction = ANT_UP;
  }
}

void turnLeft() {
  direction--;
  if (direction < ANT_UP) {
    direction = ANT_LEFT;
  }
}

void moveForward() {

  switch (direction) {
  case 0 :
    y--;
    break;
  case 1 :
    x++;
    break;    
  case 2 :
    y++;
    break;
  case 3 :
    x--;    
    break;
  }

  if (x >= width) {
    x = 0;
  }  

  if (x < 0) {
    x = width - 1;
  }

  if (y >= height) {
    y = 0;
  }  

  if (y < 0) {
    y = height - 1;
  }
}

void setup () {
  size(400, 400);

  grid       = new int[width][height];
  x          = 200;
  y          = 200;
  direction  = ANT_UP;
}

void draw () {
  for (int k = 0; k < 20; ++k) {

    int state = grid[x][y];

    if (state == 0) {
      turnRight();
      grid[x][y] = 1;
      moveForward();
    } else if (state == 1) {
      turnLeft();
      grid[x][y] = 0;
      moveForward();
    }

    loadPixels();
    for (int i = 0; i < width; i += 1) {
      for (int j = 0; j < height; j += 1) {
        int index = i + j * width;
        if (grid[i][j] == 0) {
          pixels[index] = color(0);
        } else {
          pixels[index] = color(255);
        }
      }
    }
    updatePixels();
  }
}