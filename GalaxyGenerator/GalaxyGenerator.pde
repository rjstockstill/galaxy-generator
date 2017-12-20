import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;

Galaxy milky;
//Galaxy andro;
PeasyCam cam;

void setup() {
  size(800, 800, P3D);
  cam = new PeasyCam(this, 500);
  milky = new Galaxy(4, 20000, 230, 400, 3);
  //andro = new Galaxy(2, 20000, 230, 600, 3);
}

void draw() {
  background(0);
  milky.show();
  //andro.show();
}