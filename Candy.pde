class Candy {

  //class variables
  int xPos;
  int yPos; 
  PImage candy;
  int id;
  boolean isOn=false;

  //constructor
  Candy() {
    int id = int(random(0, 3));
    candy = loadImage("c"+id+".png");
  }

  //class methods
  void display() {
    image(candy, xPos, yPos, 20, 20);
  }

  void showCandy(int posX, int posY) {
    xPos=posX;
    yPos=posY;
    isOn=true;
  }

  void collisionDetection() {
    //do a collision detection with player here - if collision - player gets a score
  }

  //boolean checkCollisionWithPlayer() {
  //  for (int i=0; i<players.length; i++) {
  //    int playerX=players[i].getX();
  //    int playerY=players[i].getY();
  //    int playerH=62;
  //    int playerW=62;
      
  //    if ((playerX+playerW)>xPos && (playerX)<(xPos+tileWidth))  //left side of candy
  //  }
  //   return true; 
  //  }
  }
