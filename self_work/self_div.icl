module self_div
import StdEnv


//filter(not o isEven) = o is composition like f o g
//(Int->INt) = returns a FUNCTION from int to int
//that's why succ = (+) 5, we didn't write succ x here

//selfAux :: Int -> Bool
//selfAux x 
//| x rem (x/10) == 0 && x rem (x rem 10) == 0 = True
//= False
//Start = selfAux 22
//Start = selfAux 23

self :: Int Int -> [Int]
self x n 
| x > n = []
| x < 10 = [x] ++ self (x+1) n
| x rem 10 <> 0 && (x rem (x/10) == 0) && (x rem (x rem 10) == 0) = [x] ++ self (x+1) n
= self (x+1) n

//Start = self 1 22
//Start = self 45 78

/*middle :: [Int] -> Int
middle [] = 0
middle x = x!!((length x) / 2)

digits :: [Int] -> Int
digits list = (hd list)*100 + (middle list)*10 + last list*/

//Start = digits [4,5,6]

toStringAux :: [Int] -> String
toStringAux [] = ""
toStringAux [x:xs] = toString(x) +++ (toStringAux xs)
//Start = toStringAux [3,4,5]


digits2 :: [[Int]] -> [Int]
digits2 [] = []
digits2 [x:xs]
| isEven(sum(x)) = [sum(x)] ++ digits2 xs
= [toInt(toStringAux(x))] ++ digits2 xs
//Start = digits2 [[1,2,3],[4,5,6],[7,8,9],[10,11,12]]