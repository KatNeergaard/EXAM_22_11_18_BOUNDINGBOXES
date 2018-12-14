class Monster {

  //class variables
  int durationOneFrame = 100; //in milliseconds
  int frame = 0;
  int frameMax = 7;
  int ticksLast = millis();
  PImage spriteSheet;
  int xPos;
  int yPos;
  int h = 50;
  int w = 50;
  boolean wasMonsterHit=false;
  int monsterLife=8;
  boolean isOn=false;

  //constructor
  Monster() {
    spriteSheet = loadImage("mon1.png"); //250x250 pixels
  }

  //class methods
  void display()
  {
    PImage monster = spriteSheet.get(0 + (frame * w), h, w, h); //display frame from sprite sheet with Magic Numbers (frame 0 starts at (0, 50) with a size of 50X50 pixels):
    image(monster, xPos, yPos, w, h);
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

  void showMonster(int posX, int posY)
  {
    xPos=posX;
    yPos=posY;
    isOn=true;
  }

  void shoot() {
    //should shoot on a timed event
  }

  void wasMonsterHit() {
    //if( collisionDetection with shot class){
    //wasMonsterHit=true;
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
