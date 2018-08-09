
Bird bird = new Bird(100,300);
import java.util.ArrayList;

ArrayList<Wall> walls = new ArrayList<Wall>();

boolean jumped = false;
boolean started = false;

void setup() 
{
  size(600,600);
  
  walls.add(new Wall(0,300,150));
  
  walls.add(new Wall(300,300,150));
}


//Wall wall = new Wall(150,300,150);

void mouseClicked() 
{
  
  //walls.add(new Wall(150,300,150));
  
}

void resetWalls() 
{
  for(int i = 0; i < walls.size(); i++)
  {
    walls.get(i).x = i * 300;
    walls.get(i).randomize();
    
  }
  
}


void draw() 
{
  rectMode(CORNER);
  background(51);
   
  bird.show();
  fill(0);
  text(bird.score,bird.x, bird.y);
  for(Wall w : walls) 
  {
    w.show();
    w.collision(bird);
  }
  //wall.show();
  //wall.collision(bird);
  if(started && !bird.dead)
  {
  bird.step();
  for(Wall w : walls) 
  w.step();
  }
  else
  {
    //textMode(CENTER);
    fill(255);
    text("YOU DIED",width/2, height/2);
  }
}

void keyPressed() {
  if(!jumped)
  if (key == ' ') {
    jumped = true;
    started = true;
  bird.jump();
  //println("jumped");
  if(bird.dead) 
  {
    bird.dead = false;
    //bird.jump();
    bird.y = 300;
    resetWalls();
  }
  }
  //if(key == 'a') 
  //{
  //wall.gap += 5;
  //println("gap: " + wall.gap);
  //}
  //if(key == 'z') 
  //{
  //wall.mid += 5;
  //println("mid: " + wall.mid);
  //}
  //if(key == 's') 
  //{
  //wall.gap -= 5;
  //println("gap: " + wall.gap);
  //}
  //if(key == 'x') 
  //{
  //wall.mid -= 5;
  //println("mid: " + wall.mid);
  //}
}

void keyReleased() 
{
  if (key == ' ') {
   jumped = false; 
  }
  
}
