class Exit {

  //class variables
  int xPos;
  int yPos;
  PImage exit;
  boolean isOn=false;
  boolean collidingWithPlayer=false;

  //constructor
  Exit() {  
    exit = loadImage("exit.jpg"); //CHANGE THIS IMAGE
  }

  //class methods
  void display() {
    image(exit, xPos, yPos, 25, 50);
  }

  void showExit(int posX, int posY) {
    xPos=posX;
    yPos=posY;
    isOn=true;
  }

  //colision detection - should happen in level?
  boolean collidingWithPlayer(){
    for(int i=0; i<players.length; i++)
  int playerX = player.getX();
  return true;
  }
}
