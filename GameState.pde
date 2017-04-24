class GameState
{
  //Class: Manages Game, determines what is on display, and what is not


  //Front
  PFont title; //AgencyFB.vlw
  PFont sub; //AgencyFB-sub.vlw

  // Lives
  int lCount; //live Count
  PVector[] liveLoc; //Live location

  boolean b;

  // Current Game state
  int state = 0;
  // 0 = Main Menu
  // 1 = Options
  // 2 = Game
  // 3 = Respawn screen?
  // 4 = End Screen



  GameState()
  {
    //Game State
    //state = 1; // default 

    //Lives
    lCount = 3; // 3 lives
    liveLoc = new PVector[3]; // first life location 
    for (int i =0; i <3; i++)
    {
      liveLoc[i] = new PVector(20 +(30*i), 20);
    }

    //Font
    title = loadFont("AgencyFB.vlw");
    sub = loadFont("AgencyFB-sub.vlw");
  }

  void display()
  {
    if (state == 0) //Main Menu
    {
      Main();
    } else if (state == 1) // Options
    {
      Options();
    } else if (state == 2) // Game
    {
      Game();
    } else if (state == 3) // Respawn
    {
      Respawn();
    } else if (state == 4) // End Screen
    {
    }
  }

  void Main() //Main screen
  {
    background(image.End);

    //Text Display
    textSize(40);
    fill(255); //White
    textAlign(CENTER);

    textFont(title);
    text("Asteroids", width/2, 300);

    textSize(35);
    textFont(sub);
    text(" 'p' to Play ", width/2, 420);
    text(" 's' to Ship Selection ", width/2, 470);
  }

  void Options() //Options screen
  {
    background(image.background);

    //Text Display
    textSize(40);
    fill(255); //White
    textAlign(CENTER);

    textFont(title);
    text("Ship Selection", width/2, 200);

    textAlign(LEFT);
    textSize(35);
    textFont(sub);
    text(" '1-5' to change ship ", 400, 270);
    textAlign(LEFT);
    text(" '1'  :  Blue ", 400, 330);
    text(" '2'  :  Green ", 400, 370);
    text(" '3'  :  Purple ", 400, 410);
    text(" '4'  :  Red ", 400, 450);
    text(" '5'  :  Yellow", 400, 490);

    imageMode(CENTER);
    image(image.Ship[image.index], 750, 400);
    text(" 'b' to go back to main menu ", 400, 600);
  }


  void Game() // Game play
  {
    background(image.background);
    cM.HandleShipCollisions();
    cM.HandleLeveTwoCollisions();
    LiveDepletion(); // decreases live if collison happened.

    if (Check())
    {
      state = 3;
      display();
    } else if (lCount > 0) // Shows lives count, and calls game
    {
      LiveDisplay();
      bM.display();
      s.display();
      aM.display();
    } else if (lCount == 0) // Calls Respawn screen
    {
      state = 3;
      display();
    }
  }

  boolean Check() // checks to see if level is cleared
  {
    for (int i = 0; i < aM.a.length; i++)
    {
      if (aM.a[i].aColliding == true)
      {
        for (int b = 0; b < aM.b.length; b++)
        {
          if (aM.b[b].levelCleared == true)
          {
            return true;
          }
        }
      }
    }
    return false;
  }

  void Respawn() //Respawn screen
  {
    background(image.End);

    //Text Display
    textSize(40);
    fill(255); //White
    textAlign(CENTER);

    textFont(title);
    text("Game Over", width/2, 380);

    textSize(35);
    textFont(sub);
    text(" 'b' to go Back to Main Menu", width/2, 420);
  }

  // Shows Current Live Count
  void LiveDisplay()
  {
    for (int i = 0; i < lCount; i++)
    {
      image(image.Ship[image.index], liveLoc[i].x, liveLoc[i].y);
    }
  }

  // Removes a life after collision
  void LiveDepletion()
  {
    if (s.sColliding == true)
    {
      if (lCount < 0) // in case of of lCount not reset
      {
        lCount = 3;
      } else
        lCount = lCount - 1; // decreases lives

      s = new Ship(); // resets ship
    }
  }

  //Reset Game
  void Reset()
  {
    s = new Ship(); // new ship object
    aM = new AsteroidManager();
    cM = new CollisionManager();
  }
} //End of Class