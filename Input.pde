class Input
{
  //Class: Controls Keyboard input commands


  // Fields
  //Multi-Key Catching 
  boolean[] keys; 
  // true - Pressed
  // false - Released


  Input()
  {
    //creates a boolean for each keyCode
    keys = new boolean[256];
    for (int i = 0; i < keys.length; i++)
    {
      keys[i] = false;
    }
  }

  void KeyCommands() // calls command accourding to key
  {
    // Main Menu Controls
    if (g.state == 0)
    {
      if (isKeyPressed(80) == true ) // calls Game
      {
        g.state = 2;
        g.Reset();
        g.lCount = 3;
        g.display();
      } else if (isKeyPressed(83) == true ) // Calls Ship Selection
      {
        g.state = 1;
        g.display();
      }
    }

    // Ship Selection Controls
    if (g.state == 1)
    {
      if (isKeyPressed(66) == true )
      {
        g.state = 0;
        g.display();
      }

      //Changes Color of ship
      else if (isKeyPressed(97) == true ) // blue
      {
        image.index = 0;
        g.display();
      } else if (isKeyPressed(98) == true ) // green
      {
        image.index = 1;
        g.display();
      } else if (isKeyPressed(99) == true ) // purple
      {
        image.index = 2;
        g.display();
      } else if (isKeyPressed(100) == true ) // red
      {
        image.index = 3;
        g.display();
      } else if (isKeyPressed(101) == true ) // yellow
      {
        image.index = 4;
        g.display();
      }
    }

    //Game State Controls
    if (g.state == 2)
    {
      //Standered Controls - Arrows
      if (isKeyPressed(RIGHT) == true) // turn left
      {
        s.direction = true;
        s.turn();
      }
      if (isKeyPressed(LEFT) == true) // turn right
      {
        s.direction = false;
        s.turn();
      }
      if (isKeyPressed(UP) == true ) //move
      {
        s.move();
        s.sWrap();
        s.display();
      }
      if (isKeyReleased(UP) == true) // decelerate
      {
        s.decelerate();
        s.sWrap();
        s.display();
      }

      // Alternative Controls - a w d
      if (isKeyPressed(65) == true)  // turn left
      {
        s.direction = false;
        s.turn();
      }
      if (isKeyPressed(68) == true)  // turn right
      {
        s.direction = true;
        s.turn();
      }

      if (isKeyPressed(87) == true ) // move
      {
        s.move();
        s.sWrap();
        s.display();
      }
      if (isKeyReleased(87) == true) // decelerate
      {
        s.decelerate();
        s.sWrap();
        s.display();
      }
      //
    }

    // Game Over Screen
    if (g.state == 3)
    {
      if (isKeyPressed(66) == true ) // Main Menu
      {
        g.state = 0;
        g.display();
      }
    }

    // Future End Game Screen - currently in development
    /*
     if(g.state == 4)
     {
     if(isKeyPressed(' ') == true )
     {
     g.state = 2;
     g.Reset();
     g.LiveDepletion();
     g.display();
     
     }
     else if(isKeyPressed(LEFT) == true )
     {
     g.state = 0;
     g.Reset();
     g.LiveDepletion();
     g.display();
     
     }
     }
     */
  }

  // Multi-key Catching

  // sets the key according to keyCode number to be true
  void recordKeyPressed(int k) {
    keys[k] = true;
  }

  // sets it to false when released
  void recordKeyReleased(int k) {
    keys[k] = false;
  }

  // checks to see if currently pressed
  boolean isKeyPressed(int k)
  {
    return keys[k];
  }
  // check to see if currently released
  boolean isKeyReleased(int k)
  {
    return !keys[k];
  }
}// End of class