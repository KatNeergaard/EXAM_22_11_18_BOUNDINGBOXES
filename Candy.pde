class Candy {

  //class variables
  int xPos;
  int yPos; 
  PImage candy;
  int id;
  boolean isOn=false;
  int candyWidth = 20;
  int candyHigth = 20;

  //constructor
  Candy() {
    int id = int(random(0, 3));
    candy = loadImage("c"+id+".png");
  }

  //class methods
  void display() {
    if (isOn) {
      image(candy, xPos, yPos, candyWidth, candyHigth);
    }
  }

  void addCandy(int posX, int posY, boolean s) {
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
      int playerX=players[i].getX();
      int playerY=players[i].getY();
      int playerH=players[i].getH();
      int playerW=players[i].getW();
      if ((playerX+playerW>= xPos) &&
        (playerX < xPos + candyWidth) &&
        (playerY+playerH >= yPos) &&
        (playerY + playerH < yPos + candyHigth))
      {
        score+=10; //reaction to collision
        addCandy(0, 0, false);
        return true;
      }
    }
    return false;
  }
  
  void resetCandy(){
    isOn=false; 
  }
}
