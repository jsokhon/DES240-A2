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
Notes [] allNotes = new Notes[10];
int count = 0;

void setup() {
  size(1080, 1080);
  blueBG = loadImage("Assets/blueBG.png");
  //image(blueBG, 0, 0);
  treeBackground = loadImage("Assets/treeBG.png");
  //image(treeBackground, 0, 0);
  //buildings = loadImage("Assets/buildings.png");
  //image(buildings, 0, 0);

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

  if (notesFall && oneNoteFalls) { // 1 has fallen, then the next falls 
    //allNotes[1].notesFall();
    for (int i=0; i < 10; i++) { // iterates thru what falls
      
      allNotes[i].notesFall();
      oneNoteFalls = true;
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
}


class Notes { //class for all notes
  float angle = 0;
  float xPos;
  float yPos;
  float xSpeed = cos(radians(angle*10)) * 20; // speed the note floats to using cos
  float ySpeed = sin(radians(angle*10)) * 40; // speed the note floats
  float rotation;
  PImage note;


  Notes(float x, float y, PImage noteColour) {
    xPos = x;
    yPos = y;
    note = noteColour;
    rotation = 0;
  }

  void display() {
    pushMatrix();
    translate(width/2, height/2); // have it drawing from 0,0 centred.
    rotate(rotation);
    image(note, xPos, yPos);
    popMatrix();
  }

  void notesFall() {
    
    /*
    if (yPos > height) {
      yPos = 0;
    }
    */
    yPos++;
    image(frontBuildings, 0, 0); // edit image later
    
    if (yPos >height-20){
      oneNoteFalls = false;
    }

    /*
    yPos = yPos + ySpeed;
     xPos = xPos + xSpeed;
     if (yPos > height-20) {
     ySpeed = 0;
     xSpeed = 0;
     }
     if (yPos < height-20) {
     rotation = random(0, PI);
     }
     */


    /*
    xPos = xPos + xSpeed;
     yPos = yPos + ySpeed;
     yPos = max(yPos,-yPos);
     angle ++;
     if (yPos < height-400) {   // hides behind the buildings)
     xSpeed = 0;
     ySpeed = 0;
     }
     
     if (yPos > height-400) {
     
     
     }
     */
  }
}
