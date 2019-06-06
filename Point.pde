class Point {
  PVector pos;
  Point() {
    this.pos = new PVector(0,0);
  }
  void update() {
    this.pos.set(mouseX, mouseY);
  }
  void show() {
    int count=80;
    PVector a;
    for (float i=0; i<TWO_PI; i+=TWO_PI/count) {
      a = boundary(this.pos, i+0.45);
      line(this.pos.x, this.pos.y, a.x, a.y);
    }
  }
  PVector boundary(PVector pos, float i) {
    PVector dir = PVector.fromAngle(i);
    PVector p = pos.copy();
    for (int j=0; j<walls.length; j++) {
      float x1, y1, x2, y2, x3, y3, x4, y4;
      x1=walls[j].a.x;
      y1=walls[j].a.y;
      x2=walls[j].b.x;
      y2=walls[j].b.y;

      x3 = pos.x;
      y3 = pos.y;
      x4 = pos.x + dir.x;
      y4 = pos.y + dir.y;

      float den = (x1-x2)*(y3-y4)-(y1-y2)*(x3-x4);
      if (den==0) {
        continue;
      }
      float t = ((x1-x3)*(y3-y4)-(y1-y3)*(x3-x4))/den;
      float u = -((x1-x2)*(y1-y3)-(y1-y2)*(x1-x3))/den;
      if (t > 0 && t<1 && u>0) {
        float ptx, pty;
        ptx=x1+t*(x2-x1);
        pty=y1+t*(y2-y1);
        PVector q =new PVector(ptx, pty);
        if(pos.dist(q) < pos.dist(p) || pos.dist(p)==0){
         p=q;
        }
      }
    }
    return p;
  }
}
