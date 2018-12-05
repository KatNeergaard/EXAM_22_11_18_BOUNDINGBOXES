class Exit {

  //class variables
  int xPos=0;
  int yPos=0;
  PImage exit;
  boolean isOn=false;
  boolean collided=false;
  int exitHeigth = 50;
  int exitWidth = 25;

  //constructor
  Exit() {  
    exit = loadImage("exit.jpg");
  }

  //class methods
  void display() {
    //if (isOn) {
    image(exit, xPos, yPos, exitWidth, exitHeigth);
    //}
  }

  void addExit(int posX, int posY, boolean s) {
    xPos=posX;
    yPos=posY;
    isOn=s;
  }

  //colision detection - should this happen in level?
  boolean collidingWithPlayer() {
    if (!isOn) { 
      return false;
    }
    for (int i=0; i<playerCount; i++) {
      int playerX = players[i].getX();
      int playerY = players[i].getY();
      int playerH = players[i].getH();
      int playerW = players[i].getW();
      if ((playerX+playerW>=xPos) &&
        (playerX < xPos+exitWidth) &&
        (playerY+playerH >= yPos) &&
        (playerY+playerH < yPos+exitHeigth)) 
      {
        println("true");
        addExit(xPos, yPos, false);
        return true;
      }
    }
    addExit(xPos, yPos, true);
    return false;
  }
}
