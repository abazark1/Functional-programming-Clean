module midterm3
import StdEnv 


toDigits :: Int -> [Int]
toDigits 0 = []
toDigits x = toDigits(x/10) ++ [x rem 10]
//Start = toDigits 134]

l6 = [[y \\ x <- [1..y]]  \\ y<-[1..10]]

//Start = l6

isVowel :: Char -> Bool
isVowel ch = isMember ch ['a','e','i','o','u']

searchDigit :: [Int] Int Int -> Int
searchDigit [] n k = -1
searchDigit [x:xs] n k 
| x == n = k
= searchDigit xs n (k+1)

countOcc :: [Int] Int -> Int
countOcc [] n = 0
countOcc [x:xs] n 
| n == x = 1 + countOcc xs n
= countOcc xs n

multiple :: Int -> [Int]
multiple 1 = []
multiple x = [x*i \\ i <- [2..x]]

//Start = multiple 5 // [10,15,20,25]
//Start = multiple 2 // [2]

hof :: [Int] [Int] (Int -> Int) -> [Int]
hof x y function = filter (\x = x > 0)(map function (map ((!!) x) y))

//     e.g. checkEven [1,1,2,2,2,2,3,5,3,5] = True  
checkAux1 :: [Int] Int -> Bool
checkAux1 list n = isEven(length(filter((==)n)list))
Start = checkAux1 [1,1,2,2,2,2,3,5,3,5] 1

/* 4. List difference  

 The difference is defined as follows:  
 The List L1-L2 consists of elements that are in L1 but not in L2. 
 For example if L1=[1,2,3] and L2=[3,5], then L1-L2=[1,2].
*/
diff :: [Int] [Int] -> [Int]
diff x [] = []
diff [] y = []
diff [x:xs] [y:ys] 
| x == y = diff xs [y:ys]
= [x] ++ diff xs ys

//Start = difference [[1..5]] [[4..7]] // [[1,2,3]]
//Start = difference [[1..10] , [10..15] , [1..4]] [[1..10] , [11..20] , [5]] // [[],[10],[1,2,3,4]]

group_by_marks :: [(String, Int)] Int -> ([(String,Int)], [(String,Int)])
group_by_marks list mark = (failed, passed)
where
	 failed = filter (\x = snd x < mark) list
	 passed = filter (\x = snd x >= mark) list
	 
isGoodList :: [Int] -> Bool
isGoodList [] = True
isGoodList [x] = True
isGoodList [x,y:xs] = (isOdd(x) && isEven(y)) && isGoodList [y:xs] //evenOddEvenOdd
 
// 5. Replace middle

repMid :: [[Int]] Int -> [[Int]]
repMid lists n = [take((length x)/2) x ++ [n] ++ drop(((length x)/2)+1) x \\ x <- lists]

//Start = repMid [[1,2,3],[1..4]] 10 // [[1,10,3],[1,2,10,4]]


isPrime :: Int -> Bool
isPrime x 
| x == 1 = False
= isEmpty[y \\ y <- [2..(x-1)] | x rem y == 0]

//Start = isPrime 7


/* 8. Super Digit
 E.g  : super_digit(9875) = super_digit(9+8+7+5) 
                          = super_digit(29) 
                          = super_digit(2+9)
                          = super_digit(11)
                          = super_digit(1+1)
                          = super_digit(2)
                          = 2
 
*/
super :: Int -> Int
super 0 = 0
super x 
| length(toDigits x) == 1 = x
= super(sum(toDigits x))
//Start = super 9875


/* 10. Twin primes
 E.g: between 1 and 50 there are 6 pairs of twin prime numbers:
 [(3,5),(5,7),(11,13),(17,19),(29,31),(41,43)].
*/

twins :: Int Int -> [(Int,Int)]
twins x y = [(a, n) \\ a <- [x..y], n <- [x..y]| isPrime(a) && isPrime(n) && (n-a==2 || n+a==2)]
//Start = twins 1 50


/* 1. Parasitic Number
 e.g. 102564 × 4 = 410256
*/

parasitic :: Int Int -> Bool
parasitic x y = x * y == toInt(toString(x rem 10) +++ toString(x/10))

//Start = parasitic 102564 4 // True
//Start = parasitic 714285 8 // False
