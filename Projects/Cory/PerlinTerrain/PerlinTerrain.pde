
int cols, rows;
final int size = 20;
int w = 1600;
int h = 2000;
float distance = 0;
float[][] terrain;

void setup() 
{
  size(600, 600, P3D);

  cols = w / size;
  rows = h / size;
  terrain = new float[cols][rows];
  
}

void draw() 
{
  distance += 0.05;
  float yScale = distance;
  for (int y = 0; y < rows; y++) 
  {
    float xScale = 0;
    for (int x = 0; x < cols; x++) 
    {
      terrain[x][y] = map(noise(xScale,yScale),0,1,-128,128);
      xScale += 0.08;
    }
    yScale += 0.08;
  }
  background(#1EAFFA);
  stroke(255);
  //noFill();
  fill(#4B2A06);
  translate(width/2, height/2);
  rotateX(-(2*PI)/3);
  translate(-w/2, -h/2);
  //fill(#1EAFFA);
  for (int y = 0; y < rows - 1; y++) 
  {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x++) 
    {
      vertex(x*size, y*size,terrain[x][y]);
      vertex(x*size, (y+1)*size,terrain[x][y+1]);
      //rect(i*size, k*size, size, size);
    }
    endShape();
  }
  
}
