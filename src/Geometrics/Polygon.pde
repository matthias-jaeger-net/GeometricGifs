class Polygon {
  float x = 0;
  float y = 0; 
  float radius; 
  int npoints;
  float ir;

  Polygon(float r, int n) {
    radius = ir = r;
    npoints = n;
  }

  void update() {
    if (radius <= DISTANCE*0.2) {
      radius = MAXRADIUS;
    } else {
      radius-=0.8234;
    }
  }

  void render() {
    strokeWeight(map(radius, 0, MAXRADIUS, 1, DISTANCE));
    float angle = TWO_PI / npoints;
    beginShape();
    for (float a = 0; a < TWO_PI; a += angle) {
      float sx = x + cos(a) * radius;
      float sy = y + sin(a) * radius;
      vertex(sx, sy);
    }
    endShape(CLOSE);
  }
}
