class Ship
{
  //Class: Manages and Display user's ship

  //Fields

  //Ship Shape
  PVector front; // images locations
  float radius; // ship's radius, for collisions

  //Ship Movement
  PVector shipAccel; //Acceleration
  PVector shipDecel; //Deceleration
  PVector shipVeloc; //Velocity
  PVector shipDirect; //Direction
  float decelRate; //deceleration Rate
  float accelRate; //Acceleration Rate

  //Ship Turning
  boolean direction; // turn direction (Left - false, Right - true);

  boolean sColliding; // Ship Collison
  // True - Collision
  // False - no Collsion


  Ship()
  {
    //Ship Shape
    front = new PVector((width/2), (height/2)); // Starting Posistion
    radius = 15;
    //Ship Movement
    shipVeloc = new PVector(0, 0); // Ship Velociyt
    shipAccel = new PVector(0, 0); // Ship Acceleration
    shipDecel = new PVector(0, 0); //Ship Decleration
    shipDirect = new PVector(1, 0); //Ship facing direction, used in rotation
    shipDirect.rotate(radians(-90)); // set image to face upwards

    accelRate = 2; // acceleation Rate
    decelRate = .02; // deceleration rate

    sColliding = false;
  }

  void display()
  {
    imageMode(CENTER); // for rotation purposes


    //Ship

    //rotation
    pushMatrix();
    translate((front.x), (front.y));
    rotate(shipDirect.heading());
    image(image.Ship[image.index], 0, 0);      
    stroke(255);
    popMatrix();
  }

  void move() // Updates position
  {
    shipAccel = PVector.mult(shipDirect, accelRate); // calcutaltes Acceleration

    shipVeloc.add(shipAccel); // increases velocity

    shipVeloc.limit(3); // sets Acceleration of ship limit

    front.add(shipVeloc); //changes position
  }

  void decelerate() // slows down ship
  {

    shipDecel = PVector.mult(shipVeloc, decelRate); // calculates deceleration

    shipVeloc.sub(shipDecel); // subtracts it

    // stops Deceleration after certain point
    if (shipVeloc.x <= -3 )
    {
      shipVeloc.x = 0;
    }

    if (shipVeloc.y <= -3)
    {
      shipVeloc.y = 0;
    }

    shipVeloc.limit(4); // troubleshooting

    front.add(shipVeloc); // changes position
  }


  void sWrap() // wraps the ship around the screen
  {
    if (front.x > width + 25)
    {
      front.x = -25;
    } else if (front.x < -25)
    {
      front.x = width + 25;
    } else if (front.y > height + 25)
    {
      front.y = -25;
    } else if (front.y < -25) 
    {
      front.y = height + 25;
    }
  }

  void turn() // Turn the ships direction
  {
    if (direction == false )
    {
      shipDirect.rotate(radians(-2));
    } else if (direction == true )
    {
      shipDirect.rotate(radians(2));
    }
  }
} // end of class