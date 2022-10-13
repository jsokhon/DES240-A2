PImage greenNote1; //<>//
PImage greenNote2;
PImage orangeNote1;
PImage orangeNote2;
PImage frontBuildings; // when images fall behind it
PImage treeBG; // initial background
PImage sky1;
PImage sky2;

int numOfGreenNotes = 7;
int numOfOrangeNotes = 3;


// to ensure the generated notes are within their respective sections.
int greenMaxX = -100;
int greenMinX = -280;
int greenMaxY = -100;
int greenMinY = -300;

int orangeMinX=70;
int orangeMaxX = 180;
int orangeMinY = -300;
int orangeMaxY = -100;


float posX [] = new float[2];

Notes [] allNotes = new Notes[10];

int count =0;

void setup() {
  size(1080, 1080);
  treeBG = loadImage("Assets/treeAndBuildingsBG.png");
  sky1 = loadImage("Assets/sky1.png");
  sky2 = loadImage("Assets/sky2.png");
  frontBuildings = loadImage("Assets/frontBuildings.png");
  greenNote1 = loadImage("Assets/greenNote.png");
  orangeNote1 = loadImage("Assets/orangeNote.png");
  greenNote2 = loadImage("Assets/greenNote2.png");
  orangeNote2 = loadImage("Assets/orangeNote2.png");

  frameRate(60);

  posX[0] = -540;
  posX[1] = 540;

  for (int i = 0; i < 10; i++) {
    if (i < numOfGreenNotes) { // import all the green notes;
      if (i % 2 == 0) {
        allNotes[i] = new Notes((random(greenMinX, greenMaxX)), (random(greenMinY, greenMaxY)), greenNote1);
      } else {
        allNotes[i] = new Notes((random(greenMinX, greenMaxX)), (random(greenMinY, greenMaxY)), greenNote2);
      }
    } else { //import all the orange notes
      if (i % 2 == 0) {
        allNotes[i] = new Notes((random(orangeMinX, orangeMaxX)), (random(orangeMinY, orangeMaxY)), orangeNote2);
      } else {
        allNotes[i] = new Notes((random(orangeMinX, orangeMaxX)), (random(orangeMinY, orangeMaxY)), orangeNote1);
      }
    }
  }
}

void draw() {

  // rotating sky background
  image(sky1, posX[0], 0);
  image(sky2, posX[1], 0);

  for (int i = 0; i <2; i++) {
    if (posX[i]> -1080) {
      posX[i] -= 1;
    } else {
      posX[i] = 1080;
    }
  }


  image(treeBG, 0, 0);

  for (int i = 0; i < 10; i++) {
    allNotes[i].display();
    allNotes[i].checkFalling();
    allNotes[i].notesFall();
  }
}


class Notes { //class for all notes
  float xPos;
  float yPos;
  float origY;
  PImage note;
  boolean startsFallingNote = false;
  int randomStart = (int(random(1, 750)));
  float gravity= 0.06;
  float fallSpeed = 0.5;


  Notes(float x, float y, PImage noteColour) {
    xPos = x;
    yPos = y;
    origY = y;
    note = noteColour;
  }

  void display() {
    pushMatrix();
    translate(width/2, height/2);
    image(note, xPos, yPos);
    popMatrix();
    image(frontBuildings, 0, 0);
  }

  void checkFalling() {
    if (frameCount % randomStart == 0 && yPos <= 200) {
      startsFallingNote = true;
    }
    if (startsFallingNote && yPos > 200) {
      yPos = origY;
      startsFallingNote = false;
      fallSpeed = 1;
    }
  }

  void notesFall() {
    if (startsFallingNote) {
      fallSpeed += gravity;
      yPos += fallSpeed;
    }
  }
}
