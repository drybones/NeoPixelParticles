OPC opc;
ParticleSystem ps;
 
void setup() {
  size(640,640);
  colorMode(HSB,1,1,1,1);
  blendMode(BLEND);
  noStroke();
  opc = new OPC(this, "127.0.0.1", 7890);
  ps = new ParticleSystem(0.2, 0.5);
  opc.ledGrid8x8(0, width/2, height/2, height / 25.0, 0, false);
}
 
void draw() {
  background(0);
  ps.HueCenter = mouseX * 1.0 / width;
  if((mouseY * 1.0 / height) > random(1.0))
  {
    ps.addParticle();
  }
  ps.run();
}





