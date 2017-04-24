class Bullet {
  PVector position; // posistion
  PVector bDirect; //Direction
  float accelRate; //Acceleration Rate
  PVector velocity; // velocity
  
  //used for timeing out bullets
  int counter = 0; 
  int timeOut = 120;

  float alpha;

  public Bullet(PVector pos, PVector dir ) {
    position = pos;
    bDirect = dir;
    accelRate = 4;
    alpha = 255;
  } 

  void edges() {  // wraping around screen
    if (position.x < 0) {
      position.x = width;
    }
    if (position.y < 0) {
      position.y = height;
    }
    if (position.x > width) {
      position.x = 0;
    }
    if (position.y > height) {
      position.y = 0;
    }
  }
  
  // test for bullet collision
  boolean bCollision() {

    for (int i = 0; i <aM.a.length; i++)
    {

      float d = dist(position.x, position.y, aM.a[i].aPosition.x, aM.a[i].aPosition.y);  // Calculates Distance

      float totalR = ( 2.5 + aM.a[i].aRadius); // totals radius

      if (totalR > d)// if Distance and Total Radious Overlap
      {
        // Yes- Collision
        aM.b[i].aColliding = true;
        aM.levelChange(i);
        return true;

        // println("true"); // testing
      }
    }

    for (int b = 0; b < aM.b.length; b++)
    {
      float dist = dist(position.x, position.y, aM.b[b].aPosition.x, aM.b[b].aPosition.y);  // Calculates Distance

      float TotalR = ( 2.5 + 25); // totals radius

      if (TotalR > dist)// if Distance and Total Radious Overlap
      {
        // Yes- Collision
        aM.b[b].aColliding = true;
        aM.levelTwoChange(b);
        return true;
      }
    }
    return false;
  }



  // moves bullet
  boolean update() {
    alpha *= .9;
    counter++;
    if (counter>=timeOut) {
      return true;
    }
    velocity = PVector.mult(bDirect, accelRate); // calcutaltes Acceleration

    velocity.limit(5); // sets Acceleration of ship limit

    position.add(velocity); //changes position
    return false;
  }

  // displays bullet
  void render() {

    pushMatrix();
    translate(position.x, position.y);
    rotate(bDirect.heading());
    stroke(255);
    ellipse(0, 0, 5, 5);     
    stroke(255);
    popMatrix();
  }
  
  
 
}