/*
this class is going to have:
a show() function used to show the pause menu
*/
public class Pause
{
  boolean isPaused;

  public Pause()
  {
    isPaused = false;
  }

  public void show()
  {
    isPaused = true;
    fill(255,100,95);

    if(frameCount % 60 <= 30)
    rect(30,20,55,55);
  }

}
