/*
HEADER
 REMEMBER TO CREDIT THE CREATORS OF SPRITESHEETS ETC
 */

//variables
PImage floor;
PImage instructions;
Player[] players = new Player[2];
Shot[] shots = new Shot [50];
Skeleton[] skeletons = new Skeleton[50];
Monster[] monsters = new Monster[50];
Candy[] candies = new Candy[100];
char[] controls = new char[5];
char[] controls1 = new char[5];
int gamestate=0;
StartScreen startScreen; 
Level[] levels = new Level[3];
int weAreInLevel=0;
int numb;
int life=100;

void setup()
{
  size(800, 400);
  floor = loadImage("floor.png"); //loading the background
  instructions = loadImage("instructions.png"); //loading the instructions-screen
  //setting the controls for the players
  controls[0] = 'L';
  controls[1] = 'J';
  controls[2] = 'I';
  controls[3] = 'M';
  controls[4] = 'K';
  controls1[0] = 'D';
  controls1[1] = 'A';
  controls1[2] = 'E';
  controls1[3] = 'X';
  controls1[4] = 'S';

  for (int i=0; i<levels.length; i++)
  {
    levels[i] = new Level(i);
  }
  //initialising classes BUT?: //should I be going through monsters, candy and skeletons in the levels instead
  //  monster = new Monster();
  //  candy = new Candy();
  startScreen = new StartScreen();
  for (int i = 0; i < monsters.length; i++)
  {
    monsters[i] = new Monster();
  }
  for (int i = 0; i < candies.length; i++)
  {
    candies[i] = new Candy();
  }
  for (int i = 0; i < skeletons.length; i++)
  {
    skeletons[i] = new Skeleton();
  }
  for (int i = 0; i < shots.length; i++)
  {
    shots[i] = new Shot();
  }
  for (int i = 0; i < players.length; i++)
  {
    players[i] = new Player();
  }
  players[0].setControls(controls);
  players[1].setControls(controls1);
}

void draw()
{
  if (gamestate==0) {
    startScreen.display();
    startScreen.handleKeyStates();
  } else if (gamestate==4) {
    image(instructions, 0, 0, 800, 400);
  }
  if (gamestate==1) {
    imageMode(CORNER);
    image(floor, 0, 0, 800, 400);
    for (int i=0; i<players.length; i++) {
      players[0].display();
      players[i].handleKeyStates();
    }
    for (int i=0; i<shots.length; i++) {
      shots[i].display();
      shots[i].move();
    }
    for (int i = 0; i < skeletons.length; i++)
    {
      // skeletons[i].display();
     // skeletons[i].attackPlayer();
    }
    for (int i=0; i<monsters.length; i++) {
      monsters[i].display();
    }
    for (int i=0; i<candies.length; i++) {
      candies[i].display();
    }
    levels[0].display(); //displays the current level
  }
}

void keyPressed()
{
  for (int i = 0; i < players.length; i++)
  {
    players[i].keyWasPressed(key);
    println(players[i].getClass());
    checkCollide(players[i], players[i].getX(), players[i].getY());
  }
  startScreen.keyWasPressed(key);
  
  if (keyCode=='V') {
    gamestate=4;
    if (gamestate==4) {
      if (keyCode=='N') {
        gamestate=0;
      }
    }
  }
}

void keyReleased()
{
  for (int i = 0; i < players.length; i++)
  {
    players[i].keyWasReleased(key);
  }
  startScreen.keyWasReleased(key);
  if (keyCode=='V') {
    gamestate=4;
    if (gamestate==4) { //THIS IS NOT WORKING
      if (keyCode=='N') {
        gamestate=0;
      }
    }
  }
}

void gameStateChanger(int numb) {
  gamestate=numb;
}

void mousePressed() {
  gamestate=1;
}

void checkCollide(Player player, int x, int y) {
  Tile[] tiles = levels[weAreInLevel].GetTiles();
  println(player, x, y);
  for (int i = 0; i < tiles.length; i++) {
    if (tiles[i].collide == true) {
      
      println(player.getX() > tiles[i].xPos && tiles[i].collide == true);
      if (player.getX() > tiles[i].xPos && tiles[i].collide == true) {
        player.stopMoving();
      }
    }
  }
}

/*
GAME_STATES
 //gamestate 0 = start menu
 //gamestate 1 = playing game
 //gamestate 2 = gameOver
 //gamestate 3 = highscore
 //gamestate 4 = instructions
 things to remember: 
 - should be in keypressed. 
 - should take 1+2 player into account
 - should be resetable 
 
 void draw() {
 // Display the contents of the current screen
 if (gameScreen == 0) {
 initScreen();
 } else if (gameScreen == 1) {
 gameScreen();
 } else if (gameScreen == 2) {
 gameOverScreen();
 }
 }
 */
