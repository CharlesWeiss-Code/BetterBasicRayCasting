class ray {
  PVector pos = new PVector (0, 0);
  PVector dir;
  float mag = 10;

  ray(float x, float y, float a) {
    pos.x = x;
    pos.y = y;
    dir = PVector.fromAngle(a);
    dir.setMag(mag);
  }

  void update(float x, float y) {
    pos.set(x, y);
  }

  void show() {
    push();
    stroke(255);
    //translate(pos.x, pos.y);
    ellipse(pos.x, pos.y, 16,16);
    pop();
  }

  void collideWall() {
    PVector intPoint = null;
    float intPointx;
    float intPointy;

    float x1 = b.a.x;
    float y1 = b.a.y;
    float x2 = b.b.x;
    float y2 = b.b.y;

    float x3 = pos.x;
    float y3 = pos.y;
    float x4 = pos.x + dir.x;
    float y4 = pos.y + dir.y;

    float den = ((x1 - x2) * (y3 - y4)) - ((y1 - y2) * (x3 - x4));

    float t = (((x1 -x3) * (y3-y4)) - ((y1 - y3) * (x3 - x4)))/den;
    float u = -(((x1-x2) * (y1-y3)) - ((y1 - y2) * (x1 - x3)))/den;

    if (t >= 0 && t <= 1 && u <= 1) {
      intPointx = x1 + t * (x2 - x1);
      intPointy = y1 + t * (y2 - y1); 
      intPoint = new PVector (intPointx, intPointy);
    }
    if (intPoint != null) {
      stroke(255);
      line(pos.x,pos.y,intPoint.x,intPoint.y);
    } else {
    }
  }
}
