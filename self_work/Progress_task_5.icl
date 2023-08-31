module Progress_task_5
import StdEnv


/*

Given two integer numbers a and b , filter out the perfect numbers in the interval [a..b]

In number theory, a perfect number is a positive integer that is equal to the sum of its positive divisors , 
excluding the number itself. For instance, 6 has divisors 1, 2 and 3, and 1 + 2 + 3 = 6, so 6 is a perfect number . 

*/


perfect :: Int Int -> [Int]
perfect a b = sum [x \\ x <- [a..b], x/x == 0]


Start = perfect 5 30 //  [(6,28]
//Start = perfect 20 1000// [28,496]
//Start = perfect 300 9000 // [496,8128]  
//Start = perfect 100 200 // [] 

