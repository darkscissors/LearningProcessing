import java.util.ArrayList;

class NumberDisplayer
{
  int size;
  ArrayList<Integer> nums2 = new ArrayList<Integer>();
  public NumberDisplayer()
  {

  }

  void show(ArrayList arr)
  {
    changeSize(arr.size());
    nums2 = arr;
    background(52);
    drawNumbers();
    fill(100,100,255);
    text("Size: " + size, 10,10);
  }



  void changeSize(int newSize) // we use a function to change size so we dont have to remember to rerandomize the numbers
  {
    if(newSize > 1 && newSize != size)
      {
        if(newSize > size)
        {
          for(int i = 0; i < newSize - size; i++)
          nums2.add((int)random(0,100));
        }
        else
        {
          for(int i = 0; i < abs(newSize - size); i++)
          nums2.remove(size - (1 + i));
        }
        size = newSize;
      }
  }

  void drawNumbers() // this function draws the numbers using rectangles to represent each number and draws the number or each rectangle below it, we stagger the numbers so it is more easily readable
  {
    fill(255,100,100);
    for (int i = 0; i < size; i++)
    {
      int x = (int)map(i,0,size,0,width);
      stroke(100,255,100);
      int recHeight =(int)map((int)nums2.get(i),0,100,1,550);
      rect(x,550,width/size,-1 * recHeight);
      int xmid = x + (width/size)/2;
      stroke(0);
        if(i % 2 == 0)
        {

          text(nums2.get(i) + "",xmid,575);
          line(xmid,550,xmid,575);
        }
        else
        {
          text(nums2.get(i) + "",xmid,590);
          line(xmid,550,xmid,590);
        }
    }
    }
  }
