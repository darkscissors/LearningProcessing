

public class Wall 
{
  float x, mid;
  float gap;
  float speed;
  float w;
  float topY, botY;
  boolean hasReset = true;
  
  int difficulty;
  
  public Wall(float x, float mid, float gap) 
  {
    difficulty = 0;
    this.x = x;
    this.mid = mid;
    this.gap = gap;
    speed = 6;
    w = 100;
  }
  
  public Wall(float x) 
  {
    difficulty = 0;
    this.x = x;
    this.mid = height/2;
    this.gap = 150;
    speed = 6;
    w = 100;
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
    x = width;
    randomize();
    }
    
    this.x -= speed;
    
  }
  
  public void collision(Bird b) 
  {
    
  if(abs(b.x - x ) < w/2)
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
  
  float clamp(float input, float min, float max) 
  {
    if(input >= min && input <= max) 
    return input;
    else if (input <= min)
    return min;
    else if (input >= max)
    return max;
    else return -1;
  }
  
  void randomize() 
  {
    float newGapMax = clamp(-(difficulty * 10) + height/4,height*.1,height/4);
    //float gap_ = clamp(newGap,height*.1,height/4 );
    gap = abs(random(height*.08,newGapMax));
    
    if(gap < height*.08) gap = height*.08;
    
    mid = random(gap + 10, height - gap - 10);
    hasReset = true;
    
    
  }

}
