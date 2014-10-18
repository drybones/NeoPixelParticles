OPC opc;
ParticleSystem ps;
PImage texture;
float hueCenter = 0.5;
float hueRange = 0.2;
float particleIntensity = 0.3;
float globalBrightness = 1.0;

void setup() {
  size(640,640);
  colorMode(HSB,1,1,1,1);
  noStroke();
  texture = loadImage("dot.png");
  opc = new OPC(this, "127.0.0.1", 7890);
  ps = new ParticleSystem(hueRange, hueCenter, texture);
  opc.setColorCorrection(2.5, globalBrightness, globalBrightness, globalBrightness);
  opc.ledGrid8x8(0, width/2, height/2, height / 25.0, 0, false);
}
 
void draw() {
  background(0);
  drawHueControl();
  drawIntensityControl();
  ps.HueCenter = hueCenter;
  ps.HueRange = hueRange;
  if(random(1.0) <= particleIntensity)
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
  hueCenter = constrain(mouseX*1.0/width, 0.0, 1.0);
  particleIntensity = constrain(mouseY*1.0/height, 0.0, 1.0);  
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  hueRange = constrain(hueRange + e/50.0, 0.0, 1.0);
}

void drawHueControl() {
  int steps = 100;
  float barHeight = height*0.025;
  float barWdith = width-barHeight;
  for(int i=0; i<steps; i++) {
    fill(i*1.0/steps, 1.0, 1.0);
    rect(i*1.0*barWdith/steps, 0, barWdith*1.0/steps + 1, barHeight);
  }
  fill(1,0,1);
  stroke(1,0,0);
  ellipse(barWdith*hueCenter, barHeight/2, barHeight, barHeight);
  triangle(
    barWdith*((hueCenter-hueRange/2+1.0) % 1.0), 0, 
    barWdith*((hueCenter-hueRange/2+1.0) % 1.0), barHeight, 
    barWdith*((hueCenter-hueRange/2+1.0) % 1.0)+barHeight*0.4, barHeight*0.5
  );
  triangle(
    barWdith*((hueCenter+hueRange/2) % 1.0), 0, 
    barWdith*((hueCenter+hueRange/2) % 1.0), barHeight, 
    barWdith*((hueCenter+hueRange/2) % 1.0)-barHeight*0.4, barHeight*0.5
  );
  noStroke();
}

void drawIntensityControl()
{
  int steps = 100;
  float barWidth = width*0.025;
  float barHeight = height-barWidth;
  for(int i=0; i<steps; i++) {
    fill(1.0, 0.0, i*1.0/steps);
    rect(width-barWidth, barWidth + i*1.0*barHeight/steps, width, barWidth + 1.0*barHeight/steps + 1);
  }
  fill(1,0,1);
  stroke(1,0,0);
  ellipse(width-barWidth/2, barWidth + barHeight*particleIntensity, barWidth, barWidth);

}




