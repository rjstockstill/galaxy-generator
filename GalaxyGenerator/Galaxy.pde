import java.util.Random;

class Galaxy {
  int arms;
  int stars;
  int div;
  int rad;
  float spread;
  int prox;
  int angle;
  double degreeToRadian = PI / 180.0f;
  final PVector center = new PVector(0,0);
  ArrayList vecStars = new ArrayList();
  Random rand = new Random();
  
  
  Galaxy(int arm, int star, int d, int r, int p){
    arms = arm;
    stars = star;
    div = d;
    rad = r;
    prox = p;
    
    spread = div / arms;
    angle = (360/arms) % 360;
    
    for(int i = 0; i < stars; i++) {
      vecStars.add(createPoint());
      println(vecStars.get(i));
    }
  }
  
  
  PVector createPoint() {
    float line = line(rad);
    float tempFloat;
    int temp = rand.nextInt(2);
    if(temp == 0)
      tempFloat = (float)(1.0);
    else
      tempFloat = (float)(-1.0);
    float f = (line(spread)) * tempFloat;
    float a = (rand.nextInt() % arms) * angle;
    int x = (int)(line * cos((float)(degreeToRadian * (a + f + line))));
    int y = (int)(line * sin((float)(degreeToRadian * (a + f + line))));
    PVector p = new PVector(x,y);
    return p;
  }
  
  
  float line(float fl) {
    float f = (fl * fl / 2) * rand.nextFloat();
    return fl - (float)sqrt(fl * fl - 2 * f);
  }
  
  
  PVector translate(PVector p, PVector center, int i, int prox) {
    int a = (int)(center.x / prox - (int)(i * 0.5));
    int b = (int)(center.y / prox - (int)(i * 0.5));
    int x = (int)(p.x / prox - a);
    int y = (int)(p.y / prox - b);
    return new PVector(x,y);
  }
  
  
  PVector getPoint(int i) {
    return (PVector)vecStars.get(i);
  }
  
  
  void drawStar(PVector p) {
    pushMatrix();
    
    //translate(p.x, p.y, p.z);
    fill(255);
    rect(p.x,p.y,1,1);
    //PShape globe = createShape(SPHERE, 5);
    //shape(globe);
    popMatrix();
  }
  
  void show() {
    noStroke();
    fill(255);
    for(int i = 0; i < vecStars.size(); i++) {
      PVector tempVector = translate(getPoint(i), center, 400, 3);
      drawStar(tempVector);
    }
  }
}