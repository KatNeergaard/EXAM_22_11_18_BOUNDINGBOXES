
class Level
{
  int id=0;
  Tile[] tiles = new Tile[512];
  Candy[] candies = new Candy[50];
  Skeleton[] skeletons = new Skeleton[50];
  Level(int l)
  {
    id=l;
    //load level id:
    String[] lines = loadStrings("map"+id+".txt");

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

    int currentTile=0;
    int currentCandy=0;
    int currentSkeletons=0;
    for (int i=0; i<lines.length; i++) //goes through lines
    {
      for (int j=0; j<lines[i].length(); j++) //goes through rows
      {
        if (lines[i].charAt(j)=='1')
        {
          tiles[currentTile].showTile(j*25, i*25);
          currentTile++;
        } else if (lines[i].charAt(j)=='2') {
          candies[currentCandy].showCandy(j*25, i*25);
          currentCandy++;
        } else if (lines[i].charAt(j)=='3') {
          skeletons[currentSkeletons].showSkeleton(j*25, i*25);
          currentSkeletons++;
        }
      }
    }
  }

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
  }
  
  //can we put everything in the textfile? SO: monsters, skeletons, candy, tiles and exits?
  //then: if (player collides with exit){level++ - OR weAreInLevel++?
  
   Tile[] GetTiles(){
     return tiles;
   }
}
