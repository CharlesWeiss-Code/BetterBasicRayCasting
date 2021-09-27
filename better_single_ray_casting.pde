boundary b;
ArrayList<ray> sun = new ArrayList<ray>();

void setup() {
  fullScreen();
  b = new boundary(random(width),random(height),random(width),random(height));
  for (float i = 0; i < 2*PI; i += .05) {
    sun.add(new ray(width/2,height/2,i));
  }
}

void draw() {
  background(0);
  b.show();
  rayStuff();
}

void rayStuff() {
  for (ray r : sun) {
    r.show();
    r.collideWall();
    r.update(mouseX,mouseY);
  }
}
