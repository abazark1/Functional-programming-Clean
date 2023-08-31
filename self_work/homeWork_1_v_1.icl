module homeWork_1_v_1
import StdEnv


/*

1- write the removeLast function which removes the last digit from a given number, if the number < 10 return the number it self.   
*/

removeLast :: Int -> Int 
removeLast x
| x > 10 = (x - (x rem 10))/10
= x

//Start = removeLast 1223    // 122
//Start = removeLast  10     // 1
//Start = removeLast  23     // 2
//Start = removeLast 9       // 9 
//Start = removeLast -58545  // -58545

Start = hd [1..5] == drop 5 [5,4,3,2,1]




/*
Impelement the caculator function bellow which gets two integer numbers and an operator in the form of a string and returns the result of 
(first number)  operator (second number)
Assume that there are only 4 operators which are + , - , / , * .
*/

//

calculator :: Int Int String -> Int
calculator x y z
| z == "+" = x + y
| z == "*" = x * y
| z == "/" = x / y
= x - y
 


//Start = calculator 1 2 "+" // 3 
//Start = calculator 5 2 "*" // 10 
//Start = calculator 8 2 "/" // 4 
//Start = calculator 1 1 "-" // 0 



