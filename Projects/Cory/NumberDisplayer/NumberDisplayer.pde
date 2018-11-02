import java.util.ArrayList;
int size = 50;
//int[] nums = new int[size];
ArrayList<Integer> nums2 = new ArrayList<Integer>();

void setup()
{
  size(1000,600);
  rerandomize();
}

void draw()
{
  background(52);
  drawNumbers();
  fill(100,100,255);
  text("Size: " + size, 10,10);
}

void keyPressed() // key binds
{
  if(key == ' ') rerandomize();
}

void mouseWheel(MouseEvent event) // mouse changing size of array to display
{
  float e = event.getCount();
  if(e >= 0)
  {
    changeSize(size + 1);
  }
  else
  changeSize(size - 1);
}

void changeSize(int newSize) // we use a function to change size so we dont have to remember to rerandomize the numbers
{
  size = newSize;
  if(newSize > size)
  nums2.add((int)random(0,100));


  rerandomize();
}

void drawNumbers() // this function draws the numbers using rectangles to represent each number and draws the number or each rectangle below it, we stagger the numbers so it is more easily readable
{
  fill(255,100,100);
  for (int i = 0; i < size; i++)
  {

    int x = (int)map(i,0,size,0,width);
    stroke(100,255,100);
    int recHeight =(int)map(nums2.get(i),0,100,1,550);
    rect(x,550,width/size,-1 * recHeight);
    int xmid = x + (width/size)/2;
    stroke(0);
      if(i % 2 == 0)
      {

        text(nums2.get(i),xmid,575);
        line(xmid,550,xmid,575);
      }
      else
      {
        text(nums2.get(i),xmid,590);
        line(xmid,550,xmid,590);
      }
      // if(i % 3 == 0)
      // {
      //   line(xmid,550,xmid,575);
      //   text(nums2.get(i),xmid,565);
      // }
      // if(i % 3 == 1)
      // {
      //   line(xmid,550,xmid,580);
      //   text(nums2.get(i),xmid,575);
      // }
      // if(i % 3 == 2)
      // {
      //   line(xmid,550,xmid,590);
      //   text(nums2.get(i),xmid,585);
      // }
  }
}

void rerandomize()
{
  // for(int i = 0; i < nums.length; i++)
  //   nums[i] = (int)random(0,100);
    nums2.clear();
  for(int i = 0; i < size; i++)
    nums2.add((int)random(0,100));
}
