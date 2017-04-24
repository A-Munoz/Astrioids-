class bulletManager
{
  ArrayList<Bullet> bullets;
  // Class: Manages bullet's Display, and effects
  bulletManager()
  {
    bullets = new ArrayList<Bullet>();
  }

  void display() // calls bullets display
  {
    for (int i = 0; i < bullets.size(); i++) {
      bullets.get(i).edges();
      if (bullets.get(i).update()) {
        bullets.remove(i);
        i--;
      }
      if (i < 0) {
        break;
      }
      if (bullets.get(i).bCollision())
      {
        bullets.remove(i);
        i--;
        break;
      } 

      bullets.get(i).render();
    }   
    while (bullets.size() > 3) {
      bullets.remove(0);
    }
  }

  void fireBullet() { //deploys bullets
    PVector pos = new PVector(s.front.x, s.front.y + s.radius);
    PVector dir = s.shipDirect.copy();

    bullets.add(new Bullet(pos, dir));
  }
}