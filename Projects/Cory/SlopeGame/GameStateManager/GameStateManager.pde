/*
this class has the ability to show and stop showing any class using their respective show() function
*/
Game game = new Game();

void setup()
{
size(600,600);
frameRate(60);
}

void draw()
{
  background(52);
  game.show();
  game.xScale+=0.008;
}

void keyPressed() {
  if (key == ' ') game.player.jump();
}
