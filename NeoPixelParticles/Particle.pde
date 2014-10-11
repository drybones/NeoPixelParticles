class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  float hue;
  float baseSpeed = 0.7;
  float baseSize = 60;
  
//  Particle() {
//    new Particle(new PVector(width/2.0,height/2.0));
//  }
  
  Particle(PVector l, float h) {
    float speed = baseSpeed * random(0.6, 1.4);
    //[offset-up] For demonstration purposes we assign the Particle an initial velocity and constant acceleration.
    acceleration = new PVector(0,0);
    float theta = random(0,2*PI);
    velocity = new PVector(speed*sin(theta),speed*cos(theta));
    location = l.get();
    lifespan = 255.0;
    hue = h;
  }

  // Sometimes it’s convenient to have a “run”
  // function that calls all the other functions we need.
  void run() {
    update();
    display();
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 2.0 * baseSpeed;
  }

  void display() {
    noStroke();
    fill(hue,1.0,1.0,0.5*lifespan/255);
    ellipse(location.x,location.y,8+baseSize*(255-lifespan)/255.0,8+baseSize*(255-lifespan)/255.0);
  }

  // Is the Particle alive or dead?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
