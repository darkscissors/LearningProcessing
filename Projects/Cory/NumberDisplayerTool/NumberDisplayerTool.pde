
NumberDisplayer numDis;
ArrayList<Integer> nums2 = new ArrayList<Integer>();
Equation eq;
UI ui;
boolean viewMode = true;
void setup()
{
  size(1000,600);
  background(52);
  ui = new UI();
  eq = new Equation("y=16x+48");
  // println("Y(4): " + eq.getY(4));
  // println("b: " + eq.getB());

  //int highest = -999999;

  //generate();
  numDis = new NumberDisplayer(100,100);
  rerandomize();

}

void draw()
{
  numDis.show(nums2);
  if(!viewMode)
  {
    ui.show();
  }
}

void keyPressed() // key binds
{
  if (keyCode == java.awt.event.KeyEvent.VK_F1)
  {
    viewMode = !viewMode;
  }
  if(viewMode)
  {
    if(key == ' ') rerandomize();
    if(key == '1') numDis.changeSize(numDis.size + 10);
    if(key == '2') numDis.changeSize(numDis.size - 10);
  }
  else
  {
    if(key == ' ') generate();
    if(key == '1') numDis.changeSize(numDis.size + 10);
    if(key == '2') numDis.changeSize(numDis.size - 10);
  }
}



void mouseWheel(MouseEvent event) // mouse changing size of array to display
{
  float e = event.getCount();
  if(e >= 0)
  {
    numDis.changeSize(numDis.size + 1);
  }
  else
  {
    numDis.changeSize(numDis.size - 1);
  }
}

void generate()
{
  nums2.clear();
  int highest = -9999999;
  for(int i = 0; i < numDis.size; i++) //generate numbers from equation
  {
    nums2.add((int)eq.getY(i));
    if(eq.getY(i) > highest) highest = (int)eq.getY(i);
  }
  numDis.maxNum = highest;
}

void rerandomize()
{
  nums2.clear();
  for(int i = 0; i < numDis.size; i++)
  {
    nums2.add((int)random(0,numDis.maxNum));
  }
}
