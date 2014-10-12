import java.util.Iterator;

class ParticleSystem {
  ArrayList<Particle> particles;
  public float HueRange;
  public float HueCenter;
  public PImage Texture;
  
  ParticleSystem(float hr, float hc, PImage t) {
    HueRange = hr;
    HueCenter = hc;
    texture = t;
    particles = new ArrayList<Particle>();
  }

  void addParticle() {
    float thisHue = (HueRange*(random(1.0)-0.5) + HueCenter) % 1.0;
    particles.add(new Particle(new PVector(width/2.0,height/2.0), thisHue, Texture));
  }

  void clear() {
    particles.clear();
  }
  
  void run() {
    Iterator<Particle> it =
        particles.iterator();
    while (it.hasNext()) {
      Particle p = it.next();
      p.run();
      if (p.isDead()) {
        it.remove();
      }
    }
  }
}
