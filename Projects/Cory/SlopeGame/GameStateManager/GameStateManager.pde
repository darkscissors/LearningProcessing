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
}

void keyPressed() {
  if (key == ' ') game.player.jump();
  if (key == 'm') game.player.speed += 0.01;
}
