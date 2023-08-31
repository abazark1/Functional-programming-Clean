module rectangle
import StdEnv

/*
1- Given a list consisting of 4 real values (first two values are one of the vertices of a rectangle x and y coordinate,
third is the rectangle's width and the fourth is the rectangle' height (width and height can be negative too). For example,
in case of  x =1, y=5, width=6, height=-2,
the bottom left vertex coordinates will be 1 and 3.
Define topLeft, topRight , bottomRight, and bottomLeft functions returning
the corresponding vertex of the rectangle as a list consisting of  x , y represinting the point of the resulting function.
*/
//x = a
//y = b
//w = x
//h = y
topLeft :: [Real] -> [Real]
topLeft [a, b, x, y]
|x<0.0 && y<0.0 = [a+x, b]
|x>0.0 && y>0.0 = [a, b+y]
|x>0.0 && y<0.0 = [a, b]
|x>0.0 && y<0.0 = [a+x, b+y] 

topRight :: [Real] -> [Real]
topRight [a, b, x, y]
|x<0.0 && y<0.0 = [a, b] 
|x>0.0 && y>0.0 = [a+x, b+y]
|x>0.0 && y<0.0 = [a+x, b]
|x<0.0 && y>0.0 = [a, b+y]

bottomLeft:: [Real] -> [Real]
bottomLeft [a, b, x, y]
|x<0.0 && y<0.0 = [a+x, b+y]
|x>0.0 && y>0.0 = [a, b]
|x>0.0 && y<0.0 = [a, b + y]
|x<0.0 && y>0.0 = [a+x, b]

bottomRight:: [Real] -> [Real]
bottomRight [a, b, x, y]
|x<0.0 && y<0.0 = [a, b+y]
|x>0.0 && y>0.0 = [a+x, b]
|x>0.0 && y<0.0 = [a+x, b+y]
|x<0.0 && y>0.0 = [a, b] 

//Start = topLeft[3.0 , 5.0 , 1.0 , -7.0] ++  topRight[3.0 , 5.0 , 1.0 , -7.0] ++ bottomLeft [3.0 , 5.0 , 1.0 , -7.0] ++ bottomRight[3.0 , 5.0 , 1.0 , -7.0]  
          //[3.0 ,5.0 , 4.0 , 5.0  , 3.0 , -2.0 ,  4.0 ,  -2.0  ]
//Start = topLeft[2.0,8.0,-4.0,-7.0] ++  topRight[2.0,8.0,-4.0,-7.0] ++ bottomLeft[2.0,8.0,-4.0,-7.0] ++ bottomRight[2.0,8.0,-4.0,-7.0]
         // [-2.0,8.0,2.0,8.0,-2.0,1.0,2.0,1.0]
//Start = topLeft[1.0,6.0,4.0,2.0] ++  topRight[1.0,6.0,4.0,2.0] ++ bottomLeft[1.0,6.0,4.0,2.0] ++ bottomRight[1.0,6.0,4.0,2.0]
  // [1.0,8.0,5.0,8.0,1.0,6.0,5.0,6.0]