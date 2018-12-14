
class Level
{
  int id=0;
  Tile[] tiles = new Tile[512];
  Candy[] candies = new Candy[50];
  Skeleton[] skeletons = new Skeleton[50];
  Exit exit;
  Monster[] monsters = new Monster[20];

  //constructer
  Level(int l)
  {
    id=l;
    //load level id
    String[] lines = loadStrings("map"+id+".txt");
    //instatiating the classes needed
    exit = new Exit();
    for (int i=0; i<tiles.length; i++)
    {
      tiles[i] = new Tile();
    }

    for (int i=0; i<candies.length; i++)
    {
      candies[i] = new Candy();
    }

    for (int i=0; i<skeletons.length; i++)
    {
      skeletons[i] = new Skeleton();
    }
    for (int i=0; i<monsters.length; i++) {
      monsters[i] = new Monster();
    }
    int currentTile=0;
    int currentCandy=0;
    int currentSkeletons=0;
    int currentMonsters=0;
    for (int i=0; i<lines.length; i++) //goes through lines
    {
      for (int j=0; j<lines[i].length(); j++) //goes through rows
      {
        if (lines[i].charAt(j)=='1') {
          tiles[currentTile].showTile(j*25, i*25);
          tiles[currentTile].collide=true;
          currentTile++;
        } else if (lines[i].charAt(j)=='2') {
          candies[currentCandy].showCandy(j*25, i*25);
          currentCandy++;
        } else if (lines[i].charAt(j)=='3') {
          skeletons[currentSkeletons].showSkeleton(j*25, i*25);
          currentSkeletons++;
        } else if (lines[i].charAt(j)=='5') {
          exit.showExit(j*25, i*25);
        } else if (lines[i].charAt(j)=='4') {
          monsters[currentMonsters].showMonster(j*25, i*25);
          currentMonsters++;
        }
      }
    }
  }

  //class methods
  void display()
  {
    for (int i=0; i<tiles.length; i++)
    {
      tiles[i].display();
    }
    for (int i=0; i<candies.length; i++)
    {
      candies[i].display();
    }
    for (int i=0; i<skeletons.length; i++)
    {
      skeletons[i].display();
    }
    for (int i=0; i<monsters.length; i++) {
      monsters[i].display();
    }
    exit.display();
  }

  void updateLevel() {
    if (exit.collidingWithPlayer()==true) {
      println("fuck yes");
      weAreInLevel++;
      // OR  id++;
    }
  }

  Tile[] GetTiles() {
    return tiles;
  }
}
