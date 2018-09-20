import gifAnimation.*;

GifMaker gifExport;

int frames = 0;
int totalFrames = 360;

Polygon[] polygons = new Polygon[30];
float DISTANCE = 30.0;
float MAXRADIUS = polygons.length * DISTANCE;
int SEGMENTS = 4;
float ROTATION = TAU/totalFrames;

void setup() {
  size(400, 400);
  gifExport = new GifMaker(this, "../../rendered/export.gif", 100);
  gifExport.setRepeat(0); 
  
  for (int i = 0; i < polygons.length; i++) {
    polygons[i] = new Polygon(DISTANCE * i, SEGMENTS);
  }
}

void draw() {
  background(0);

  noFill();
  stroke(255);
  //strokeWeight(2);
  translate(width / 2, width / 2);
  rotate(frameCount * ROTATION); 

  for (int i = 0; i < polygons.length; i++) {
    polygons[i].update();
    polygons[i].render();
  }
  export();
}
