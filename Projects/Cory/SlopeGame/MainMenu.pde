/*
this class is going to have:
a play() function to take the player to the game and stop displaying this class
*/
public class MainMenu
{
boolean menuOpen;
int sizeX,sizeY;
  public MainMenu()
  {
    menuOpen = true;
    sizeX = 85;
    sizeY = 85/2;
  }

  public void show()
  {
    fill(100,240,125);

    rect(width/2,height/2,sizeX,sizeY);

  }

  public void isClicked(int x, int y)
  {
    // checks if the click is in the menu area
    if(x >= width/2 && x <= width/2 + sizeX)
      if(y >= height/2 && x <= height/2 + sizeY)
      {
        menuOpen = false;
      }
  }

}
