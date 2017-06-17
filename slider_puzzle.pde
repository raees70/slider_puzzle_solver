int goalNode = 12345678;
class pattern{
  int[][] arrayPattern = new int[3][3];
  PVector zeroPos = new PVector();
  pattern()
  {
    this.zeroPos.x = 0; this.zeroPos.y = 0;
    for(int i = 0 ; i < 3 ; i++)
    for(int j = 0 ; j < 3 ; j++)
    this.arrayPattern[i][j] = 3*i + j;
  }
  pattern(int n)
  {
    for(int i = 2 ; i >= 0 ; i--)
    for(int j = 2 ; j >= 0 ; j--)
    {
      this.arrayPattern[i][j] = n%10;
      n = n/10;
      if(this.arrayPattern[i][j] == 0)  //In addition keep record of the zeroPos
      {
        this.zeroPos.x = j;  //Note x is j and y is i
        this.zeroPos.y = i;
      }
    }
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
  }
  int getIntfromObject()
  {
    int n = 0;
    for(int i = 0 ; i < 3 ; i++)
    {
      for(int j = 0 ; j < 3 ; j++)
      {
        n = n*10+this.arrayPattern[i][j];
      }
    }
    return n;
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
  void findNeighborAndPush()
  {
    if(this.zeroPos.x>0)
    {
      int parentPattern = this.getIntfromObject();
      int i = int(this.zeroPos.y);
      int j = int(this.zeroPos.x);
      this.arrayPattern[i][j] = this.arrayPattern[i][j - 1];
      this.arrayPattern[i][j - 1] = 0;
      int neighborPattern = this.getIntfromObject();
      //Check if the new pattern is already in the closedSet
      boolean neighborPresent = false;
      for(int k = 0 ; k < closedSet.size() ; k++) //Remember there are node's parents in the odd positions
      {
        if(neighborPattern == closedSet.get(k))
        neighborPresent = true;
      }
      if(!neighborPresent)
      {
        openSet.append(neighborPattern);
        openSet.append(parentPattern);
      }
      // Roll back the changes we made to the current object node
      this.arrayPattern[i][j-1] = this.arrayPattern[i][j];
      this.arrayPattern[i][j] = 0;
    }
    if(this.zeroPos.x<2)
    {
      int parentPattern = this.getIntfromObject();
      int i = int(this.zeroPos.y);
      int j = int(this.zeroPos.x);
      this.arrayPattern[i][j] = this.arrayPattern[i][j + 1];
      this.arrayPattern[i][j + 1] = 0;
      int neighborPattern = this.getIntfromObject();
      //Check if the new pattern is already in the closedSet
      boolean neighborPresent = false;
      for(int k = 0 ; k < closedSet.size() ; k++) //Remember there are node's parents in the odd positions
      {
        if(neighborPattern == closedSet.get(k))
        neighborPresent = true;
      }
      if(!neighborPresent)
      {
        openSet.append(neighborPattern);
        openSet.append(parentPattern);
      }
      // Roll back the changes we made to the current object node
      this.arrayPattern[i][j+1] = this.arrayPattern[i][j];
      this.arrayPattern[i][j] = 0;
    }
    if(this.zeroPos.y>0)
    {
      int parentPattern = this.getIntfromObject();
      int i = int(this.zeroPos.y);
      int j = int(this.zeroPos.x);
      this.arrayPattern[i][j] = this.arrayPattern[i-1][j];
      this.arrayPattern[i-1][j] = 0;
      int neighborPattern = this.getIntfromObject();
      //Check if the new pattern is already in the closedSet
      boolean neighborPresent = false;
      for(int k = 0 ; k < closedSet.size() ; k++) //Remember there are node's parents in the odd positions
      {
        if(neighborPattern == closedSet.get(k))
        neighborPresent = true;
      }
      if(!neighborPresent)
      {
        openSet.append(neighborPattern);
        openSet.append(parentPattern);
      }
      // Roll back the changes we made to the current object node
      this.arrayPattern[i-1][j] = this.arrayPattern[i][j];
      this.arrayPattern[i][j] = 0;
    }
    if(this.zeroPos.y<2)
    {
      int parentPattern = this.getIntfromObject();
      int i = int(this.zeroPos.y);
      int j = int(this.zeroPos.x);
      this.arrayPattern[i][j] = this.arrayPattern[i+1][j];
      this.arrayPattern[i+1][j] = 0;
      int neighborPattern = this.getIntfromObject();
      //Check if the new pattern is already in the closedSet
      boolean neighborPresent = false;
      for(int k = 0 ; k < closedSet.size() ; k++) //Remember there are node's parents in the odd positions
      {
        if(neighborPattern == closedSet.get(k))
        neighborPresent = true;
      }
      if(!neighborPresent)
      {
        openSet.append(neighborPattern);
        openSet.append(parentPattern);
      }
      // Roll back the changes we made to the current object node
      this.arrayPattern[i+1][j] = this.arrayPattern[i][j];
      this.arrayPattern[i][j] = 0;
    }
  }
}

pattern p = new pattern();
IntList closedSet = new IntList(); //Contains the nodes (and their parents) already searched but didn't match with the goal node. Required for checking if a node is already searched
IntList openSet = new IntList(); //Contains the nodes to be searched
void bfs()
{
  //Check if the current node (first element in the openSet) is goal node. If not push it in the closedSet (also it's parent)
  int current = openSet.get(0);
  if(current == goalNode || openSet.size() == 0)  //Stop and retrace the path
  {
    
  }
  else //If not push it in the closedSet (also it's parent) and remove it from the openSet
  {
    closedSet.append(openSet.get(0));
    closedSet.append(openSet.get(1)); //It is the node's parent
    openSet.remove(openSet.get(0)); // Remove node
    openSet.remove(openSet.get(1)); // Remove the parent
  }
  //Get the neighbors and push them in the openSet
  //Create an object from the current node so that neighbor can be calculated
  pattern currentNode = new pattern(current);
  currentNode.findNeighborAndPush();
  // And find the neighbor. If a neighbor is in the closed set no need to push in the openSet
  bfs();
}

void setup()
{
  //p.right();
  //p.right();
  //p.left();
  //p.down();
  //p.down();
  //p.up();
  //p.disp();
  ////Push the object (the node and it's parent (let the parent be 0)) in the openSet. We are pushing the int number rather than the object itself
  //openSet.append(p.getIntfromObject());
  //openSet.append(0);  //Let the first node's parent is 0
  //bfs();
}

void draw()
{

}