import java.util.Iterator;

class ParticleSystem {
  ArrayList<Particle> particles;
  public float HueRange;
  public float HueCenter;
  
  ParticleSystem(float hr, float hc) {
    HueRange = hr;
    HueCenter = hc;
    particles = new ArrayList<Particle>();
  }

  void addParticle() {
    float thisHue = (HueRange*(random(1.0)-0.5) + HueCenter) % 1.0;
    particles.add(new Particle(new PVector(width/2.0,height/2.0), thisHue));
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
