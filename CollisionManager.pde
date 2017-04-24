class CollisionManager
{
  //Class: Check collisions of ships, asteroids, and bullets

  CollisionManager()
  {
  }
  void HandleShipCollisions() // large asteriod collisions
  {

    // Check Collision between Ship and Asteroid

    for (int i = 0; i <aM.a.length; i++)
    {
      float d = dist(s.front.x, s.front.y, aM.a[i].aPosition.x, aM.a[i].aPosition.y);  // Calculates Distance

      float totalR = (s.radius + aM.a[i].aRadius); // totals radius

      if (totalR > d)// if Distance and Total Radious Overlap
      {
        // Yes- Collision
        aM.a[i].aColliding = true;
        s.sColliding = true;

        Collision(i);
        break;
      } else // No - Safe
      {
        aM.a[i].aColliding= false; // testing
        s.sColliding = false;
      }
    }
  }

  void HandleLeveTwoCollisions() // small asteriod collsions
  {

    // Check Collision between Ship and Asteroid

    for (int i = 0; i <aM.a.length; i++)
    {
      if (aM.b[i].lChange == true)
      {
        float d = dist(s.front.x, s.front.y, aM.b[i].aPosition.x, aM.b[i].aPosition.y);  // Calculates Distance

        float totalR = (s.radius + aM.b[i].aRadius); // totals radius

        if (totalR > d)// if Distance and Total Radious Overlap
        {
          // Yes- Collision
          aM.b[i].aColliding = true;
          s.sColliding = true;

          Collision(i);
          break;

          // println("true"); // testing
        } else // No - Safe
        {
          aM.b[i].aColliding= false; // testing
          s.sColliding = false;
        }
      }
    }
  }

  void Collision(int i) //Call results of collision
  {
    if (aM.a[i].aColliding == true)
    {
      if (s.sColliding == true)
      {
        g.lCount = g.lCount -1;
        s = new Ship();
        aM.levelChange(i);
      }
    }
    if (aM.b[i].aColliding == true)
    {
      if (s.sColliding == true)
      {
        g.lCount = g.lCount -1;
        s = new Ship();
        aM.levelTwoChange(i);
      }
    }
  }
}// end of class