class StartScreen {

  PImage menu;
  int xpos;
  int ypos;
  boolean onePlayerChosen=false;
  boolean twoPlayerChosen=false;
  boolean instructionsChosen=false;
  //char[] controls = new char[3]; NOOOO


  StartScreen() {
    menu = loadImage("startmenu.png");
  }

  void display() {
    image(menu, 0, 0, 800, 400);
  }

  void keyWasPressed(char c) {
    if (keyCode=='B') {
      onePlayerChosen=true;
    }
    if (keyCode=='C') {
      twoPlayerChosen=true;
    }
    if (keyCode=='V') {
      instructionsChosen=true;
    }
  }

  void keyWasReleased(char c) { //will this make it change back?
    if (keyCode=='B') {
      onePlayerChosen=false;
    }
    if (keyCode=='C') {
      twoPlayerChosen=false;
    }
    if (keyCode=='V') {
      instructionsChosen=false;
    }
  }

  void handleKeyStates() {
    if (onePlayerChosen==true) {
      gamestate=1;
      //println("trying to get to gamestate 1");
    }
    if (twoPlayerChosen) {
      gamestate=1;
      players[1].display(); //WHY DOES THIS NOT WORK?
    }
    if (instructionsChosen) {
      gamestate=4;
    }
   // println("handling keystates");
  }
}
