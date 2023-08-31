module Cons5

import StdEnv


/*Foldr*/
/*
*Foldr is basically a way to process a list in a more convinent way 
*It's a really powerful tool in Clean and in most Functional languages
*/

/*The basic idea is folding a list from the right to the left*/
// foldr ((*)) 10 [1,2,3,4]  
/*
foldr operator Starting_value list 
foldr (\x y = x + y) 0 [1..3]
foldr (\x y = x + y) (3+0) [1,2] //notice, the first argument is taken from end of the list.
                                //the other argument is from what's accumulated. we started with 0.
foldr (\x y = x + y) (2+(3+0)) [1] //in here, the accumulator is the calculation from the previous step
foldr (\x y = x + y) (1+(2+(3+0))) [] // list is empty!
(1+(2+(3+0))) //now it will do this
*/

/*Let's try to remember the function that we solved in the the second Consultation*/
/*
**IsAllEven returns true if all of the elements in a list are Even*/
/*We can easily solve this problem with foldr, if we know  what we're doing*/


IsAllEven :: [Int] -> Bool
IsAllEven list = foldr (\x y = y && isEven x) True list  


//Start = IsAllEven [2,4,8,6]
/*
foldr (\x y = y && isEven x) True [2,4,8,6]
foldr (\x y = y && isEven x) (isEven 6 &&True) [2,4,8]
foldr (\x y = y && isEven x) (isEven 8 && isEven 6 &&True) [2,4]
...
(isEven 2 && isEven 4 && ..)
*/

/*
*From this, we can conclude that 
*NewList list = foldr (\newElement accumulatedElement = accumulatedElement + newElement) 0 list
*
*And now, we can generalize the idea into something else
*
*NewList list = foldr (\newElement accumulatedList = accumulatedList ++ [doSomething newElement]) [] list
*
*Booleans
*NewList list = foldr (\newElement accumulatedBoolea = accumulatedBoolean && doSomething newElement) True list
*/

// Now we can actaully redesign a bunch of functions with our knowledge right here 
// To remake Filter we'd have to do: 

myFilter :: (Int -> Bool) [Int] -> [Int]
myFilter condtion list = foldr  (\x y |condtion x = y ++ [x] = y) [] list

// Start = myFilter isEven [1..10] // [10,8,6,4,2]

//>>Let's remember list comprehensions a little bit before we dive in to everything
/*
They operate in a way so that every element in the list is processed and then inserted again into a list
.>>>>[Element \\ Element <- List | Guards]
[a \\ a <- [1,2,3,4,5] | isEven a]
[] ++ [a \\ a<- [2,3,4,5] |isEven a]
[] ++ [2] ++ [a \\ a<- [3,4,5] |isEven a]
[] ++ [2] ++ [] ++ [4] ++ []  -> [2,4]
*/
// [dosomething with Element \\ Element <- List | Guards]


//>>>>>>>>>>>>>>Cleaver stuff from here on out lol
//Everything will be solved with a one liner

/*
    3. Compute the average of a list of float point numbers using the foldr function.
*/

avg :: [Real] -> Real
avg [] = 0.0 
avg list = (\(x,y) = x/y) (foldr (\x (a,b) = (x+a,b+1.0)) (0.0,0.0) list)

// Start = avg [16.2, 17.8, 11.5] // 15.1666666666667
// Start = avg [13.0, 40.9] // 26.95
// Start = avg []

/*
*Given a list of tuples, where first element is an integer and the second a Boolean,
*keep all the numbers of the tuples where the second element is True.
*/
something :: [(Int, Bool)] -> [Int]
something list = foldr (\(a,b) y |b = y ++ [a] = y ++[]) [] list   

// Start = something [(1,True), (3,False),(1000,True), (5,False),(2,True), (0,False)]

/*
*Given a list of tuples, check if the property that the first number is smaller then the
*second holds for every tuple.
*/
isSmaller :: [(Int,Int)] -> Bool 
isSmaller list = foldr (\(a,b) y = a < b && y ) True list  
// Start = isSmaller [(1,2),(3,4),(4,5)]
// Start = isSmaller [(1,2),(4,4),(3,4)]
/*
foldr (\(a,b) y = y && a<b) True [(1,2),(3,4),(4,5)]
foldr (\(a,b) y = y && a<b) (4 < 5 && True) [(1,2), (3,4)]
foldr (\(a,b) y = y && a<b) (3 < 4 && 4 < 5 && True) [(1,2)]
...
*/


/**1
  * Write a function, that takes a list of functions, and a list of
  * tuples (Int, Int) where the first Int indicates which function to
  * use and the second Int acts as a parameter and returns a list of
  * the results.
  
  * For example: Router [isEven,isOdd] [(1,2),(2,4),(1,57)] = [True, False, False]
  */

Router :: [(a->b)] [(Int,a)] -> [b]
Router funcList tupleList = foldr (\(a,b) y = [((funcList!!(a-1)) b)] ++ y) [] tupleList

Start = Router [isEven,isOdd] [(1,2),(2,4),(1,57)] //[True, False, False]

// Start = Router [((+)1),((*)2),((^)2),((rem) 100)] [(4,13),(2,23),(3,5),(1,1336),(4,23)] //[9,46,32,1337,8]

/**5
  * Write a function that takes two vectors, represented as lists, and returns their dot product.
  
  * The dot product of two vectors can be computed as:
  
  * < xa, xb, xc, ...> * < ya, yb, yc, ...> = (xa*ya) + (xb*yb) + (xc*yc) + ...
  
  * For example: DotProd [4,6,3] [6,3,7] = 24+18+21 = 63
  */

DotProd :: [Int] [Int] -> Int
DotProd list list2 =  sum [a*b \\ a<-list & b<-list2] 

// Start = DotProd [4,6,3] [6,3,7] //63

//Start = DotProd [6,3,7] [4,6,3] //63

// Start = DotProd [5,2,6,8,3] [5,-8,5,-3,-5] //0

// Given a list of characters, split it into a tuple in which the first part only contains digits ('0'..'9'),
// the second part contains the rest. */

isDig :: Char -> Bool
isDig a = (toInt a >= toInt '0') && (toInt a <= toInt '9')   


TwoLists :: [Char] -> ([Char],[Char])
TwoLists list = foldr (\x (numNist,charList) |isDig x = (numNist ++[x],charList) = (numNist,charList++[x])) ([],[])    list 

// Start = toInt '9'
// Start = TwoLists  ['1', 'a', '2', 'b', '3'] // (['1','2','3'],['a','b'])

//Start = TwoLists [] // ([],[])


// 9. Write a function that takes a tuple of three lists and generates a list of triple tuples.

// The triple tuple is only generated if the i-th member of the first list multiplied by the

// i-th member of the second list equals the i-th member of the third list.

// e.g. for ([1,2,3,4,5],[2,4,6,8,10],[2,8,17,32,45]) the result is [(1,2,2),(2,4,8),(4,8,32)]

// Start = f9 ([2,2,2,2,2,2],[1,2,3,4,5,6,7,8],[2,4,6,6,10])//[(2,1,2),(2,2,4),(2,3,6),(2,5,10)]

//Start = f9 ([1,2,3,4,5],[2,4,6,8,10],[2,8,1,32,45])//[(1,2,2),(2,4,8),(4,8,32)]

//Start = f9 ([1,0,1,0,1,0],[3,4,5,6,8],[3,0,5,0,0])//[(1,3,3),(0,4,0),(1,5,5),(0,6,0)]