class Monster {

  //class variables
  int durationOneFrame = 100; //in milliseconds
  int frame = 0;
  int frameMax = 3;
  int ticksLast = millis();
  PImage spriteSheet;
  float xPos;
  float yPos;
  int h = 50;
  int w = 50;
  boolean wasMonsterHit=false;
  int monsterLife=8;
  int speed;
  boolean isOn=false;

  //constructor
  Monster() {
    spriteSheet = loadImage("mon1.png"); //250x250 pixels
    speed = 2; 
  }

  //class methods
  void display()
  {
    if (isOn) {
      PImage monster = spriteSheet.get(0 + (frame * w), h, w, h); //display frame from sprite sheet with Magic Numbers (frame 0 starts at (0, 50) with a size of 50X50 pixels):
      image(monster, xPos, yPos, w, h);
      timeFix();
    }
  }

  void addMonster(int posX, int posY, boolean s)
  {
    xPos=posX;
    yPos=posY;
    isOn=s;
  }
  
    void moveTowardsPlayer() {
    float xDir; 
    float yDir; 
    float monsterSpeed = 10;
    for (int i=0; i<players.length; i++) {
      xDir = (players[i].xPos - xPos)/width * monsterSpeed;
      yDir = (players[i].yPos - yPos)/height * monsterSpeed;
      xPos = xPos + xDir;
      yPos = yPos + yDir;
    }
  }
  
    float normalizedVector() {
    //would normalize the speed of the monster towards the player
    return (height^2+width^2)/ (width/height);
  }

  void shoot() {
    //should shoot on a timed event
  }

  void wasMonsterHit() {
    //if( collisionDetection with shot class){
    //wasMonsterHit=true;
  }
  void timeFix() {
    int delta = millis() - ticksLast;
    if (delta >= durationOneFrame)
    {
      frame++;
      if (frame >= frameMax) { 
        frame = 0;
      }
      //ticksLast = millis(); //adds up time overshooting error
      ticksLast += delta; //avoids adding up error
    }
  }
}

//void die() {
//  if (wasMonsterHit==true) {
//    monsterLife--;
//  }
//  if (monsterLife<0) {
//    //something something call anothe rpart of the spritesheet.
//  }
//}
