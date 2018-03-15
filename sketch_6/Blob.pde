class Blob { 
  PVector position;
  PVector velocity;
  float radius;

  Blob (float x, float y) {
    position = new PVector(x, y);
    velocity = PVector.random2D();
    velocity.mult(random(-10, 10));
    radius = 40;
  }

  Blob () {
    position = new PVector(width * 0.5, height * 0.5);
    velocity = PVector.random2D();
    velocity.mult(random(-10, 10));
    radius = 40;
  }

  void show () {
    noFill();
    stroke(255);
    ellipse(position.x, position.y, radius * 2, radius * 2);
  }

  void update (int i) {
    if (frameCount % (100 + i * 5) == 0) {
     this.radius = 300; 
    }
    
    this.radius = lerp(this.radius, 40, 0.1);
    if (position.x > width - radius || position.x < radius) {
      velocity.x *= -1;
    }

    if (position.y > height - radius || position.y < radius) {
      velocity.y *= -1;
    }
    position.add(velocity);
  }
}