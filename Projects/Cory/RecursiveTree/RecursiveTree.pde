import java.util.ArrayList;

ArrayList<Branch> tree = new ArrayList<Branch>();
ArrayList<PVector> leaves = new ArrayList<PVector>();
float angle = QUARTER_PI;
int count = 0;
boolean undulate = false;
void setup() 
{
size(400,400);
PVector a = new PVector(width / 2, height);
PVector b = new PVector(width / 2, height - 100);
//translate();
Branch root = new Branch(a,b);
tree.add(root);
for(int i = 0; i < 10; i++) 
  {
      branch();
  }
}

void draw() 
{
  background(51);
  for(Branch b : tree) 
  {
    if(undulate)
    {
    float change = random(-1,1);
    b.end.x = b.end.x + change;
    b.end.y = b.end.y + change;
    }
    b.show();
  }
  int i = 0;
  for(PVector l : leaves) 
  {
    
    noStroke();
    
    if(i % 2 == 0) 
    {
    fill(255,168,255);
    } else 
    {
    fill(251,5,255);
    }
    ellipse(l.x,l.y,8,8);
    noFill();
    i++;
  }
  
  
  
}

void keyPressed() 
{
  if(key == ' ') {undulate = !undulate;}
}

void mousePressed(){
  branch();
  /*
  for(int i = tree.size() - 1 ; i >= 0 ; i-- )
  {
    Branch current = tree.get(i);
    if(!current.done)
    {
      tree.add(current.branchA());
      tree.add(current.branchB());
    }
    current.done = true;
  }
  */
}

void branch() 
{
  count++;
for(int i = tree.size() - 1 ; i >= 0 ; i-- )
  {
    Branch current = tree.get(i);
    if(!current.done)
    {
      tree.add(current.branchA());
      tree.add(current.branchB());
    }
    current.done = true;
 
  }
  if(count % 4 == 0){
    for(int i = 0; i < tree.size(); i++){
      Branch current = tree.get(i);
      //if the current Branch is on the last Level
      if(!current.done){
        PVector leaf = current.end.copy();
        leaves.add(leaf);
      }
}
  
}
}
