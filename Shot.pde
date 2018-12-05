class Shot {

  //class variables
  int durationOneFrame = 100; //in milliseconds
  int frame = 0;
  int frameMax = 3;
  int ticksLast = millis();
  PImage spriteSheet;
  int xPos;
  int yPos;
  int h = 35;
  int w = 35;
  boolean isOn = false;
  int bullitSpeed=10; 

  //constructor
  Shot() {
    spriteSheet = loadImage("shots.png"); //500x250 pixels
  }

  //class methods
  void display()
  {
    if (isOn) {
      //display frame from sprite sheet with Magic Numbers (frame 0 starts at (0, 0) with a size of 35X35 pixels):
      PImage shot = spriteSheet.get(0 + (frame * w), 0, w, h); 
      image(shot, xPos, yPos);
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

  void activateShot(int newPosX, int newPosY) {
    xPos=newPosX; //change this to player width
    yPos=newPosY; //change this to player hiegth/2
    isOn=true;
  }

  void move() {
    if (isOn) {
      //the shots shoud move across the screen until they hit something
      if (xPos>=width) {
        isOn=false;
      }
      xPos=xPos+bullitSpeed;
    }
  }

  void checkIfShotIsBeeingUsed() {
    if (xPos < width) {
      //AND IF IT HAS NOT COLLIDED WITH ANYTHING
    }
    isOn=true;
  }

  boolean getOn() {
    return isOn;
  }

  float getX() //gets the x position so we can call it in another class
  {
    return xPos;
  }
}
