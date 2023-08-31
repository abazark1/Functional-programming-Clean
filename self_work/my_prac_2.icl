module my_prac_2

import StdEnv


//Start=[6,7,3,2,8,5,3]!!3 //returns the index

//TASK1 Given a list of 3 integers.
//Find the sum of it WITHOUT using the sum function
mySum::[Int]->Int
mySum [a, b, c] = a + b + c
//Start = mySum [2,6,9]

//TASK2 Given a list of intgers with length at least 2.
// Write a function which will return the sum of the first 2 elements of that list
//solution1
sumTwo::[Int]->Int
sumTwo list = sum(take 2 list) //sumtwo [x,y:z] = x+y
//Start = sumTwo [3,6,7,9]

//TASK3 Write a function which calculates the length of a list WITHOUT using the length function
length::[Int]->Int
length [] = 0
length list = 1 + length(tl list)
//Start = length [1..100]

//TASK4 Write a function which takes a list and returns a list containing the first and last two elements of that list.
//Handle the case when there are not enough elements (return empty list in that case!)
first2last2::[Int]->[Int]
first2last2 list
|length(list) < 4 = []
= take 2 list ++ (reverse(take 2(reverse list))) //take 2 list ++ drop ((length list) - 2) list
//Start = first2last2 [1,7,3,5,6,7]
//Start = first2last2 [1,5,3]

//TASK5 Given a list of Integers, write a function which will sum the elements with even indexes only.(the index of the head of a list is 0->EVEN)
//Return 0 if the list is empty
onlyEvenIndex::[Int]->Int
onlyEvenIndex [] = 0
onlyEvenIndex [x] = x
onlyEvenIndex [x,y:z] = x + onlyEvenIndex z
//Start = onlyEvenIndex [1,5,3]
//Start = onlyEvenIndex [3,6,8,9,6,7]

//TASK6 Given a list of integers, check if that list is symmetrical
//[1,2,3,2,1], [1,1,1,1], [1,2,3,3,2,1]... are symmetrical lists, lists which are the same starting from both left and right side
isSim::[Int]->Bool
isSim list
| list == reverse(list) = True
= False
//Start = isSim [1,2,3,2,1]//True
//Start = isSim [1,2,3]

listGen :: Int -> [Int]
listGen x
| x <= 0 = []
| x == 1 = [1]
= reverse([x] ++ listGen(x-1))
Start = listGen 10

//listGenAux :: [Int] -> [Int]
//listGenAux list = reverse (listGen list)
//Start = listGen 10

//TASK7: Given a list of lists of integers, calculate the sum of all the elements of that list
//[[1,2,3],[1],[2,2]]=1+2+3+1+2+2=11
sumListOfLists::[[Int]]->Int
sumListOfLists list = sum(flatten list)
//Start =  sumListOfLists [[1,2],[4,4,4,4,5]]


//TASK8: Given a lis of integers. Find its middle element.(**GIven that the list has at least 1 element**)
//[1,2,3]->2
//[1,2,3,4]->2
middle::[Int]->Int
middle list = hd(drop((length list)/2)list)
//Start = middle [1,2,3,4,6]
//Start = middle [1,2,3]

//Given a list of integers.
//Write a code which will substitute every integer greater than 5 with the character 'g' and every integer less or equal to 5 with 's'
subst::[Int]->[Char]
subst [] = []
subst [x:y] 
| x < 5 = ['s'] ++ subst y
= ['g'] ++ subst y
//Start = subst [1..10]
//"" for strings, '' for char

//Given a list of Reals.
//Write a code which will add 1 to every real number from the list which is less than 10
subst2::[Real]->[Real]
subst2 [] = []
subst2 [x:y] 
| x < 10.0 = [x + 1.0] ++ subst2 y
= [x] ++ subst2 y
//Start = subst2 [1.0,3.0..15.0]

//Given a list of Booleans.
//Write a code which will substitute every True value with 1 and every False value with 0
subst3::[Bool]->[Int]
subst3 [] = []
subst3 [x:y]
|x == True = [1] ++ subst3 y
= [0] ++ subst3 y
//Start=subst3 [False,True,False,False,True,False,True,True,False,False,False,True,True,True] //[0,1,0,0,1,0,1,1,0,0,0,1,1,1]


/*
Complete the function oddProd which takes a list of numbers, calculates their product and then finds if that number is odd or not
If the number is odd, then the function should return True, otherwise it returns False
*/
oddProd :: [Int] -> Bool
oddProd list 
| prod list rem 2 == 1 = True
= False
//Start = oddProd [24,12,23] // False
//Start = oddProd [11,1,423,5221,3553,2] // False
//Start = oddProd [1,3,5] // True

//Start = prod[1..5]//it works

/*
Complete the function oddDigs which takes an integer number, calculates the sum of its digit, and then finds if that number is odd or not
If the number is odd, then the function should return True, otherwise it returns False
*/
isum::Int->Int
isum x
| x == 0 = 0
= x rem 10 + isum(x/10)

oddDigs :: Int -> Bool
oddDigs x 
| isOdd(isum x) = True
= False

//Start = oddDigs 1234 // False
// Start = oddDigs 55555 // True
// Start = oddDigs 1010 // False

//1. Give a list of numbers, multiplying all even numbers by 2 and all odd numbers by 3

multiply :: [Int] -> [Int]
multiply [] = []
multiply [x:y] 
| x rem 2 == 0 = [x*2] ++ multiply y
= [x*3] ++ multiply y

//Start = multiply [1,2,3,4,5,6,7,8]

// 2. Given a list of integers, find the prime numbers and compute the sum of them.
// Return 0 for empty lists or if there are no primes.

/*sum_of_prime :: [Int] -> Int
sum_of_prime [x:y]
| (x/6)*6+1==x */


// Write a function that takes an Int 'n' and
// generates a list of fibonacci numbers,
// which are less than or equal to 'n'. 
// https://en.wikipedia.org/wiki/Fibonacci_number

fibo :: Int -> [Int]
fibo x 
| x < 0 = []
| x == 0 = [0]
= fibo (x-1) ++ fibo (x - 2)

//Start = fibo 0 // [0]
//Start = fibo -1 // []

//!!MISTAKE!!
//Start = fibo 15 // [0,1,1,2,3,5,8,13]
// Start = fibo 1 // [0,1,1]
// Start = fibo 55 // [0,1,1,2,3,5,8,13,21,34,55]



/*
Complete the function evenOdds that takes a list as a parameter and returns a List containing a list of the even numbers and a list of the odd numbers.
I.e: [1,2,3,4,5,6,7,8] -> [[1,3,5,7],[2,4,6,8]]
*/

filterEven :: [Int] -> [Int]
filterEven [] = []
filterEven [a:b]
| isEven a = [a:filterEven b]
= filterEven b
//Start = filterEven [1,2,3,4,5,6]

filterOdd :: [Int] -> [Int]
filterOdd [] = []
filterOdd [a:b]
| isOdd a = [a:filterOdd b]
= filterOdd b

evenOdds :: [Int] -> [[Int]]
evenOdds [] = []
evenOdds list = [filterOdd list, filterEven list]

//Start = evenOdds [1,2,3,4,5,6,7,8] // [[1,3,5,7],[2,4,6,8]]
//Start = evenOdds [22,2,224,292] // [[],[22,2,224,292]]
//Start = evenOdds [11,1,223,291] // [[11,1,223,291],[]]
//Start = evenOdds [] // []

/*
1,	Given an integer, x, calculate the total number of perfect numbers between 0 to that number, [1,x).
	Perfect number is a number which is equal to the sum of its divisor.
	For example: 6 is a perfect number
				divisor of 6 = 1, 2, 3 => sum of its divisor = 6 == 6
				10 is not a perfect number
				divisor of 10 = 1, 2, 5 => sum = 8 != 10
				
	If the given x is 10, then the result is 1 because there is only 1 perfect number between 1 and x.
	
	You are advised to write one or more functions for clear coding. 


numOfPerfectNumberAux :: Int Int -> [Int]
numOfPerfectNumberAux x y
| x <= 1 = []
| x == y = []
| (x < y && y rem x == 0) = [x] ++ numOfPerfectNumberAux(x+1)

Start = numOfPerfectNumberAux 2 29


//sum_of_factors n = sum [x | x <- [1..n], n `mod` x == 0, x /= n]
//perfects n = [x  x <- [1..n], sum_of_factors x == x]

numOfPerfectNumberAux :: Int Int -> [Int]
numOfPerfectNumberAux x y
| x <= 1 = [0]
| x == y = []
= [x \\ x <- [x..y] | y <> x && y rem x == 0] ++ numOfPerfectNumberAux (x+1)
Start = numOfPerfectNumberAux 2 100*/
//perfect n = n == sum [i | i <- [1..n-1], n `mod` i == 0]

perfectNumber :: Int -> Bool
perfectNumber x = x == sum([y \\ y <- [1 .. x-1] | x rem y == 0]) 

//Start = perfectNumber 7

numOfPerfectNumber :: Int -> Int
numOfPerfectNumber x 
| x <=1 = 0
= length([y \\ y <- [1 .. x] |  perfectNumber y])
//Start = numOfPerfectNumber 29 	// 2
//Start = numOfPerfectNumber 1000 	// 3
//Start = numOfPerfectNumber 0 		// 0
//Start = numOfPerfectNumber 1 		// 0
//Start = numOfPerfectNumber 10000 	// 4

/*