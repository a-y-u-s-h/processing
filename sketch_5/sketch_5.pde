/**
 * Author : Ayush Sharma
 * 
 * Version : 22 Feb 2018
 * 
 * Title : Lorenz Attractor
 * 
 * Description : 
 * 
 *   A 3D plot of points defined by these differential equations -
 *   
 *   dx = (a * (y - x)) * dt;
 *   dy = (x * (b - z) - y) * dt;
 *   dz = (x * y - c * z) * dt;
 *   
 *   where, 
 *   a = 10 
 *   b = 28
 *   c = 8 / 3
 *   
 *   Traditionally, a = sigma, b = rho, c = beta.
 */

float x = 0.01;
float y = 0;
float z = 0;

float a = 10; 
float b = 28; 
float c = 8.0 / 3.0; 

float dt = 0.01;

ArrayList<PVector> points = new ArrayList<PVector>();

void setup() {
  size(800, 600, P3D);
  colorMode(HSB, 100);
  noFill();
}

void draw() {
  background(0);

  float dx = (a * (y - x)) * dt;
  float dy = (x * (b - z) - y) * dt;
  float dz = (x * y - c * z) * dt;

  x += dx;
  y += dy;
  z += dz;

  points.add(new PVector(x, y, z));

  translate(width * 0.5, height * 0.5);
  rotateY(radians(frameCount * 0.2));
  rotateX(radians(frameCount * 0.1));
  rotateZ(radians(frameCount * 0.15));
  strokeWeight(0.5);
  scale(5);
  beginShape();
  for (PVector p : points) {
    stroke(map(dist(p.x, p.y, p.z, 0, 0, 0), 0, (width + height) * 0.2, 0, 100), 100, 100);
    vertex(p.x, p.y, p.z);  
    if (mousePressed) {
      PVector offset =  PVector.random3D();
      offset.mult(0.1);
      p.add(offset);
    }
  }
  endShape();

  if (points.size() > 8000) {
    points.remove(points.get(0));
  }
}