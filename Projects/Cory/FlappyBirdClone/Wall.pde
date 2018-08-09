

public class Wall 
{
  float x, mid;
  float gap;
  float speed;
  float w;
  float topY, botY;
  boolean hasReset = true;
  public Wall(float x, float mid, float gap) 
  {
    
    this.x = x;
    this.mid = mid;
    this.gap = gap;
    speed = 6;
    w = 25;
  }
  
  public void show() 
  {
    float botLen = -mid + gap;
    float topLen = height - mid - gap;
    
    
    topY = height + botLen;
    botY = topLen;
    
    fill(255);
    rect(x,height,w,botLen);//bottom
    fill(89);
    rect(x,0, w,topLen);//top
    fill(0,25,255);
    ellipse(x + (w/2),topY,16,16);
    fill(0,255,255);
    ellipse(x + (w/2),botY,16,16);
    
  }
  
  public void step() 
  {
    if(x < 0)
    {
    x = width + 25;
    randomize();
    }
    
    this.x -= speed;
    
  }
  
  public void collision(Bird b) 
  {
    
  if(abs(b.x - x ) < w)
  {
    //println("checked" + frameCount);
    if(b.y > topY || b.y < botY)
    {
      b.dead = true; // bird was not inbetween the walls when they passed them
      b.score = 0;
    }
      else if(hasReset)
      {
      b.score++;
      hasReset = false;
    }
  }
    

  }
  
  void randomize() 
  {
    gap = random(75,175);
    mid = random(gap + 10, height - gap - 10);
    hasReset = true;
    
    
  }

}
