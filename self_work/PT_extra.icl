module PT_extra
import StdEnv


// 1. Insert x as first element in every sublist of a list.
// if the sublist was empty then x will be the only element in the new sublist.
// [[1,2], [3,4,5], [6,5,9,7], [], [8]] 100 -> [[100,1,2], [100,3,4,5], [100,6,5,9,7], [100], [100,8]]

f1a :: [Int] Int -> [Int]
f1a list a = [a:list]

f1 :: [[Int]] Int -> [[Int]]
f1 list a = [f1a b a \\ b <- list] 

//Start = f1 [[1,2], [3,4,5], [6,5,9,7], [], [8]] 100

// 2. Increase by 10 all the elements of the sublists of a list (you must use map)
// [[1, 2, 3], [3, 4], [5, 7, 8, 9], [], [1..5]] -> [[11, 12, 13], [13, 14], [15, 17, 18, 19], [], [11,12,13,14,15]]
f2a :: [Int] -> [Int]
f2a [] = []
f2a [x:xs] = [x+10] ++ f2a xs

f2 :: [[Int]] -> [[Int]]
f2 list = [f2a b \\ b<-list]

//Start = f2 [[1, 2, 3], [3, 4], [5, 7, 8, 9], [], [1..5]]

// 3. Check if a list contains 2 equal elements one after the other
// (they can be anywhere in the list) and count such equalitites
// for [1,2,2,3,4,3,3,2,4,5,5,5] is 4 for [1 .. 5] is 0.
//f3a :: [Int] Int -> Int
//f3a lis
/*f3 :: [Int] -> Int
f3 [] = 0
f3 [x] = 0
f3 [x,y] = 1 if x == y 
f3 [x,y:xs]
| x == y = 1 + [y:xs]
= [y:xs]*/

//Start = f3 [1,2,2,3,4,3,3,2,4,5,5,5]
//Start = f3 [1,2,2,2,3,4,3,3,2,4,5,5,5,5,5,5,5,5,5]

// 4. Extract the second element of the sublists (if there is no such element, ignore that sublist)
// [[1,2,3], [3,4,5,6], [], [5,7,8,11], [1], [8,9]] -> [2,4,7,9]
takeMid :: [Int] -> Int
takeMid list = last(take(toInt(toReal(length list)/2.0))list)

f4 :: [[Int]] -> [Int]
f4 [] = []
f4 [x:xs] 
|length(x) == 1 || x == [] = f4 xs
= [takeMid x] ++ f4 xs

//Start = f4 [[1,2,3], [3,4,5,6], [], [5,7,8,11], [1], [8,9]]

// 5. Insert an x as second element into every sublist of a list.
// (if the sublist is shorter then just add x to it)
// [[1,2], [3,4,5], [6,5,9,7], [], [8]] 10 -> [[1,10,2], [3,10,4,5], [6,10,5,9,7], [10], [8,10]]

insert :: [Int] Int -> [Int]
insert [] n = [n]
insert [x] n = [x,n]
insert list n = take 1 list ++ [10] ++ drop 1 list

f5 :: [[Int]] Int -> [[Int]]
f5 list n = [insert a n \\ a <- list]

//Start = f5 [[1,2], [3,4,5], [6,5,9,7], [], [8]] 10

// 6. Using foldr compute the sum of the elements of the sublists and add them as last elements.
// [[1..5],[1..3],[5,1,2],[],[3]] -> [[1,2,3,4,5,15],[1,2,3,6],[5,1,2,8],[0],[3,3]]
compute :: [Int] -> [Int]
compute list = list ++ [foldr (+) 0 list]

//Start = compute [1..5]
f6 :: [[Int]] -> [[Int]]
f6 list = [compute x \\ x <- list]

//Start = f6 [[1..5],[1..3],[5,1,2],[],[3]]

// 7. Eliminate the elements up to the first 0, and compute the product of the positive elements of the rest.


f7 :: [Int] -> [Int]
f7 list = (takeWhile ((>) 0) dropWhile ((<>) 0) list)

//Start = dropWhile ((<>) 0)[1,-2,-4,5,0,1,-6,1,-1,-2,5,0,2]
Start = f7 [1,-2,-4,5,0,1,-6,1,-1,-2,5,0,2] //10

// 8. Ignore the first x elements of the sublists and then sum up them.

//f8 :: Int [[Int]] -> [Int]

//Start = f8 3 [[1..5], [], [1..4], [1,5,1], [], [1,2,4,50,100], [1..10]] // [9,0,4,0,0,150,49]

// 9. Delete every third element of the sublists of a list.

//f9 :: [[Int]] -> [[Int]]

//Start = f9 [[1..5],[],[1..4],[1,5],[1],[1..3],[1..10]]

// [[1,2,4,5],[],[1,2,4],[1,5],[1],[1,2],[1,2,4,5,7,8,10]]

//10. For sublists of even lenght of a list, cut the sublists at midle and keep only the first half
//and then invert them.

//f10 :: [[Int]] -> [[Int]]

//Start = f10 [[1..5],[1,2,2,1],[1,1,2,2,1,1],[11..16],[],[1,2,3,3,2,1]]

// [[2,1],[2,1,1],[13,12,11],[],[3,2,1]]