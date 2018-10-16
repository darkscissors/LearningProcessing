

class Bird
{

  float jump;
  float x, y;
  float grav;
  float vY;
  boolean dead = false;
  int score;
  float speed;
  float belowWall = 0;

  boolean goingDown = false;

  public Bird(float x, float y)
  {
    this.x = x;
    this.y = y;
    jump = -16;
    grav = .8;
    this.vY = 0;
    score = 0;
  }

  public void step()
  {
    //if the birds height is above or equal to the bottom of the screen then we set them to it and remove their velocity

    if(y > height - belowWall)
    {
      y = height - belowWall;
      vY = 0;

    }
    else
    {
    //we add gravity to the players velocity
    vY += grav;  //gravity pulls them downward (pos number)
    y += vY;  //velocity is added to their height (higher number = lower to screen)

  }
    //if(dead)
    //println("DEAD");

  }

  public void show()
  {
    fill(255);
    if(goingDown)
    fill(255,0,0);
    ellipse(x,y,32,32);

  }


  public void jump()
  {
    if(!dead)
    {
    vY = 0;  //reset their velocity so you dont have to spam the jump key to recover
    vY = jump;  //set velocity to jump velocity so that the player cant build up additional velocity
    y += vY;  //imediatly set the player height to the new vY so we dont trip the first step if statement
    }
  }

}
