OPC opc;
ParticleSystem ps;
PImage texture;
float hueCenter = 0.5;
float hueRange = 0.2;

void setup() {
  size(640,640);
  colorMode(HSB,1,1,1,1);
  noStroke();
  texture = loadImage("dot.png");
  opc = new OPC(this, "127.0.0.1", 7890);
  ps = new ParticleSystem(hueRange, hueCenter, texture);
  opc.ledGrid8x8(0, width/2, height/2, height / 25.0, 0, false);
}
 
void draw() {
  background(0);
  drawHueControl();
  ps.HueCenter = hueCenter;
  ps.HueRange = hueRange;
  if((mouseY * 1.0 / height) > random(1.0))
  {
    ps.addParticle();
  }
  ps.run();
}

void keyPressed() {
  switch(key) {
    case 't':
      ps.Texture = texture;
      break;
    case 's':
      ps.Texture = null;
      break;
  }
  ps.clear();
}

void mouseDragged() {
  hueCenter = mouseX*1.0/width;
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  hueRange = constrain(hueRange + e/50.0, 0.0, 1.0);
}

void drawHueControl() {
  int steps = 100;
  float barHeight = 0.025;
  for(int i=0; i<steps; i++) {
    fill(i*1.0/steps, 1.0, 1.0);
    rect(i*width/100.0, 0, width*1.0/steps+1, height*barHeight);
  }
  fill(1,0,1);
  ellipse(width*hueCenter, height*barHeight/2, height*barHeight, height*barHeight);
  rect(width*(hueCenter-hueRange/2), height*barHeight*0.45, width*hueRange, height*barHeight*0.1);
}




