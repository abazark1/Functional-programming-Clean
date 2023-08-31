
module majority
import StdEnv

sorting :: [Int] -> [Int]
sorting list = sort(list)
//Start = sorting [3,2,3,5,4,3,2]

//sub2 :: ([Int]->[Int]) [Int]  -> [[Int]]
//sub2 function [] = []
//sub2 function [x,y:xs] 
//| x == y = sorting [x,y] ++ sub2 sorting [y:xs]
//= sorting [x] ++ sub2 sorting [y:xs]

//Start = sorting [3,2,3,5,4,3,2]

majorityElemAux :: [Int] [Int] -> Int
majorityElemAux [] _ = []
majorityElemAux [x:xs] list2
| CountOccurences x list2 <= (length list2)/2 = majorityElemAux xs list2
= x 


CountOccurences :: a [a] -> Int | == a
CountOccurences a [x:xs] = f a [x:xs] 0
							where 
							f a [] i = i
							f a [x:xs] i
							| a == x = f a xs i+1
							= f a xs i

majorityElem :: [Int] -> Int
majorityElem list = majorityElemAux (removeDup list) list 
//| CountOccurences x [x:xs] <= (length[x:xs])/2 = abort "no majority"
//|CountOccurences x [x:xs] > (length [x:xs](/2 = x
//= majorityElem xs

//Start = majorityElem [3,2,3]
//Start = majorityElem [2,2,1,1,1,2,2]
//Start = 

checkSumOfIntParts :: [[Real]] Int -> [Bool]
checkSumOfIntParts list n = map (\x = sum (map (\el = (\elem | toReal(toInt elem) > elem = (toInt elem)-1 = toInt elem) el) x) == n) list
//Start = checkSumOfIntParts [[1.2, 3.4, 5.6, 5.0], [1.2, 3.4]] 14

//intValue :: Real -> Int
//intValue n
//| toReal(toInt n) > n = (toInt n) - 1
//= toInt n

findGreater :: [Char] Char -> Char
findGreater [x:xs] a
| last [x:xs] <= a = x  
| x > a = x
= findGreater xs a 

//Start = findGreater ['c', 'f', 'j'] 'c'
//Start = findGreater ['x', 'x', 'y', 'y'] 'z'
//Start = findGreater ['c', 'f', 'j'] 'a'
//Start = 'c' < 'a'






