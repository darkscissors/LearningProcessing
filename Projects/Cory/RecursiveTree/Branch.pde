
class Branch
{

  public PVector begin;
  public PVector end;
  public boolean done = false;
  public float angleChange = random(-PI/4,PI/4);
  //public float angleChange = (7*PI)/15;
  public final float loss = .70;
  //public boolean isLeaf = random();
  public float length_;
  Branch(PVector begin, PVector end)
  {
    this.begin = begin;
    this.end = end;
    length_ = dist(begin.x,begin.y,end.x,end.y);
  }


  void show()
  {
    stroke(255);
    strokeWeight(map(length_,0,200,1,32));
    line(begin.x, begin.y, end.x, end.y);
  }
  
  Branch branchA() 
  {
    PVector d = PVector.sub(end,begin);
    d.rotate(angleChange);
    d.mult(loss);
    PVector NEnd = PVector.add(end,d);
    return new Branch(end, NEnd);
  }
  
  Branch branchB() 
  {
    PVector d = PVector.sub(end,begin);
    d.rotate(-angleChange);
    d.mult(loss);
    PVector NEnd = PVector.add(end,d);
    return new Branch(end, NEnd);
  }
  
}
