module zhika
import StdEnv

/*
 Given a 2-d list of Integer type and a boolean function.
 Transform every integers of the sublist, (that has the returned value True by the given function), into a single-element list.
 for example: [[2,3,4,2,2],[8,5,5,6,7,8],[9,3,7,8,9]] isOdd
    The first sublist will result [3]
    The second sublist will result [5],[5],[7]
    The third sublist will result [9],[3],[7],[9]
    And combining all those result into the list, then
    the result will be, [[3],[5],[5],[7],[9],[3],[7],[9]]

PT4Aux :: [Int] (Int -> Bool) -> [Int]
PT4Aux list func = [x \\ x <- list| func x == True] 

PT4 :: [[Int]] (Int -> Bool) -> [[Int]]
PT4 [] func = []
PT4 [x:xs] func = map (PT4Aux x func) ++ PT4 xs func
*/
PT4 :: [[Int]] (Int -> Bool) -> [[Int]]
PT4 [] y=[]
PT4 list y =map (\x=(filter (y) x)) list


//Start = PT4 [[2,3,4,2,2],[8,5,5,6,7,8],[9,3,7,8,9]] isOdd     // [[3],[5],[5],[7],[9],[3],[7],[9]]
//Start = PT4 [[6,5,3,-9],[0,9,-1,8,-4,-7],[8,-5,4,9,-3,0,9,5,7]] ((>)0)  // [[-9],[-1],[-4],[-7],[-5],[-3]]
//Start = PT4 [[6,0,0,-9],[0,9,-1,0,-4,-7],[-5,0,9,-3,0,0,5]] ((==)0)   // [[0],[0],[0],[0],[0],[0],[0]]
//Start = PT4 [[],[4,7,8]] isEven            // [[4],[8]]
//Start = PT4 [] ((<)0)              // []

/*
1. Write a function which takes a list of numbers and returns tuple
of two lists: I. Even numbers from the list sorted in ascending order.
II. Odd numbers from the list sorted in descending order.
Ex. [1,3,2,7,12,4,1,4,5,12,9,4] -> [2,4,4,4,12,12] [9,7,5,3,1,1]
*/


splitSort :: [Int] -> ([Int],[Int])
splitSort list = (sort[x \\ x <- list | x rem 2 == 0], reverse(sort[y \\ y <- list | y rem 2 == 1]))


//Start = splitSort [1,3,2,7,12,4,1,4,5,12,9,4] // ([2,4,4,4,12,12],[9,7,5,3,1,1])
//Start = splitSort [1,2..13] // ([2,4,6,8,10,12],[13,11,9,7,5,3,1])
//Start = splitSort [2,4..14] // ([2,4,6,8,10,12,14],[])
//Start = splitSort [] // ([],[])


/*
2. Given lists of lists, process each list and for each number in the list
change their value with the number of times it appears in this list.
Ex.: [[1,1,2,1,2,3], [2]] -> [[3,3,2,3,2,1], [1]]
1 appears 3 times in the first list, so each 1 is changed with 3.
2 appears 2 times in the first list, so each 2 is changed with 2.
3 appears 1 times in the first list, so each 3 is changed with 1.
2 appears 1 times in the second list, so each 2 is changed with 1.
*/
countOcc :: [Int] Int -> Int
countOcc [] _ = 0
countOcc [x:xs] n
| x == n = 1 + countOcc xs n
= countOcc xs n

counter1 :: [Int] -> [Int]
counter1 list = [length(filter (\x->x==z)list) \\ z <- list]
//Start = counter1 [1,1,2,1,2,3]

counter :: [[Int]] -> [[Int]]
counter lists = map counter1 lists

//Start = counter [[1,1,2,1,2,3], [2]] // [[3,3,2,3,2,1],[1]]
//Start = counter [[1,2,1,1,3,4,3],[2,2,4,3,2,2,1]] // [[3,1,3,3,2,1,2],[4,4,1,1,4,4,1]]
//Start = counter [[1..10]] // [[1,1,1,1,1,1,1,1,1,1]]
//Start = counter [] // []
//Start = counter [[1,2,2,3], [], [1,3,4,3,3,1,4]] // [[1,2,2,1],[],[2,3,2,3,3,2,2]]


/*
3. Given the list of tuples, where the first element is the list of numbers, the second
element is a bound (Int) and the third one is the switch (Bool). If the switch is true
remove all elements greater than bound from the list, if the switch is false remove all
elements less than bound.
Ex.
*/
lower :: ([Int],Int,Bool) -> Int
lower tup = hd(fst3 tup)
//Start = lower ([1..10], 5, True)

mid :: ([Int],Int,Bool) -> Int
mid tup = snd3 tup

upper :: ([Int],Int,Bool) -> Int
upper tup = last(fst3 tup)

filter1 :: ([Int],Int,Bool) -> [Int]
filter1 tup 
| thd3 tup == True = [ x \\ x <- [lower tup .. mid tup]]
= [x \\ x <- [mid tup .. upper tup]]
//Start = filter1 ([1..10], 5, False)

dualFilter :: [([Int],Int,Bool)] -> [[Int]]
dualFilter tup = map filter1 tup

//Start = dualFilter [([1..10], 5, True),([1..10], 5, False)] // [[1,2,3,4,5],[5,6,7,8,9,10]]
//Start = dualFilter [([3,5..20], 3, True), ([], 4, False), ([1..5], 5, True)] // [[3],[],[1,2,3,4,5]]
//Start = dualFilter [] // []
//SOLUTION IS NOT COTRRECT
//Start = dualFilter [([1,3,8,2,12,45,5,1,3,5,81,12], 10, True)] // [[1,3,8,2,5,1,3,5]]


