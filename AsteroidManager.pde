class AsteroidManager
{
  //Holds all Asteroid objects and manages them

  Asteroids[] a;
  Asteroids[] b;

  AsteroidManager()
  {
    a = new Asteroids [7]; // Level 1
    b = new Asteroids [14]; // Level 2
    Reset();
  }

  void display()
  {
    for (int i = 0; i < a.length; i++) //loops through all astroids adn display them
    {
      if (a[i].lChange == true)
      {
        int I = i * 2;
        b[i].display();
        b[I].display();
      } else
      {
        a[i].display();
      }
    }
  }

  void levelChange(int i)  // creates smaller asteroids
  {
    b[i].aPosition= a[i].aPosition.copy();
    b[i].aDirect.rotate(radians((int)random(0, 360)));
    b[i].lChange = true;
    b[i].display();
    int I = i * 2;
    b[I].aPosition= a[i].aPosition.copy();
    b[I].lChange = true;
    b[I].aDirect.rotate(radians((int)random(0, 360)));
    b[I].display();
    a[i].lChange = true;
  }
  void levelTwoChange(int i)
  {
    b[i].levelCleared = true;
  }


  void Reset()
  {
    for (int i = 0; i < a.length; i++)
    {
      a[i] = new Asteroids();
    }
    for (int i = 0; i < b.length; i++)
    {
      b[i] = new Asteroids();
    }
  }
}