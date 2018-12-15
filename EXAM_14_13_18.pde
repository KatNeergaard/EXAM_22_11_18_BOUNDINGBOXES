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
String[] lines;
PImage floor;
PImage instructions;
PImage menu;
PImage gameOver;
PImage highScoreIMG;
int weAreInLevel=0;
int life=3; 
int gamestate=0;
int playerCount=0;
int score = 0;
int highScore=0; 

void setup()
{
  size(800, 400);
  loadImages();
  setupPlayer();
  setControls(); //setting the controls for the players
  setupLevels();
  setupShots();
  loadScoreFile();
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
    endGame();
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
    endGame();
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
    endGame();
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
  controls[3] = 'K';
  controls[4] = 'M';
  controls1[0] = 'D'; //right
  controls1[1] = 'A'; //left
  controls1[2] = 'W'; //up
  controls1[3] = 'S'; //down
  controls1[4] = 'Z'; //shoot
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
  highScoreIMG = loadImage("highscoreIMG.png");
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
  score=0;
  life=0;
  //EVERTHING SHOULD BE RESET HERE!!!!
  if (keyCode=='V') {
    gamestate=0;
  }
}

void endGame() {
  drawEndscreenGraphics();
  addScoreToHighscoreList();
  saveFile();
  sortAndShowHighscoreList ();

  //EVERTHING SHOULD BE RESET HERE!!!
  if (keyCode=='N') {
    gamestate=0;
    score=0;
    life=0;
  }
}

void drawEndscreenGraphics() {
  image(highScoreIMG, 0, 0, 800, 400);
  fill(255, 255, 0);
  text(+score, 350, 120);
}

void sortAndShowHighscoreList() {
  for (int i=0; i<lines.length; i++)
    lines = sort(lines);
  lines = reverse(lines);
  {
    displayScoresFromHighScoreList();
  }
}

void displayScoresFromHighScoreList () {
  for (int i=0; i<5; i++) { //only show top five
    text(lines[i], 600, 120+60*i);
  }
}

void addScoreToHighscoreList() {
  // for (int i=0; i<lines.length; i++) {
  //set(lines[i+1], score); SET DOESNT WORK WITHOUT INTLIST
  //   expand(lines[i], +1); nullPointException.... 
  //lines.add(new line(score)); ADD() ONLY WORKS FOR OBJECTS...
}

void saveFile() {
  saveStrings("highscoreList.txt", lines);
}

void loadScoreFile() {
  lines = loadStrings("highscoreList.txt");
}

//We don't need highscore when saving it n a file?
//void calcHighscore() {
//  highScore=max(score, highScore);
//}

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
