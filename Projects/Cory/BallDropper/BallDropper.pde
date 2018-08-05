import java.util.ArrayList;
ArrayList<Ball> balls = new ArrayList<Ball>();
//Ball b = new Ball(100,100,100);
void setup() 
{
  size(800,800);
  
}

void draw() 
{
  background(52);
  for(Ball ba : balls) 
  {
    ba.show();
    ba.step();
  }
  
}

void mouseClicked() 
{

  balls.add(new Ball(mouseX,mouseY,42));
  
}

void keyPressed() {
  if (key == ' ') 
  {
    balls.clear();
  }
  
  
}
