class Tile
{
  int xPos=0;
  int yPos=0;
  int tileHeight = 25;
  int tileWidth = tileHeight;
  boolean isOn=false;
  boolean playerCollision=false;
  boolean collide=false;

  void display()
  {
    //if (isOn){
    fill(255, 255, 0, 50);
    rect(xPos, yPos, tileWidth, tileHeight);
    //}
  }

  void addTile(int posX, int posY, boolean s)
  {
    xPos=posX;
    yPos=posY;
    isOn=s;
  }

  void switchOff()
  {
    isOn=false;
  }

  boolean checkPlayerAndTileCollision() {
    if (!isOn) { 
      return false;
    }
    for (int i=0; i<playerCount; i++) {
      int playerX = players[i].getX();
      int playerY = players[i].getY();
      int playerH = players[i].getH();
      int playerW = players[i].getW();
      if ((playerX+playerW>=xPos) &&
        (playerX < xPos+tileWidth) &&
        (playerY+playerH >= yPos) &&
        (playerY < yPos+tileHeight)) 
      { 
        //switchOff();
        //players[i].stopMoving();
        return true;
      }
    }
    return false;
  }
}
