module red_points
import StdEnv


// 30. (bonus point) Compute the average of a list of float point numbers using the foldr function
// in one line code using one lambda function.
avg :: [Real] -> Real
//avg list = map ((\x = x ++ [sum x])/length) 
avg list = (foldr (+) 0.0 list)/fromInt(length(list))

//Start = avg [16.2, 17.8, 11.5] // 15.1666666666667
//Start = avg [13.0, 40.9] // 26.95



// 31. (bonus point) Write a function that takes a list of numbers and adds the first element,
// subtracts the second element, adds the third element, subtracts the fourth element, so on, 
// in this alternating repetition.
// For example: [2,3,4,5,6,7] -> 2-3+4-5+6-7 = -3
sum2 :: [Int] -> Int
sum2 [] = 0
sum2 [x] = x 
sum2 [x:_:xs] = x + sum2 xs

diff :: [Int] -> Int
diff [] = 0
diff [x] = 0
diff [_:x:xs] = (0 - x) + diff xs

alternatingSum :: [Int] -> Int
alternatingSum list = sum2 list + diff list

//Start = alternatingSum [2..7] //-3
//Start = alternatingSum [45,-5,63,46,-345,4321] //-4599
//Start = alternatingSum [] //0

