
class Equation
{
  String equation;
  int plusLoc;
  public Equation(String equation)
  {
    this.equation = equation.substring(2);
    for(int i = 0; i < this.equation.length(); i++)
    {
      if(this.equation.charAt(i) == '+')
      {
        plusLoc = i;
      }


    }
  }

  public float getB()
  {
    String bee = this.equation.substring(plusLoc + 1);
    float b = Float.parseFloat(bee);


    return b;
  }

  public float getY(float x)
  {
    String thing = equation.substring(0,plusLoc - 1);
    float y = Float.parseFloat(thing);
    return (y * x) + getB();
  }
}
