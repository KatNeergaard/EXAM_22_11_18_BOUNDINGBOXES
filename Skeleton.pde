class Skeleton {

  //class variables
  int durationOneFrame = 100; //in milliseconds
  int frame = 0;
  int frameMax = 4; //how can I show more?
  int ticksLast = millis();
  PImage spriteSheet;
  float xPos;
  float yPos;
  int h = 62;
  int w = 62;
  boolean playerIsClose=false;
  int skeletonId;
  boolean isOn=false;

  //constructor
  Skeleton() {
      spriteSheet = loadImage("mon2.png"); //500x500 pixels
  }

  //class methods
  void display()
  {
    if (isOn) {
      //display frame from sprite sheet with Magic Numbers (frame 0 starts at (0, 0) with a size of 62X62 pixels):
      if (skeletonId==0) {
        PImage skelly1 = spriteSheet.get(0 + (frame * w), 0, w, h); 
        image(skelly1, xPos, yPos, 50, 50);
      } else if (skeletonId==1) {
        PImage skelly2 = spriteSheet.get(0 + (frame * w), 320, w, h); 
        image(skelly2, xPos, yPos, 50, 50); //is this the way to use the same spritesheet? no
        int frameMax = 7;
      }
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

  void addSkeleton(int posX, int posY, boolean s)
  {
    xPos=posX;
    yPos=posY;
    isOn=s;
  }
  
    
    //collision detection - if collision between player and candy - player scores
  boolean areYouHit() {
    if (!isOn) { 
      return false;
    }
    for (int i = 0; i < playerCount; i++) { 
      //getting the variables needed
      float shotX=shots[i].getX();
      int shotY=shots[i].getY();
      int shotH=shots[i].getH();;
      int shotW=shots[i].getW();
      if ((shotX+shotW>= xPos) &&
        (shotX < xPos + w) &&
        (shotY+shotH >= yPos) &&
        (shotY < yPos + h))
      {
        score+=10; //reaction to collision
        addSkeleton(0, 0, false);
        return true;
      }
    }
    return false;
  }

  //REMEMBER TO make isOn false on collision 
  //AT THIS POINT THERE IS NO WAY TO JUST CALL DISPLAY AND GET SKELETONID 0...

  boolean playerIsClose() { //should this be changed to a boolean?
    for (int i=0; i<playerCount; i++) {
      if ((xPos - players[i].getX()) < 20) { //PROBABLY NOT THE BEST WAY TO GET DISTANCE? It assumes that the skeleton is always further to the right than the player.
      }
    }
    return true;
  }

  void attackPlayer() {
    // if (playerIsClose==true) { //comment out this to see the skeleton attacking
    skeletonId=1;
    display();
    xPos++;
  }
  //}
}
