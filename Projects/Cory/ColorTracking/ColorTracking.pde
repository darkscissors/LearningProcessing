import processing.video.*;


Capture video;

color trackedColor;

boolean clicked = false;

int threshhold_ = 20;

void captureEvent(Capture video) 
{
  video.read();
}

void setup() 
{
  size(800,400);
  String[] cameras = Capture.list();
  printArray(cameras);
  video = new Capture(this,640, 360, cameras[3]);
  video.start();
}

boolean withinThreshhold(color c, int threshhold) 
{
  //color temp = c;
  //if(red(c) - red(trackedColor) < threshhold)
  //  if(green(c) - green(trackedColor) < threshhold)
  //    if(blue(c) - blue(trackedColor) < threshhold)
  if(abs(red(trackedColor) - red(c)) < threshhold)
    if(abs(green(trackedColor) - green(c)) < threshhold)
      if(abs(blue(trackedColor) - blue(c)) < threshhold)
      {
      //println("r:" + (abs(red(trackedColor) - red(c))));
      //println("g:" + (abs(green(trackedColor) - green(c))));
      //println("b:"+ (abs(blue(trackedColor) - blue(c))));
      return true;
      
      }
  //fill(upper);
  //ellipse(10,10,10,10);
  //fill(lower);
  //ellipse(10,20,10,10);
  //noFill();
  
  return false;
}

void draw() 
{
  background(0);
  video.loadPixels();
  image(video, 0, 0);
  
  for(int x = 0; x < video.width; x+=10)
  {
    for(int y = 0; y < video.height; y+=10) 
    { 
      //Stuff to do to each pixel is: color = currentColor = video.pixels
      int location = x + y * video.width;
      //video.pixels[location] = do something here;
     
      if(clicked)
      if(withinThreshhold(video.pixels[location], threshhold_))
      { 
        noStroke();
        fill(255,255,255,100);
        ellipse(x,y,4,4);
      } 
      
    }
  }
  
  //color upper = trackedColor;
  //color lower = trackedColor;
  //fill(upper);
  //ellipse(10,10,10,10);
  //fill(lower);
  //ellipse(10,20,10,10);
  //noFill();
  
  fill(255);
  text("Tracked Color: ",450,200);
  fill(trackedColor);
  ellipse(600,200,25,25);
  noFill();
}

void keyPressed() 
{
if(key == ' ') {clicked = false;}
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  //println(e);
  if(e == -1.0) {threshhold_++;} else {threshhold_--;}
  println("New Threshhold: " + threshhold_);
}

void mouseClicked() 
{
  clicked = true;
  video.loadPixels();
  int location = mouseX + mouseY * video.width;
  try {
    trackedColor = video.pixels[location];
    //print((color)trackedColor);
  }
  catch(ArrayIndexOutOfBoundsException ex)
  {
    println("[Error] User clicked out of image range...");
  }
  
}
