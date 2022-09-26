PImage treeBackground; //<>//
PImage blueBG;
PImage greenNote;
PImage orangeNote;
PImage buildings;
PImage frontBuildings; // when images fall behind it
PImage justTree;
PImage treeAndBuildingBG;

boolean notesFall = false;
boolean oneNoteFalls = true;
int counter = 0;

int index = 0;

int numOfGreenNotes = 7;
int numOfOrangeNotes = 3;

int greenPosX = -100;
int greenPosY = -100;

int greenMaxX = -100;
int greenMinX = -280;
int greenMaxY = -100;
int greenMinY = -300;

int orangeMinX=70;
int orangeMaxX = 180;
int orangeMinY = -300;
int orangeMaxY = -100;

int posX = 0;

Notes [] allNotes = new Notes[10];
int count = 0;

void setup() {
  size(1080, 1080);
  blueBG = loadImage("Assets/blueBG.png");
  treeBackground = loadImage("Assets/treeBG.png");

  treeAndBuildingBG = loadImage("Assets/treeandbuildingBG.png");

  frontBuildings = loadImage("Assets/frontBuildings.png");
  justTree = loadImage("Assets/justTree.png");
  greenNote = loadImage("Assets/greenNote.png");
  orangeNote = loadImage("Assets/orangeNote.png");


  for (int i = 0; i < 10; i++) {
    if (i < numOfGreenNotes) { // import all the green notes;
      allNotes[i] = new Notes((random(greenMinX, greenMaxX)), (random(greenMinY, greenMaxY)), greenNote);
    } else { //import all the orange notes
      allNotes[i] = new Notes((random(orangeMinX, orangeMaxX)), (random(orangeMinY, orangeMinY)), orangeNote);
    }
  }
}

void draw() {
  image(blueBG, 0, 0);
  image(treeAndBuildingBG, 0, 0);

  for (int i = 0; i < 10; i++) {
    allNotes[i].display();
    allNotes[i].checkFalling();
    allNotes[i].notesFall();
  }
}

class Notes { //class for all notes
  float angle = 0;
  float xPos;
  float yPos;
  float origY;
  float xSpeed = cos(radians(angle*10)) * 20; // speed the note floats to using cos
  float ySpeed = sin(radians(angle*10)) * 40; // speed the note floats
  float rotation;
  PImage note;
  boolean startsFallingNote = false;
  float fallSpeed = 2;
  int randomStart = (int)random(1, 750);


  Notes(float x, float y, PImage noteColour) {
    xPos = x;
    yPos = y;
    origY = y;
    note = noteColour;
    rotation = 0;
  }

  void display() {
    pushMatrix();
    translate(width/2, height/2); // have it drawing from 0,0 centred.
    rotate(rotation);
    if (startsFallingNote && yPos > 200) {
      yPos += fallSpeed;
    }
    image(note, xPos, yPos);
    popMatrix();
  }

  void checkFalling() {
    if (frameCount % randomStart == 0 && yPos <= 200) {
      startsFallingNote = true;
    }
    if (startsFallingNote && yPos > 200) {
      yPos = origY;
      startsFallingNote = false;
    }
  }

  void notesFall() {
    if (startsFallingNote) { // 1 has fallen, then the next falls
      yPos += ySpeed;
      xPos += xSpeed;
    
      //yPos++;
      image(frontBuildings, 0, 0); // edit image later
    }
  }
}
