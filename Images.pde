class Images
{
  //Class: Loads, and holds all images used in program

  //fields
  //Array size
  int CountNum;

  //background Images
  PImage background;
  PImage End;


  //Ship Images
  PImage[] Ship; // Ship image array
  //0-blue
  //1-green
  //2-purple - the trick asteroid, due to background
  //3-red
  //4-yellow

  int index; // ship color

  //Asteroids 
  PImage[] LevelOne; // Large Asteroids 
  PImage[] LevelTwo; // Small Asteroid

  Images()
  {
    CountNum = 5; // array size

    index = 0 ;// default ship

    //Creates Arrays
    Ship = new PImage[CountNum]; 
    LevelOne = new PImage[CountNum];
    LevelTwo = new PImage[CountNum];


    loadImages(); // load all images
  }

  void loadImages() //loads images
  {
    //Ship load
    Ship[0] = loadImage("Images/Ship/BlueShip.png");
    Ship[1] = loadImage("Images/Ship/GreenShip.png");
    Ship[2] = loadImage("Images/Ship/PurpleShip.png");
    Ship[3] = loadImage("Images/Ship/RedShip.png");
    Ship[4] = loadImage("Images/Ship/YellowShip.png");

    //Level One Asteroids
    LevelOne[0] = loadImage("Images/Asteroids/Level1/AsteriodsL1-1.png");
    LevelOne[1] = loadImage("Images/Asteroids/Level1/AsteriodsL1-2.png");
    LevelOne[2] = loadImage("Images/Asteroids/Level1/AsteriodsL1-3.png");
    LevelOne[3] = loadImage("Images/Asteroids/Level1/AsteriodsL1-4.png");
    LevelOne[4] = loadImage("Images/Asteroids/Level1/AsteriodsL1-5.png");

    //Level Two Asteroids
    LevelTwo[0] = loadImage("Images/Asteroids/Level2/AsteriodsL2-1.png");
    LevelTwo[1] = loadImage("Images/Asteroids/Level2/AsteriodsL2-2.png");
    LevelTwo[2] = loadImage("Images/Asteroids/Level2/AsteriodsL2-3.png");
    LevelTwo[3] = loadImage("Images/Asteroids/Level2/AsteriodsL2-4.png");
    LevelTwo[4] = loadImage("Images/Asteroids/Level2/AsteriodsL2-5.png");

    //Background Images 
    background = loadImage("Images/Background/bg.png"); // Game background
    End = loadImage("Images/Background/end.png"); //Normal Background
  }
}// End of Class