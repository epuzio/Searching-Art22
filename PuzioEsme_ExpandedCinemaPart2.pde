/*
 * Course: ART 22  - Computer Programming for the Arts
 * Assignment: Expanded Cinema Part 2
 *
 * by Esmé Puzio
 *
 * Initiated: 10/19/21
 * Last updated: 10/29/21
 *
 * HOW TO PLAY: Use the arrow keys and keyboard to search a bizarre, dreamlike world for a Magic 8-Ball.
 * Dialog prompts with one letter in brackets ([E]xit, [D]ream) will require you to press the
 * corresponding key (E, D) for those actions. Keys will be displayed "live" (brightly colored) on the screen
 * to indicate a particular route available to the player. The buttons are a little stiff, so you might need to hit them a few times.
 *
 * The true ending of the game cannot be accessed without tampering with the code. Simply change the boolean
 * searchYourself to true to access the true ending.
 */

boolean searchYourself = false;


//---IMAGE IMPORTS----
PImage mainMenu;
PImage instructionsIMG;

//arrow key imports
PImage liveUpArrow;
PImage liveDownArrow;
PImage liveLArrow;
PImage liveRArrow;
PImage deadUpArrow;
PImage deadDownArrow;
PImage deadLArrow;
PImage deadRArrow;
//exit text
PImage playableExitText;

//park (starting point)
PImage pwe1;
PImage pwe2;
PImage pwe3;

PImage pweLeft1;
PImage pweLeft2;

//going straight through the park
PImage pwe4;
PImage pwe5;
PImage pwe6;
PImage pwe7;
PImage pwe8;
PImage pwe9;

//deception pass
PImage decep1;
PImage decep2;
PImage decep3;
PImage decep4;
PImage decep5;
PImage decep6;

//go straight from deception pass to talk to the man
PImage decepStraight1;
PImage decepStraight2;

//talk to the man at decepticon pass
PImage decepTalk1;
PImage decepTalk2;

//go left from deception pass
PImage decepl1;
PImage decepl2;
PImage decepl3;
PImage decepl4;
PImage decepl5;
PImage decepl6;
PImage decepl7;
PImage decepl8;
PImage decepl9;
PImage decepl10;
PImage decepl11;

//endless highway
PImage ehClouds1;
PImage ehClouds2;
PImage ehClouds3;
PImage eh1;
PImage eh2;
PImage eh3;
PImage eh4;
PImage deadEnd;

//department store
PImage dept1;
PImage dept2;
PImage dept3;
PImage dept4;
PImage dept5;

//bodie array
PImage[] bodie = new PImage[14];

PImage DeadEnd2;

//house for bodie
PImage house0;
PImage house1;
PImage house2;
PImage house3;

//pier (false end)
PImage pier1;
PImage pier2;
PImage pier3;

//8 balls
PImage small8ball;
PImage med8ball;
PImage large8ball;

//hand array
PImage[] hands = new PImage[4];

//false ending images
PImage afraid;
PImage falseMenu;

//true ending images
PImage[] ending = new PImage[3];




//---CONTROL VARS----
//switch case operator

/////////////////////////////////////////////////////////////////////////////////////////////
int scene = 0;
/////////////////////////////////////////////////////////////////////////////////////////////

//frame couter operators
int frameCounter = 0;
int keyPressCount = 0;
int sec = 6; // frame rate

//function for displaying arrow keys
void arrowDisplay(char l, char u, char d, char r) {
  if (l == 'l') {
    image(liveLArrow, 1105 -32, 660 -12, 75, 75);
  }
  if (l == 'x') {
    image(deadLArrow, 1105 -32, 660 -12, 75, 75);
  }
  if (u == 'l') {
    image(liveUpArrow, 1190 -32, 575 -12, 75, 75);
  }
  if (u == 'x') {
    image(deadUpArrow, 1190 -32, 575 -12, 75, 75);
  }
  if (d == 'l') {
    image(liveDownArrow, 1190 -32, 660 -12, 75, 75);
  }
  if (d == 'x') {
    image(deadDownArrow, 1190 -32, 660 -12, 75, 75);
  }
  if (r == 'l') {
    image(liveRArrow, 1275 -32, 660 -12, 75, 75);
  }
  if (r == 'x') {
    image(deadRArrow, 1275 -32, 660 -12, 75, 75);
  }
}

//function for making the cloud gif i got from wikipedia actually work
void drawClouds() {
  if ((millis()/400)%3 == 0) {
    ehClouds1 = loadImage("ehClouds1.png");
    image(ehClouds1, (1360 -1120)/2, (765-630)/2, 1120, 630);
  }
  if ((millis()/400)%3 == 1) {
    ehClouds2 = loadImage("ehClouds2.jpg");
    image(ehClouds2, (1360 -1120)/2, (765-630)/2, 1120, 630);
  }
  if ((millis()/400)%3 == 2) {
    ehClouds3 = loadImage("ehClouds3.jpg");
    image(ehClouds3, (1360 -1120)/2, (765-630)/2, 1120, 630);
  }
}


//----------------------------

void setup() {
  frameRate(6);
  noStroke();

  //image loading for arrows
  liveUpArrow = loadImage("liveUp>.png");
  liveDownArrow = loadImage("liveDown>.png");
  liveLArrow = loadImage("liveLeft>.png");
  liveRArrow = loadImage("liveRight>.png");
  deadUpArrow = loadImage("deadUp>.png");
  deadDownArrow = loadImage("deadDown>.png");
  deadLArrow = loadImage("deadLeft>.png");
  deadRArrow = loadImage("deadRight>.png");
  playableExitText = loadImage("Dream-Exit-Text.png");

  //image loading for main menu
  mainMenu = loadImage("Main-Menu.png");

  //image loading for instructions
  instructionsIMG = loadImage("Instructions.png");

  //image loading for park at water's edge
  pwe1 = loadImage("temp1.png");
  pwe2 = loadImage("temp2.png");
  pwe3 = loadImage("temp3.png");
  pweLeft1 = loadImage("Doorwarp1.jpg");
  pweLeft2 = loadImage("Doorwarp2.jpg");

  pwe4 = loadImage("temp5.png");
  pwe5 = loadImage("temp6.png");
  pwe6 = loadImage("temp7.png");
  pwe7 = loadImage("temp8.png");
  pwe8 = loadImage("temp9.png");
  pwe9 = loadImage("temp10.png");

  decep1 = loadImage("Teleport1.png");
  decep2 = loadImage("Teleport2.png");
  decep3 = loadImage("decep1.png");
  decep4 = loadImage("decep2.png");
  decep5 = loadImage("decep3.png");
  decep6 = loadImage("decep4.png");

  decepStraight1 = loadImage("decepleft1.png");
  decepStraight2 = loadImage("decepleft2.png");

  decepTalk1 = loadImage("deceps21.png");
  decepTalk2 = loadImage("deceps22.png");

  decepl1 = loadImage("decepl1.png");
  decepl2 = loadImage("decepl2.png");
  decepl3 = loadImage("decepl3.png");
  decepl4 = loadImage("decepl4.png");
  decepl5 = loadImage("decepl5.png");
  decepl6 = loadImage("decepl6.png");
  decepl7 = loadImage("decepl7.png");
  decepl8 = loadImage("decepl8.png");
  decepl9 = loadImage("decepl9.png");
  decepl10 = loadImage("decepl10.png");
  decepl11 = loadImage("decepl11.png");


  //image loading for endless highway
  ehClouds1 = loadImage("ehClouds1.png");
  ehClouds2 = loadImage("ehClouds2.jpg");
  ehClouds3 = loadImage("ehClouds3.jpg");
  eh1 = loadImage("Endless-Highway1.png");
  eh2 = loadImage("Endless-Highway2.png");
  eh3 = loadImage("Endless-Highway3.png");
  eh4 = loadImage("Endless-Highway4.png");
  deadEnd = loadImage("DeadEnd.png");

  //image loading for bodie
  bodie[0] = loadImage("Bodie1.png");
  bodie[1] = loadImage("Bodie2.png");
  bodie[2] = loadImage("Bodie3.png");
  bodie[3] = loadImage("Bodie4.png");
  bodie[4] = loadImage("Bodie5.png");
  bodie[5] = loadImage("Bodie6.png");
  bodie[6] = loadImage("Bodie7.png");
  bodie[7] = loadImage("Bodie8.png");
  bodie[8] = loadImage("Bodie9.png");
  bodie[9] = loadImage("Bodie10.png");
  bodie[10] = loadImage("Bodie11.png");
  bodie[11] = loadImage("Bodie12.png");
  bodie[12] = loadImage("Bodie13.png");
  bodie[13] = loadImage("Bodie14.png");

  //dead end
  DeadEnd2 = loadImage("DeadEnd2.png");

  //image loading for house
  house0 = loadImage("House0.png");
  house1 = loadImage("House1.jpg");
  house2 = loadImage("House2.jpg");
  house3 = loadImage("House3.jpg");

  //image loading for pier
  pier1 = loadImage("Pier2.jpg");
  pier2 = loadImage("Pier3.jpg");
  pier3 = loadImage("Pier4.jpg");

  //department store
  dept1 = loadImage("dept1.png");
  dept2 = loadImage("dept2.png");
  dept3 = loadImage("dept3.png");
  dept4 = loadImage("dept4.png");
  dept5 = loadImage("dept5.png");

  //8 balls
  small8ball = loadImage("small8ball.png");
  med8ball = loadImage("med8ball.png");
  large8ball = loadImage("large8ball.png");

  //hands
  hands[0] = loadImage("Hand1.png");
  hands[1] = loadImage("Hand2.png");
  hands[2] = loadImage("Hand3.png");
  hands[3] = loadImage("Hand4.png");

  //false menu (comes from "beating" the game)
  afraid = loadImage("afraidOf.png");
  falseMenu = loadImage("falseMenu.png");

  //image loading for "true ending"
  ending[0] = loadImage("Ending1.png");
  ending[1] = loadImage("Ending2.png");
  ending[2] = loadImage("Ending3.png");


  background(0, 0, 0);
  size(1360, 765);
  fill(200, 200, 200);
  rectMode(CENTER);
  rect(1360/2, 765/2, 1120, 630);
}

void draw() {
  switch(scene) {
    //main menu
  case 0:
    if (searchYourself == true) {
      scene = 101;
      break;
    }
    //main menu
    image(mainMenu, 0, 0, width, height);
    if (keyPressed && (key == 's' || key == 'S')) { //enter dream
      scene = 3;
    }

    if (keyPressed && (key == 'i' || key == 'I')) { //instructions
      scene = 1;
    }

    if (keyPressed && (key == 'e' || key == 'E')) { //close program
      exit();
    }
    break;

    //instructions
  case 1:
    background(255, 255, 255);
    image(instructionsIMG, 0, 0, width, height);
    //exits to main menu
    if (keyPressed && (key == 'b' || key == 'B')) {
      scene = 0;
    }
    break;

    //endless highway (trap)
  case 2:
    background(0, 0, 0);
    drawClouds();
    //loop
    if (frameCounter < sec) {
      //image(ehClouds1, (1360 -1120)/2, (765-630)/2, 1120, 630);
      image(eh1, (1360 -1120)/2, (765-630)/2);
      arrowDisplay('x', 'x', 'x', 'x');
    }
    if (frameCounter >= (sec)  && frameCounter < (sec*2)) {
      //image(ehClouds2, (1360 -1120)/2, (765-630)/2, 1120, 630);
      image(eh2, (1360 -1120)/2, (765-630)/2);
      arrowDisplay('x', 'x', 'x', 'x');
    }
    if (frameCounter >= (sec*2)  && frameCounter < (sec*3)) {
      //image(ehClouds3, (1360 -1120)/2, (765-630)/2, 1120, 630);
      image(eh3, (1360 -1120)/2, (765-630)/2);
      arrowDisplay('x', 'x', 'x', 'x');
    }
    if (frameCounter >= (sec*3)) {
      image(ehClouds1, (1360 -1120)/2, (765-630)/2, 1120, 630);
      image(eh4, (1360 -1120)/2, (765-630)/2);
      arrowDisplay('x', 'l', 'x', 'x');

      if (keyPressed && keyCode == UP) {
        frameCounter = 1;
        frameCounter++;
        keyPressCount++;
      }
    }

    //exits to main menu
    if (keyPressed && (key == 'e' || key == 'E')) {
      scene = 0;
    }
    if (keyPressCount >= 2) { //appears if players try to go forward too many times
      image(deadEnd, 0, 0, width, height);
    }

    image(playableExitText, 10, 10);
    frameCounter++;
    break;


  case 3:
    //Park at water's edge (start here)
    background(0, 0, 0);
    if (frameCounter < (sec)) {
      image(pwe1, 120, 67.5);
      arrowDisplay('x', 'x', 'x', 'x');
    }
    if (frameCounter >= (sec)  && frameCounter < (sec*2)) {
      image(pwe2, 120, 67.5);
      arrowDisplay('x', 'x', 'x', 'x');
    }
    if (frameCounter >= (sec*2)) {
      image(pwe3, 120, 67.5);
      arrowDisplay('l', 'l', 'x', 'x');

      //enter the doors
      if (keyPressed && keyCode == UP) {
        frameCounter = 0;
        scene = 5;
      }

      //go to the gift shop
      if (keyPressed && keyCode == LEFT) {
        frameCounter = 0;
        scene = 4;
      }
    }
    //exits to main menu
    if (keyPressed && (key == 'e' || key == 'E')) {
      frameCounter = 0;
      scene = 0;
    }

    image(playableExitText, 10, 10);
    frameCounter++;
    break;

    //explore gift shop
  case 4:

    if (frameCounter < (sec)) {
      image(pweLeft1, 120, 67.50);
      arrowDisplay('x', 'x', 'x', 'x');
    }
    if (frameCounter >= (sec) && frameCounter >= (sec*2)) {
      image(pweLeft2, 120, 67.5);
      arrowDisplay('x', 'x', 'x', 'x');
    }
    if (frameCounter >= (sec * 3)) {
      frameCounter = 0;
      scene = 11; //go to dept store
    }


    //exits to main menu
    if (keyPressed && (key == 'e' || key == 'E')) {
      scene = 11;
    }

    image(playableExitText, 10, 10);
    frameCounter++;
    break;


  case 5:
    //go explore the park
    if (frameCounter < (sec)) {
      image(pwe5, 120, 67.50);
      arrowDisplay('x', 'x', 'x', 'x');
    }
    if (frameCounter >= (sec)  && frameCounter < (sec*2)) {
      image(pwe6, 120, 67.5);
      arrowDisplay('x', 'x', 'x', 'x');
    }
    if (frameCounter >= (sec*2) && frameCounter < (sec*3)) {
      image(pwe7, 120, 67.5);
      arrowDisplay('x', 'x', 'x', 'x');
    }
    if (frameCounter >= (sec*3) && frameCounter < (sec*4)) {
      image(pwe8, 120, 67.5);
      arrowDisplay('x', 'x', 'x', 'x');
    }
    if (frameCounter >= (sec*4)) {
      image(pwe9, 120, 67.5);
      arrowDisplay('x', 'l', 'x', 'x');

      //go forward to deception pass
      if (keyPressed && keyCode == UP) {
        frameCounter = 0;
        scene = 6;
      }
    }
    if (keyPressed && (key == 'e' || key == 'E')) {
      scene = 0;
    }
    image(playableExitText, 10, 10);
    frameCounter++;
    break;

  case 6:
    //transported to decepticon park
    if (frameCounter < (sec)) {
      image(decep1, 120, 67.5);
      arrowDisplay('x', 'x', 'x', 'x');
    }
    if (frameCounter >= (sec)  && frameCounter < (sec*2)) {
      image(decep2, 120, 67.5);
      arrowDisplay('x', 'x', 'x', 'x');
    }
    if (frameCounter >= (sec*2) && frameCounter < (sec*3)) {
      image(decep3, 120, 67.5);
      arrowDisplay('x', 'x', 'x', 'x');
    }
    if (frameCounter >= (sec*3) && frameCounter < (sec*4)) {
      image(decep4, 120, 67.5);
      arrowDisplay('x', 'x', 'x', 'x');
    }
    if (frameCounter >= (sec*4) && frameCounter < (sec*5)) {
      image(decep5, 120, 67.5);
      arrowDisplay('x', 'x', 'x', 'x');
    }

    if (frameCounter >= (sec*5)) {
      image(decep6, 120, 67.5);
      arrowDisplay('l', 'l', 'x', 'x');
      //talk to the man!
      if (keyPressed && keyCode == UP) {
        frameCounter = 0;
        scene = 7;
      }

      //go left instead
      if (keyPressed && keyCode == LEFT) {
        frameCounter = 0;
        scene = 10;
      }
    }
    if (keyPressed && (key == 'e' || key == 'E')) {
      scene = 0;
    }
    image(playableExitText, 10, 10);
    frameCounter++;
    break;


    //go straight from decepticon pass
  case 7:
    if (frameCounter < (sec)) {
      image(decepStraight1, 120, 67.5);
      arrowDisplay('x', 'x', 'x', 'x');
    }
    if (frameCounter >= (sec)) {
      image(decepStraight2, 120, 67.5);
      arrowDisplay('x', 'l', 'l', 'x');
      //turn around
      if (keyPressed && keyCode == DOWN) {
        frameCounter = 0;
        scene = 8;
      }

      if (keyPressed && keyCode == UP) {
        frameCounter = 0;
        scene = 9;
      }
    }

    if (keyPressed && (key == 'e' || key == 'E')) {
      scene = 0;
    }
    image(playableExitText, 10, 10);
    frameCounter++;
    break;


    //turn around
  case 8:
    if (frameCounter < (sec)) {
      image(decepStraight1, 120, 67.5);
      arrowDisplay('x', 'x', 'x', 'x');
    }
    if (frameCounter >= (sec)) {
      image(decep6, 120, 67.5);
      arrowDisplay('l', 'l', 'x', 'x');
      //talk to the man!
      if (keyPressed && keyCode == UP) {
        frameCounter = 0;
        scene = 7;
      }
      if (keyPressed && keyCode == LEFT) {
        frameCounter = 0;
        scene = 10;
      }
    }


    if (keyPressed && (key == 'e' || key == 'E')) {
      scene = 0;
    }
    image(playableExitText, 10, 10);
    frameCounter++;
    break;

  case 9: //endless highway trap is activated
    if (frameCounter < (sec)) {
      image(decepTalk1, 120, 67.5);
      arrowDisplay('x', 'x', 'x', 'x');
    }
    if (frameCounter >= (sec) && frameCounter < (sec * 2)) {
      image(decepTalk2, 120, 67.5);
      arrowDisplay('x', 'x', 'x', 'x');
    }
    if (frameCounter >= (sec * 2) && frameCounter < (sec * 6)) {
      image(decepTalk2, 120, 67.5);
      rectMode(CORNER);
      fill(255, 30, 30, (frameCounter - (sec*2))*20);
      rect(0, 0, 1360, 765);
      println(frameCounter - (sec*2));
    }
    if (frameCounter >= (sec * 6)) {
      scene = 2;
    }

    if (keyPressed && (key == 'e' || key == 'E')) {
      scene = 0;
    }
    image(playableExitText, 10, 10);
    frameCounter++;
    break;


    //go left from deception pass
  case 10:
    if (frameCounter < (sec)) {
      image(decepl1, 120, 67.5);
      arrowDisplay('x', 'x', 'x', 'x');
    }
    if (frameCounter >= (sec) && frameCounter < (sec * 2)) {
      image(decepl2, 120, 67.5);
      arrowDisplay('x', 'x', 'x', 'x');
    }
    if (frameCounter >= (sec* 2) && frameCounter < (sec * 3)) {
      image(decepl3, 120, 67.5);
      arrowDisplay('x', 'x', 'x', 'x');
    }
    if (frameCounter >= (sec * 3) && frameCounter < (sec * 4)) {
      image(decepl4, 120, 67.5);
      arrowDisplay('x', 'x', 'x', 'x');
    }
    if (frameCounter >= (sec * 4) && frameCounter < (sec * 5)) {
      image(decepl5, 120, 67.5);
      arrowDisplay('x', 'x', 'x', 'x');
    }
    if (frameCounter >= (sec * 5) && frameCounter < (sec * 6)) {
      image(decepl6, 120, 67.5);
      arrowDisplay('x', 'x', 'x', 'x');
    }
    if (frameCounter >= (sec * 6) && frameCounter < (sec * 7)) {
      image(decepl7, 120, 67.5);
      arrowDisplay('x', 'x', 'x', 'x');
    }
    if (frameCounter >= (sec * 7) && frameCounter < (sec * 8)) {
      image(decepl8, 120, 67.5);
      arrowDisplay('x', 'x', 'x', 'x');
    }
    if (frameCounter >= (sec * 8) && frameCounter < (sec * 9)) {
      image(decepl9, 120, 67.5);
      arrowDisplay('x', 'x', 'x', 'x');
    }
    if (frameCounter >= (sec * 9) && frameCounter < (sec * 10)) {
      image(decepl10, 120, 67.5);
      arrowDisplay('x', 'x', 'x', 'x');
    }
    if (frameCounter >= (sec * 10) && frameCounter < (sec * 11)) {
      image(decepl11, 120, 67.5);
      arrowDisplay('x', 'x', 'x', 'x');
    }
    if (frameCounter >= (sec * 11) && frameCounter < (sec * 15)) {
      fill(255, 255, 255, (frameCounter - (sec*11))*20);
      rectMode(CENTER);
      rect(width/2, height/2, 1120, 630);
      arrowDisplay('x', 'x', 'x', 'x');
    }
    if (frameCounter >= (sec * 15)) {
      scene = 12;
    }

    if (keyPressed && (key == 'e' || key == 'E')) {
      scene = 0;
    }
    image(playableExitText, 10, 10);
    frameCounter++;

    break;

  case 11:
    //supermarket (reuse code from park to bodie and vice versa)
    if (frameCounter < (sec)) {
      image(dept1, 120, 67.5);
      arrowDisplay('x', 'x', 'x', 'x');
    }
    if (frameCounter >= (sec) && frameCounter < (sec * 2)) {
      image(dept2, 120, 67.5);
      arrowDisplay('x', 'x', 'x', 'x');
    }
    if (frameCounter >= (sec* 2) && frameCounter < (sec * 3)) {
      image(dept3, 120, 67.5);
      arrowDisplay('x', 'x', 'x', 'x');
    }
    if (frameCounter >= (sec * 3) && frameCounter < (sec * 4)) {
      image(dept4, 120, 67.5);
      arrowDisplay('x', 'x', 'x', 'x');
    }
    if (frameCounter >= (sec * 4) && frameCounter < (sec * 8)) {
      image(dept5, 120, 67.5);
      rectMode(CENTER);
      fill(255, 255, 255, (frameCounter - (sec*4))*20);
      rect(width/2, height/2, 1120, 630);
      arrowDisplay('x', 'x', 'x', 'x');
    }
    if (frameCounter >= (sec * 8)) {
      frameCounter = 0;
      scene = 12;
    }

    if (keyPressed && (key == 'e' || key == 'E')) {
      scene = 0;
    }
    image(playableExitText, 10, 10);
    frameCounter++;
    break;



    //bodie
  case 12:
    image(bodie[0], 120, 67.5);
    if (keyPressed && (key == 'e' || key == 'E')) {
      frameCounter = 0;
      scene = 0;
    }
    if (keyPressed && keyCode == LEFT) {
      frameCounter = 0;
      scene = 13;
    }

    if (keyPressed && keyCode == RIGHT) {
      frameCounter = 0;
      scene = 15;
    }
    arrowDisplay('l', 'x', 'x', 'l');
    image(playableExitText, 10, 10);
    break;

  case 13:
    //bodie -> go left, talk to woman
    if (frameCounter < sec * 9) {
      image(bodie[(frameCounter/sec)+1], 120, 67.5);
      arrowDisplay('x', 'x', 'x', 'x');
    }
    if (frameCounter >= sec * 9) {
      image(bodie[10], 120, 67.5);
      arrowDisplay('l', 'x', 'x', 'x');
      if (keyPressed && keyCode == LEFT) {
        frameCounter = 0;
        scene = 14;
      }
    }
    if (keyPressed && (key == 'e' || key == 'E')) {
      frameCounter = 0;
      scene = 0;
    }
    image(playableExitText, 10, 10);
    frameCounter++;
    break;


  case 14:
    //talk to woman -> trap
    if (frameCounter < sec * 3) {
      image(bodie[(frameCounter/sec)+10], 120, 67.5);
      arrowDisplay('x', 'x', 'x', 'x');
    }
    if (frameCounter >= sec * 3 && frameCounter < sec * 6) {
      image(bodie[13], 120, 67.5);
      rectMode(CORNER);
      fill(255, 30, 30, (frameCounter - (sec*3))*20);
      rect(0, 0, 1360, 765);
      arrowDisplay('x', 'x', 'x', 'x');
    }
    if (frameCounter >= (sec * 6)) {
      background(0);
      image(DeadEnd2, 120, 67.5);
      image(deadEnd, 0, 0, width, height);
    }
    if (keyPressed && (key == 'e' || key == 'E')) {
      frameCounter = 0;
      scene = 0;
    }
    image(playableExitText, 10, 10);
    frameCounter++;
    break;

  case 15:
    //go inside bodie building
    if (frameCounter < (sec)) {
      image(house0, 120, 67.5);
      arrowDisplay('x', 'x', 'x', 'x');
    }
    if (frameCounter >= (sec) && frameCounter < (sec * 2)) {
      image(house1, 120, 67.5);
      arrowDisplay('x', 'x', 'x', 'x');
    }
    if (frameCounter >= (sec * 2) && frameCounter < (sec * 3)) {
      image(house2, 120, 67.5);
      arrowDisplay('x', 'x', 'x', 'x');
    }
    if (frameCounter >= (sec* 3)) {
      image(house3, 120, 67.5);
      imageMode(CENTER);
      image(small8ball, width/2, height/2);
      imageMode(CORNER);
      arrowDisplay('x', 'l', 'x', 'x');
      //step onto the docks
      if (keyPressed && keyCode == UP) {
        frameCounter = 0;
        scene = 16;
      }
    }

    if (keyPressed && (key == 'e' || key == 'E')) {
      scene = 0;
    }
    image(playableExitText, 10, 10);
    frameCounter++;
    break;

  case 16:
    //go inside building -> docks
    if (frameCounter < (sec)) {
      image(pier1, 120, 67.5);
      imageMode(CENTER);
      image(small8ball, width/2, height/2);
      imageMode(CORNER);
      arrowDisplay('x', 'x', 'x', 'x');
    }
    if (frameCounter >= (sec) && frameCounter < (sec * 2)) {
      image(pier2, 120, 67.5);
      imageMode(CENTER);
      image(med8ball, width/2, height/2);
      imageMode(CORNER);
      arrowDisplay('x', 'x', 'x', 'x');
    }
    if (frameCounter >= (sec* 2)) {
      image(pier3, 120, 67.5);
      imageMode(CENTER);
      image(large8ball, width/2, height/2);
      imageMode(CORNER);
      arrowDisplay('x', 'l', 'l', 'x');
      //approach thing
      if (keyPressed && keyCode == UP) {
        frameCounter = 0;
        scene = 17;
      }
      //run away
      if (keyPressed && keyCode == DOWN) {
        frameCounter = 0;
        scene = 18;
      }
    }

    if (keyPressed && (key == 'e' || key == 'E')) {
      scene = 0;
    }
    image(playableExitText, 10, 10);
    frameCounter++;

    break;

  case 17:
    //approach
    if (frameCounter < sec * 3) {
      background(0);
      image(pier3, 120, 67.5);
      image(hands[(frameCounter/sec)], 0, 0);
      arrowDisplay('x', 'x', 'x', 'x');
      fill(255, 255, 255);
      imageMode(CENTER);
      image(large8ball, width/2, height/2);
      imageMode(CORNER);
    }
    if (frameCounter >= sec * 3 && frameCounter < sec * 6) {
      background(0);
      image(pier3, 120, 67.5);
      image(hands[3], 0, 0);
      fill(255, 255, 255);
      imageMode(CENTER);
      image(large8ball, width/2, height/2);
      imageMode(CORNER);
      rectMode(CORNER);
      arrowDisplay('x', 'x', 'x', 'x');
      fill(255, 255, 255, (frameCounter - (sec*3))*20);
      rect(0, 0, 1360, 765);
    }


    if (frameCounter > sec * 6) {
      frameCounter = 0;
      scene = 18;
    }

    image(playableExitText, 10, 10);
    frameCounter++;
    break;

    //false menu
  case 18:
    if (frameCounter < (sec * 2)) {
      background(255);
      image(afraid, 0, 0);
    }

    if (frameCounter >= (sec * 2)) {
      background(255);
      noTint();
      image(afraid, 0, 0);
      tint(255, (frameCounter - (sec*3))*20);
      image(falseMenu, 0, 0);
      if (keyPressed && (key == 's' || key == 'S')) { //enter dream
        frameCounter = 0;
        scene = 3;
      }

      if (keyPressed && (key == 'e' || key == 'E')) { //close program
        exit();
      }
    }
    frameCounter++;
    break;

    //ultima ending (true ending)
  case 101:
    image(ending[((frameCounter/sec)+1)%3], 0, 0);
    frameCounter++;
    break;
  }
}
