import gifAnimation.*;

GifMaker gifExport;

int frames = 0;
int totalFrames = 300;

Polygon[] polygons = new Polygon[100];
float DISTANCE = 20.0;
float MAXRADIUS = polygons.length * DISTANCE;
int SEGMENTS = 3;
float ROTATION = 0.006;

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
  strokeWeight(4);
  translate(width / 2, width / 2);
  rotate(frameCount * ROTATION); 

  for (int i = 0; i < polygons.length; i++) {
    polygons[i].update();
    polygons[i].render();
  }
  export();
}
