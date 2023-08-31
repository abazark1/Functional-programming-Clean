module prog_task_2
import StdEnv

PT2 :: [Int] Int -> [Int]
PT2 [] a=[]
PT2 [x:xs] a
|x rem 2==0=[(x+a):PT2 xs a]
=[(x-a):PT2 xs a]
//Start= PT2 [1,4,3,6,7,8,2] 3



noZero::[Int]->[Int]
noZero []=[]
noZero [x:xs]
|x<0=[x:noZero xs]
=noZero xs

Start= noZero (PT2 [0, -2, -3, 1] 4)