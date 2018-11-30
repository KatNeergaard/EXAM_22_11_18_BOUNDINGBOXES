
class Player {

  //class variables
  int durationOneFrame = 100; //in milliseconds
  int frame = 0;
  int frameMax = 7;
  int ticksLast = millis();
  PImage spriteSheetCat;
  PImage spriteSheet;
  boolean holdRight = false;
  boolean holdLeft = false;
  boolean holdUp = false;
  boolean holdDown = false;
  boolean playerIsShooting = false;
  int h = 62; //player heighth
  int w = 62; // player width
  int xPos=0;
  int yPos=0;
  int pyWas;
  int pxWas;
  int playerid;
  char[] controls = new char[10];
  int life = 3; //should -1 upon collsion with enenmy. when life=0 - gameover!

  //constructor
  Player()
  {
    spriteSheetCat = loadImage("cat.png"); //1000x1000 pixels
  }

  //class methods
  void display() //how do I place the players in different places in the easiets way?
  {
    loadPlayer();
    timeFix();
  }

  void setControls(char c[])
  {
    controls = c;
  }

  void keyWasPressed(char c) {
    if (keyCode == controls[0]) {
      holdRight = true;
    }
    if (keyCode == controls[1]) {
      holdLeft = true;
    }
    if (keyCode == controls[2]) {
      holdUp = true;
    }
    if (keyCode == controls[3]) {
      holdDown = true;
    }
    if (keyCode == controls[4]) {
      for (int i=0; i<shots.length; i++) {
        if (shots[i].getOn()==false) {
          shots[i].activateShot(xPos, yPos);
          break;
        }
      }
    }
  }

  void keyWasReleased(char c) {
    if (keyCode == controls[0]) {
      holdRight = false;
    }
    if (keyCode == controls[1]) {
      holdLeft = false;
    }
    if (keyCode == controls[2]) {
      holdUp = false;
    }
    if (keyCode == controls[3]) {
      holdDown = false;
    }
  }

  void handleKeyStates() {
    pxWas = xPos; //pxWas being a saved value for where the player was
    pyWas = yPos;
    int playerSpeed = 3;

    if (holdRight) {
      xPos=xPos+playerSpeed;
    }
    if (holdLeft) {
      xPos=xPos-playerSpeed;
      ;
    }
    if (holdUp) {
      yPos=yPos-playerSpeed;
    }
    if (holdDown) {
      yPos=yPos+playerSpeed;
    }
    if (yPos<0) {
      yPos=pyWas; //stop moving
    }
  }

  //void stopMoving() {
  //  for(int i=0; i< tile[i].length; i++){
  //  if(tiles.checkCollisionWithPlayer()==true)
  //  xPos= pxWas;
  //  println("stop");
  //}
  //}

  void reset()
  {
  }

  void timeFix() {
    int delta = millis() - ticksLast;
    if (delta >= durationOneFrame)
    {
      frame++;
      if (frame >= frameMax) { 
        frame = 0;
      }
      //ticksLast = millis(); - adds up time overshooting error
      ticksLast += delta; //avoids adding up error
    }
  }

  void loadPlayer() {
    //displays frame from sprite sheet with Magic Numbers (frame 0 starts at (64, 64) with a size of 64x64 pixels):
    PImage cat = spriteSheetCat.get(w + (frame * w), h, w, h); //get() is a Processing function to access a (e.g. rectangular) part of a pImage.
    image(cat, xPos, yPos, 75, 75);
  }

  int getX() //gets the x position so we can call it in another class
  {
    return xPos;
  }

  int getY() //gets the x position so we can call it in another class
  {
    return yPos;
  }
}
