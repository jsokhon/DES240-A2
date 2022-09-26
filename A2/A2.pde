 //<>//
PImage greenNote;
PImage orangeNote;
PImage frontBuildings; // when images fall behind it
PImage treeBG;

int numOfGreenNotes = 7;
int numOfOrangeNotes = 3;

int greenPosX = -100;
int greenPosY = -100;


// to ensure the generated notes are within their respective sections. 
int greenMaxX = -100;
int greenMinX = -280;
int greenMaxY = -100;
int greenMinY = -300;

int orangeMinX=70;
int orangeMaxX = 180;
int orangeMinY = -300;
int orangeMaxY = -100;


Notes [] allNotes = new Notes[10];

void setup() {
  size(1080, 1080);
  treeBG = loadImage("Assets/treeBG.png");
  frontBuildings = loadImage("Assets/frontBuildings.png");
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
  image(treeBG, 0,0);

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
  PImage note;
  boolean startsFallingNote = false;
  int randomStart = (int)random(1, 750);
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
    translate(width/2, height/2); // have it drawing from 0,0 centred.
    image(note, xPos, yPos);
    popMatrix();
    image(frontBuildings, 0, 0); // edit image later
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
    if (startsFallingNote) { // 1 has fallen, then the next falls
      fallSpeed += gravity;
      yPos += fallSpeed;
    }
  }
}
