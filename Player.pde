class Player {

  //class variables
  int durationOneFrame = 100; //in milliseconds
  int frame = 0;
  int frameMax = 6;
  int ticksLast = millis();
  PImage spriteSheetCat;
  boolean holdRight = false;
  boolean holdLeft = false;
  boolean holdUp = false;
  boolean holdDown = false;
  boolean playerIsShooting = false;
  int h = 30; //player heighth
  int w = 20; // player width
  int xPos=0;
  int yPos=255;
  int pyWas;
  int pxWas;
  boolean isOn = false;
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
    if (isOn) {
      loadPlayer();
      timeFix();
    }
  }

  void addPlayer(boolean s) {
    isOn=s;
  }

  void setControls(char c[])
  {
    controls = c;
  }

  void loadPlayer() { //displays frame from sprite sheet with Magic Numbers (frame 0 starts at (64, 64) with a size of 64x64 pixels):
    PImage cat = spriteSheetCat.get(w + (frame * 62), 85, w, h); //get() is a Processing function to access a (e.g. rectangular) part of a pImage.
    image(cat, xPos, yPos, w, h);
  }

  void resetPlayerCoordinate() {
    xPos=0;
    yPos=250;
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
          shots[i].activateShot(xPos+10, yPos);
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

  void movePlayer() {
    pxWas = xPos; //pxWas being a saved value for where the player was
    pyWas = yPos;
    int playerSpeed = 10;

    if (holdRight) {
      xPos=xPos+playerSpeed;
    }
    if (holdLeft) {
      //imageFlipped(cat, pxWas, pyWas);
      xPos=xPos-playerSpeed;
    }
    if (holdUp) {
      yPos=yPos-playerSpeed;
    }
    if (holdDown) {
      yPos=yPos+playerSpeed;
    }
    stopMoving();
    //if (yPos<0) {
    // yPos=pyWas; //stop moving works here
    //}
  }

  void stopMoving() {
    for (int i=0; i< tiles.length; i++) {
      if (tiles[i].checkPlayerAndTileCollision()==true) {
        xPos=pxWas; //pxWas being a saved value for where the player was
        yPos=pyWas;
        println("stop");
      }
    }
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

  //void imageFlipped(PImage cat, int pxWas, int pyWas) {
  //  pxWas = xPos; //pxWas being a saved value for where the player was
  //  pyWas = yPos;
  //  println(X);
  //  pushMatrix();
  //  //  translate(cat.width,0);
  //  scale( -1, 1 ); 
  //  image(cat, pxWas, pyWas, w, h);
  //  popMatrix();
  //} 

  //get functions. gets the position, width and heighth from the player clas,s so these can be used for collsion detection in other classes.
  int getX() {
    return xPos;
  }

  int getY() {
    return yPos;
  }

  int getH() {
    return h;
  }

  int getW() {
    return w;
  }
}
