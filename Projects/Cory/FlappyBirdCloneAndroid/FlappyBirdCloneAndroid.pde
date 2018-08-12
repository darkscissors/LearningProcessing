
Bird bird;
import java.util.ArrayList;

ArrayList<Wall> walls = new ArrayList<Wall>();

boolean jumped = false;
boolean started = false;

void setup() 
{
  fullScreen();
  //noStroke();
  //size(600,600);

  walls.add(new Wall(width*.5));
  walls.add(new Wall(width*.75));
  walls.add(new Wall(width));
  bird = new Bird();
}


//Wall wall = new Wall(150,300,150);

void mouseClicked() 
{

  jumpBird();

}

void resetWalls() 
{
  for (int i = 0; i < walls.size(); i++)
  {
    walls.get(i).randomize();
    walls.get(i).difficulty = bird.score;
  }
}

void jumpBird() 
{
//if (!jumped)
        jumped = true;
        started = true;
        bird.jump();
        //println("jumped");
        if (bird.dead) 
        {
          bird.dead = false;
          //bird.jump();
          bird.y = height/2;
          resetWalls();
        }
      
}

void touchStarted() 
{

  jumpBird();
  
  
}

void draw() 
{
  rectMode(CORNER);
  background(51);



  bird.show();
  fill(0,127,150);
  textSize(64);
  text(bird.score, bird.x, bird.y);
  for (Wall w : walls) 
  {
    w.show();
    w.collision(bird);
  }
  //wall.show();
  //wall.collision(bird);
  if (started && !bird.dead)
  {
    bird.step();
    for (Wall w : walls) 
      w.step();
  } else
  {
    //textMode(CENTER);
    fill(255);
    text("YOU DIED", width/2, height/2);
  }
}
