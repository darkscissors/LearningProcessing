/*
this class has the ability to show and stop showing any class using their respective show() function
*/
Game game = new Game();
Pause pause = new Pause();
MainMenu menu = new MainMenu();

void setup()
{
  size(600,600);
  frameRate(60);
}

void draw()
{
  background(52);

  if(!menu.menuOpen)//if the main menu is not open we show the game
  {
    game.show(pause.isPaused); //we pass our pause state so that the game can act accordingly to being paused
    if(!pause.isPaused)
    {
      game.step();
    }
    else
    {
      pause.show();
    }
  }
  else// else we show the menu
  {
    menu.show();
  }
}

void mousePressed()
{
  if(menu.menuOpen)
  {
    menu.isClicked(mouseX,mouseY);

  }

}

void keyPressed() {
  if (key == ' ') game.player.jump();
  if (key == 'm') game.player.speed += 0.008;
  if (key == 'p') pause.isPaused = !pause.isPaused;
}
