class pattern{
  int[][] arrayPattern = new int[3][3];
  PVector zeroPos = new PVector();
  pattern()
  {
    zeroPos.x = 0; zeroPos.y = 0;
    for(int i = 0 ; i < 3 ; i++)
    for(int j = 0 ; j < 3 ; j++)
    this.arrayPattern[i][j] = 3*i + j;
  }
  void disp()
  {
    int n = 0;
    for(int i = 0 ; i < 3 ; i++)
    {
      for(int j = 0 ; j < 3 ; j++)
      {
        print(this.arrayPattern[i][j],"  ");
        n = n*10+this.arrayPattern[i][j];
      }
      println();
    }
    closedSet.append(n);
  }
  void right()
  {
    if(this.zeroPos.x<2)
    {
      int i = int(this.zeroPos.y);
      int j = int(this.zeroPos.x);
      arrayPattern[i][j] = arrayPattern[i][j + 1];
      arrayPattern[i][j + 1] = 0;
      this.zeroPos.x++;
    }
  }
  void left()
  {
    if(this.zeroPos.x>0)
    {
      int i = int(this.zeroPos.y);
      int j = int(this.zeroPos.x);
      arrayPattern[i][j] = arrayPattern[i][j - 1];
      arrayPattern[i][j - 1] = 0;
      this.zeroPos.x--;
    }
  }
  void down()
  {
    if(this.zeroPos.y<2)
    {
      int i = int(this.zeroPos.y);
      int j = int(this.zeroPos.x);
      arrayPattern[i][j] = arrayPattern[i+1][j];
      arrayPattern[i+1][j] = 0;
      this.zeroPos.y++;
    }
  }
  void up()
  {
    if(this.zeroPos.y>0)
    {
      int i = int(this.zeroPos.y);
      int j = int(this.zeroPos.x);
      arrayPattern[i][j] = arrayPattern[i-1][j];
      arrayPattern[i-1][j] = 0;
      this.zeroPos.y--;
    }
  }
}

pattern p = new pattern();
IntList closedSet = new IntList();

void setup()
{
  p.right();
  p.right();
  p.left();
  p.down();
  p.down();
  p.up();
  p.disp();
  for(int i = 0;i < closedSet.size(); i++)
  println(closedSet.get(i)," ");
}

void draw()
{

}