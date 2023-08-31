module collatz
import StdEnv

/*-3
    * The first element of the Collatz series is an arbitrary positive integer. Following elements could be defined recursively:
    * the next element is 3 times the previous element increased by one, if the previous element was odd, otherwise the next
    * element is the half of the previous element.
    * 
    * As an example, starting from 3 as an input, the elements of the Collatz series are
    * 3, 10, 5, 16, 8, 4, 2, 1
    * 
    * According to the Collatz conjecture, this series **always** reaches 1, which is the last element in the previous
    * example, making the length of the Collatz series 8.

    * The function gets the first element of the series as input and should return the length of the Collatz series

subst2::[Real]->[Real]
subst2 [] = []
subst2 [x:y] 
| x < 10.0 = [x + 1.0] ++ subst2 y
= [x] ++ subst2 y
//Start = subst2 [1.0,3.0..15.0]

*/
len :: Int -> Int
len x 
| x < 0 = abort "Only positive"
| x == 0 = 0
| x == 1 = 1
| x rem 2 == 1 = length([x*3+1]) + len(x*3+1)
= length([x/2]) + len(x/2)




//um([y \\ y <- [1 .. x-1] | x rem y == 0])
//Start = len 4
Start = len 3 // 8 
//Start = len 5 // 6   
//Start = len 8 // 4   
//Start = len -8 // "Invalid input"   