Wall[] walls = new Wall[5];
Point p;
void setup() {
    size(800, 600);
    walls[0] = new Wall(0, 0, 0, height);
    walls[1] = new Wall(0, height, width, height);
    walls[2] = new Wall(width, height, width, 0);
    walls[3] = new Wall(0, 0, width, 0);
    walls[4] = new Wall(600,200,750,450);
    p = new Point();
    background(0);
    stroke(255, 70);
}
void draw() {
    background(0);
    p.show();
    p.update();
}
