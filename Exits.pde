class Exit {

  //class variables
  int xPos;
  int yPos;
  PImage exit;
  boolean isOn=false;
  boolean exitCollidingWithPlayer=false;
  int exitHeigth = 50;

  //constructor
  Exit() {  
    exit = loadImage("exit.jpg"); //CHANGE THIS IMAGE
  }

  //class methods
  void display() {
    image(exit, xPos, yPos, 25, exitHeigth);
  }

  void showExit(int posX, int posY) {
    xPos=posX;
    yPos=posY;
    isOn=true;
  }

  //colision detection - should this happen in level?
  boolean collidingWithPlayer() {
    for (int i=0; i<players.length; i++) {
      int playerX = players[i].getX();
      int playerY = players[i].getY();
      int playerH = 62;
      int playerW = 62;
      if (playerX+playerW>xPos) {
        //if ((playerY > yPos) && ((playerY+playerH) < (yPos+exitHeigth))) { //NB: THIS IS NOOOT WORKING!
          exitCollidingWithPlayer =  true;
          return true;
        }
      //}
    }
    exitCollidingWithPlayer = false;
    return false;
  }
}
