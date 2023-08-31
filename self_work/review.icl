module review
import StdEnv

//Smallest subarray

/*lengthOfSmallestSubarray :: [Int] Int -> [Int]
lengthOfSmallestSubarray list n = [x \\ x <- [1..n]  |  (x + x )> n]
//Start = lengthOfSmallestSubarray [1..100] 56

subarray :: [Int] Int -> [[Int]]
//subarray list x = [take n (drop i xs) \\ i <- [0..lengthxs], n <- [1..length xs - i] | sum (take n (drop i xs)
subarray list n = [take x (drop y list) \\ y <- [0..length(list)], x <- [1..length list - y] | (sum (take x(drop y list)) > n)]
//Start = subarray [1..100] 56

aux :: [[Int]] Int -> [[Int]]
aux []
aux [x:xs] minValue 
| minValue > length x = aux xs (length x)
= aux xs minValue

sortLen :: [[Int]] -> [[Int]]
sortLen [x:xs]  = aux [x:xs] (length (hd[x:xs]))

answer :: [Int] Int -> [Int]
answer list x = (sort(subarray list x))
Start = answer [1..100] 56
*/

