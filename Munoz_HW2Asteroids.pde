/*Asteroids-HW2
 Created:3/1/2016  Last Edit:3/1/2016
 Alexia Munoz*/

//Global Objects
Ship s; // Ship Manager
Images image; //Image
GameState g; // Game State
Input input; // Input manager
AsteroidManager aM; // Asteroid Manager
CollisionManager cM; // Collision Manager
bulletManager bM; // Bullet Manter


void setup()
{
  size(1200, 800);

  //object
  s = new Ship(); // new ship object
  image = new Images(); // loads images
  g = new GameState(); // new Game State
  input = new Input(); // new input manager
  aM = new AsteroidManager(); // new Asteroid Manager
  cM = new CollisionManager(); // New Collisions Manager
  bM = new bulletManager(); // new bullet manger
}

void draw()
{ 
  // background(image.background); // testing

  g.display(); // displays current Game state
  input.KeyCommands(); // check to see if commands happend
}

void keyPressed()
{  
  //println(keyCode); // testing - getting keycodes
  //bullet
  if (g.state == 2) 
  {
    if (keyCode == ' ') // to prevent holding bullets
    {
      bM.fireBullet();
    }
  }

  input.recordKeyPressed(keyCode);  // records key press, by a boolean to true
}

void keyReleased()
{
  input.recordKeyReleased(keyCode); // records key realease, by a boolean to false
}