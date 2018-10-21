/*
this class will have:
a jump() function to jump to the player
a die() function to kill the player
automatic move() function to move the player to the right
*/
class Game
{
public Bird player;
float terrain;
float xScale; // the current distance from 0 the line has been moved, increment this for boosts
float distance;
float terrainMap[] = new float[width];
  public Game()
  {
    player = new Bird(100,350);
    xScale = 0;
    distance = 0;

  }

  public void show(boolean paused)
  {
    //game.xScale+=0.008 + game.player.speed * 1.25; // this line determines how fast the game scrolls
    drawGround();
    player.show();
    text("Speed: " + player.speed * 1000, 10, 30);
  }

  public void step()
  {
    game.xScale+=0.008 + game.player.speed * 1.25; // this line determines how fast the game scrolls
    player.step();
    if(!player.isJumping) // here we check if the player is in the air to not apply the modification of velocity
      {
      modBirdVel();
      }
  }

  public void modBirdVel()
  {

    if(terrainMap[(int)player.x] > terrainMap[(int)player.x + 10])
    {
      //print("going down");
      player.goingDown = true;
      //xScale += 0.003*(terrainMap[(int)player.x] - terrainMap[(int)player.x + 5]);
      player.speed += 0.0003*(terrainMap[(int)player.x] - terrainMap[(int)player.x + 5]);

    }
    else
    {
      player.goingDown = false;
      player.speed += 0.00009*(terrainMap[(int)player.x] - terrainMap[(int)player.x + 5]);
      player.speed *= .95;
      //print("going up");

    }
    //xScale += player.speed / 4;

  }

  public void drawGround()
  {
    terrainMap = new float[width];
    float xScale_ = xScale; //the underscore version is a temporary variable to for drawing
    for (int x = 0; x < width; x++)
    {
        terrain = map(noise(xScale_),0,1,1,300);
        xScale_ +=0.003;
        terrainMap[x] = terrain;
      }

      for(int k = 0; k < terrainMap.length; k++)
      {
        fill(255,100,100);
        noStroke();
        ellipse(k,(int)height - terrainMap[k],4,4);
      }

      player.belowWall = terrainMap[(int)player.x];
      //ellipse(x,height - terrain,4,4);

      //if(x == 100) player.belowWall = terrain; // the terrain at 100 is the same X cord the player is at always


  }

}
