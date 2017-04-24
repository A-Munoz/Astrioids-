class Asteroids
{
  //Class:Displays Asteroids and manages it position and speed, as well as current level of asteroid;
  
  //Field
  PVector aPosition; // posistion of asteriod
  float aRadius; // asteroid radius
  boolean aColliding; // tells if collision happened

  PVector aAccel; //Acceleration
  PVector aVeloc; //Velocity
  PVector aDirect; //Direction

  float accelRate; //accerlation rate
  int index; // index of image array
  boolean lChange; // level change to two
  boolean levelCleared; // level of asteriod is cleared
  float maxSpeed; // max speed of asteroid


  Asteroids()
  {
    aPosition = new PVector( (int)random(720, 1400), (int)random(300, 900) );  
    aVeloc = new PVector(0, 0);
    aAccel = new PVector(0, 0);
    aDirect = new PVector(1, 0);
    aDirect.rotate(radians((int)random(0, 360)));
    accelRate = .5;
    lChange = false;
    levelCleared = false;
    aRadius = 40;
    aColliding = false;

    index = (int)random(0, 4);

    maxSpeed = 3;
  }

  void display() // moves asteriods
  {

    if (levelCleared == false)
    {
      aAccel = PVector.mult(aDirect, accelRate);

      aVeloc.add(aAccel);

      aVeloc.limit(maxSpeed);

      aPosition.add(aVeloc);

      aWrap(); // wraps them around the screen
      
      //Rotation
      pushMatrix();
      translate(aPosition.x, aPosition.y);
      rotate(aDirect.heading());

      imageMode(CENTER);
      if (lChange == false)
      {
        callLevelOne(); // big asteriods
      } else
      {
        callLevelTwo(); // small asteriods
      }

      stroke(255);
      popMatrix();
    }
  }

  void callLevelOne() // large asteroids
  {
    image(image.LevelOne[index], 0, 0); 
    aRadius = 40;
  }

  void callLevelTwo() // small asteroids
  {
    image(image.LevelTwo[index], 0, 0); 
    aRadius = 25;
  }

  void aWrap() // wraps the ship around the screen
  {
    if (aPosition.x > width + 25)
    {
      aPosition.x = -25;
    } else if (aPosition.x < -25)
    {
      aPosition.x = width + 25;
    } else if (aPosition.y > height + 25)
    {
      aPosition.y = -25;
    } else if (aPosition.y < -25) 
    {
      aPosition.y = height + 25;
    }
  }
}