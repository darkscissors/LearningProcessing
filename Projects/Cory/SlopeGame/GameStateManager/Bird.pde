

class Bird
{

  float jump;
  float x, y;
  float grav;
  float vY;
  float speed;
  float belowWall = 0;
  boolean isJumping = false;

  boolean goingDown = false;

  public Bird(float x, float y)
  {
    this.x = x;
    this.y = y;
    jump = -16;
    grav = .8;
    this.vY = 0;
  }

  public void step()
  {
    //if the birds height is above or equal to the bottom of the screen then we set them to it and remove their velocity
    if(speed < 0) speed = 0;
    if(y > height - belowWall)
    {
      y = height - belowWall;
      vY = 0;
      isJumping = false;

    }
    else
    {
    //we add gravity to the players velocity
    vY += grav;  //gravity pulls them downward (pos number)
    y += vY;  //velocity is added to their height (higher number = lower to screen)
    isJumping = true;
  }

  }

  public void show()
  {
    fill(255,255,255,150);
    if(goingDown)
    fill(0,255,0,150);
    ellipse(x,y,32,32);
  }


  public void jump()
  {
    goingDown = false; //reset going down in order to make the player not stay green in the air
    vY = 0;  //reset their velocity so you dont have to spam the jump key to recover
    vY = jump;  //set velocity to jump velocity so that the player cant build up additional velocity
    y += vY;  //imediatly set the player height to the new vY so we dont trip the first step if statement

  }

}
