PImage treeBackground;
PImage greenNote;
PImage orangeNote;
PImage buildings;

int numOfGreenNotes = 5;
int numOfOrangeNotes = 1;

void setup(){
  size(1080,1080);
  background(0);
  treeBackground = loadImage("Assets/treeBG.png");
  image(treeBackground,0,0);
  buildings = loadImage("Assets/buildings.png");
  image(buildings,0,0);
  
  greenNote = loadImage("Assets/greenNote.png");
  orangeNote = loadImage("Assets/orangeNote.png");
  image(greenNote, 5,50);
  image(orangeNote, 100,0);
  
}

void draw(){
  
  
}

void leavesFall(){}


void mousePressed(){
  leavesFall();
}
