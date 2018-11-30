/*
HEADER
 REMEMBER TO CREDIT THE CREATORS OF SPRITESHEETS ETC
 */

Player[] players = new Player[2];
Shot[] shots = new Shot [50];
Exit exit; 
Level[] levels = new Level[5];
Candy[] candies = new Candy[50];
Skeleton[] skeletons = new Skeleton[50];
Monster[] monsters = new Monster[20];

//variables
char[] controls = new char[5];
char[] controls1 = new char[5];
PImage floor;
PImage instructions;
PImage menu;
PImage gameOver;
PImage highSCore;
int weAreInLevel=0;
int life=3;
int gamestate=0;

void setup()
{
  size(800, 400);
  loadImages();
  setControls(); //setting the controls for the players
  setupLevels();
  setupShots();
}

void draw()
{
  if (gamestate==0) {  //gamestate 0 - startscreen and instructions
    showStartScreen();
  } 
  if (gamestate==1) {  //gamestate 1 - playing
    displayBackground();
    showAndControlPlayer();
    displayAndMoveShots();
    showAndUpdateLevels();
  }
  if (gamestate==2) {
    showGameOverScreen();
  }
  if (gamestate==3) {
    showHighScoreList();
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
  if (gamestate==2) {
    showGameOverScreen();
  }
  if (gamestate==0) {
    showStartScreen();
  }
}

void keyReleased()
{
  for (int i = 0; i < players.length; i++)
  {
    players[i].keyWasReleased(key);
  }
  if (gamestate==2) {
    showGameOverScreen();
  }
  if (gamestate==0) {
    showStartScreen();
  }
}


//functions

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

void setControls() {
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
  for (int i = 0; i < players.length; i++)
  {
    players[i] = new Player();
  }
  players[0].setControls(controls);
  players[1].setControls(controls1);
}

void showAndControlPlayer() {
  for (int i=0; i<players.length; i++) {
    players[0].display();
    players[i].handleKeyStates();
  }
}

void displayAndMoveShots() {
  for (int i=0; i<shots.length; i++) {
    shots[i].display();
    shots[i].move();
  }
}

void showAndUpdateLevels() {
  for (int i=0; i<levels.length; i++) {
    levels[weAreInLevel].display(); //displays the current level
    levels[i].updateLevel(); //not working yet
  }
}

void displayBackground() {
  imageMode(CORNER);
  image(floor, 0, 0, 800, 400);
}

void loadImages() {
  floor = loadImage("floor.png"); //loading the background
  instructions = loadImage("instructions.png"); //loading the instructions-screen
  menu = loadImage("startmenu.png");
  //gameOver = load image here
  //highScore = load image here
}

void setupShots() {
  for (int i = 0; i < shots.length; i++)
  {
    shots[i] = new Shot();
  }
}

void setupLevels() {
  for (int i=0; i<levels.length; i++)
  {
    levels[i] = new Level(i);
  }
}

void showGameOverScreen() {
  //load gameoverscreen image here
  if (keyCode=='V') {
    gamestate=0;
    //remember to call this in keypressed with the right gamestate criteria
  }
}

void showStartScreen() {
  image(menu, 0, 0, 800, 400);
  if (keyCode=='V') {
    // gamestate=4;
    image(instructions, 0, 0, 800, 400);
  }
  if (keyCode=='N') {
    image(menu, 0, 0, 800, 400);
  }
  if (keyCode=='B') {
    gamestate=1;
  }
  if (keyCode=='C') {
    gamestate=1;
    players[1].display();
  }
}

void showHighScoreList() {
  //load image 
  //functions
  //keyCodes - change gamestate to 0 - remember to call this in keypressed with the right gamestate criteria
}


/*
GAME_STATES OVERVIEW
 //gamestate 0 = start menu
 //gamestate 1 = playing game
 //gamestate 2 = gameOver
 //gamestate 3 = highscore
 things to remember: 
 - should be in keypressed. 
 - should take 1+2 player into account
 - should be resetable 
 */
