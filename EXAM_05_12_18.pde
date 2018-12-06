/*
HEADER
 REMEMBER TO CREDIT THE CREATORS OF SPRITESHEETS ETC
 */

Player[] players = new Player[2];
Shot[] shots = new Shot [50];
Level[] levels = new Level[5];
//Candy[] candies = new Candy[50];
Skeleton[] skeletons = new Skeleton[50];
//Monster[] monsters = new Monster[20];
//Exit exit; 
Tile[] tiles = new Tile [512];

//variables
char[] controls = new char[5];
char[] controls1 = new char[5];
PImage floor;
PImage instructions;
PImage menu;
PImage gameOver;
PImage highScore;
int weAreInLevel=0;
int life=3; //should this be here or in player class?
int gamestate=0;
int playerCount=0;
int score = 0;

void setup()
{
  size(800, 400);
  loadImages();
  setupPlayer();
  setControls(); //setting the controls for the players
  setupLevels();
  setupShots();
  for (int i=0; i<tiles.length; i++)
  {
    tiles[i] = new Tile();
  }
}

void draw()
{
  imageMode(CORNER);
  if (gamestate==0) {  //gamestate 0 - startscreen and instructions
    showStartScreen();
  } 
  if (gamestate==1) { //gamestate 1 - playing
    displayBackground();
    showAndControlPlayers();
    displayAndMoveShots();
    showAndUpdateLevels();
    displayScoreAndLife();
  } else if (gamestate==2) {
    showGameOverScreen();
  } else if (gamestate==3) {
    endGameScreen();
    //load HighSCore list
    //RESETTING EVERYTHING
  }
}

void keyPressed()
{
  for (int i = 0; i < playerCount; i++)
  {
    players[i].keyWasPressed(key);
  }
  if (gamestate==2) {
    showGameOverScreen();
  }
  if (gamestate==0) {
    showStartScreen();
  }
  if (gamestate==3) {
    endGameScreen();
  }
}

void keyReleased()
{
  for (int i = 0; i < playerCount; i++)
  {
    players[i].keyWasReleased(key);
  }
  if (gamestate==2) {
    showGameOverScreen();
  }
  if (gamestate==0) {
    showStartScreen();
  }
  if (gamestate==3) {
    endGameScreen();
  }
}

//setup functions
void setupPlayer() {
  for (int i = 0; i < players.length; i++)
  {
    players[i] = new Player();
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
    players[0].setControls(controls);
    players[1].setControls(controls1);
  }
}

void displayBackground() {
  image(floor, 0, 0, 800, 400);
}

void loadImages() {
  floor = loadImage("floor.png"); //loading the background
  instructions = loadImage("instructions.png"); //loading the instructions-screen
  menu = loadImage("startmenu.png");
  gameOver = loadImage("gameover.png");
  highScore = loadImage("highscore.png");
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

//functions called in draw
void showAndControlPlayers() {
  for (int i=0; i<playerCount; i++) {
    players[i].addPlayer(true);
    players[i].display();
    players[i].movePlayer();
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
    if (weAreInLevel < levels.length) {
      levels[weAreInLevel].display(); //displays the current level
      levels[i].checkAllCollisions();
    } else {
      gamestate=3;
    }
  }
}

void showGameOverScreen() {
  image(gameOver, 0, 0, 800, 400);
  if (keyCode=='V') {
    gamestate=0;
  }
}

void endGameScreen() {
  image(highScore, 0, 0, 800, 400);
  if (keyCode=='N') {
    gamestate=0;
  }
}

void resetGame(){
//shots?
//players
//score
//life
//in levels we reset: candy, exits, levels, skeletons, tiles
}


void displayScoreAndLife() {
  textSize(20);
  fill(0);
  text("SCORE: "+score, 655, 20);
  text("LIFE: "+life, 10, 20);
}

void showStartScreen() {
  image(menu, 0, 0, 800, 400);
  if (keyCode=='V') {
    image(instructions, 0, 0, 800, 400);
  }
  if (keyCode=='N') {
    image(menu, 0, 0, 800, 400);
  }
  if (keyCode=='B') {
    gamestate=1;
    playerCount=1;
  }
  if (keyCode=='C') {
    gamestate=1;
    playerCount=2;
  }
}
