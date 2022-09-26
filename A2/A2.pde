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

boolean startsFalling = false;

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

//PImage [] allImages = new PImage[10];
Notes [] allNotes = new Notes[numOfGreenNotes+numOfOrangeNotes];
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

  //image(orangeNote, 100,0);

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

  for (int i=0; i < 10; i++) {
    allNotes[i].display();
  }

  if (mousePressed) {
    notesFall = true;
  }


  if (notesFall) { // 1 has fallen, then the next falls
    allNotes[counter].notesFall();
  }


  if (notesFall) {
    if (int(random(1, 50)) == 1) {
      startsFalling = true;
    }
  }
  



  /*
  //image(treeBackground, 0, 0);
   image(orangeNote, 70, height-400);
   pushMatrix();
   translate(width/2, height/2);
   tint(0, 153, 204);  // Tint blue
   image(orangeNote, 70, height-200);
   
   popMatrix()
   */
}



class Notes { //class for all notes
  float angle = 0;
  float xPos;
  float yPos;
  float originalYPos;
  float xSpeed = cos(radians(angle*10)) * 20; // speed the note floats to using cos
  float ySpeed = sin(radians(angle*10)) * 40; // speed the note floats
  float rotation;
  PImage note;


  Notes(float x, float y, PImage noteColour) {
    xPos = x;
    yPos = y;
    note = noteColour;
    rotation = 0;
    originalYPos = y;
  }

  void display() {
    pushMatrix();
    translate(width/2, height/2); // have it drawing from 0,0 centred.
    rotate(rotation);
    image(note, xPos, yPos);
    popMatrix();
  }
  
  
  void reset(){
    
  }

  void notesFall() {

    yPos+=5;
   
    image(frontBuildings, 0, 0); // edit image later


    if (yPos > 200) {

      // trigger the next none
      counter++;
      println(counter);
      oneNoteFalls = false;
    }
    if (counter > numOfGreenNotes+numOfOrangeNotes-1) {
      counter = 0;
      yPos = originalYPos;
      display();
    }



    if (notesFall && startsFalling) { // 1 has fallen, then the next falls
    }
  }
}
