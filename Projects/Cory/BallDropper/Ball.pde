import java.awt.Point;
import java.util.ArrayList;
public class Ball 
{
  public float x, y, r;
  public color c1,c2,c3;
  public float vX,vY;
  ArrayList<Point> points = new ArrayList<Point>();

  
  
  public Ball(float x, float y, float r) 
  {
    this.x = x;
    this.y = y;
    vX = random(-5,5);
    vY = 0;
    this.r = r/2;
    c1 = color(random(0,255), random(0,255), random(0,255));
    this.c2 = color((int)random(0,255));
    this.c3 = color((int)random(0,255));

  }
  
  void show() 
  {
    strokeWeight(1);
    fill(c1);
    ellipseMode(CENTER);
    ellipse(x,y,r,r);
    for(int i = 0; i < points.size() - 1; i++) 
    {
      strokeWeight(2);
      line((float)points.get(i).getX(),(float)points.get(i).getY(),(float)points.get(i+1).getX(),(float)points.get(i+1).getY());
    }
    noFill();
  }
  
  void step() 
  {
    points.add(new Point((int)x,(int)y));
    if(x >= width - r/2 || x <= 0 + r/2) {vX *= -1;}
    if(y >= height - r/2 || y <= 0 + r/2) {vY *= -1; vY += .25;}
    
    
    vY += .25;
    vX += 0;
    x += vX;
    y += vY;
    
    
    
  }
}
