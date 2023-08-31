module my_prac_1

import StdEnv

//Write a function that will take a digit (Int)
// and return the respective word for it (String).
// For example input of 1 should output One; 
//input of 0 should output Zero; input of 5 should output Five.
// Anything that is not the digit (0-9) should output "Not a digit"

digit_to_string :: Int -> String
digit_to_string x 
| x == 0 = "Zero"
| x == 1 = "One"
| x == 2 = "Two"
| x == 3 = "Three"
| x == 4 = "Four"
| x == 5 = "Five"
| x == 6 = "Six"
| x == 7 = "Seven"
| x == 8 = "Eight"
| x == 9 = "Nine"
= "Not a digit"
//Start = digit_to_string 4 //"Four"
//Start = digit_to_string 0 //"Zero"
//Start = digit_to_string 5 //"Five"
//Start = digit_to_string 10 //"Not a digit"
//Start = digit_to_string -1 //"Not a digit"
//Start = digit_to_string 42 //"Not a digit"


// Write a function that takes Int and checks if 
//this number is prime or not.
// handle the case of negative numbers 
//(negative numbers are not primes).
// 0 and 1 are not prime numbers.
is_prime :: Int -> Bool
is_prime x
|x <= 1 = False
|x == 2 = True
|x == 3 = True
|x == 5 = True
|x == 7 = True
|x == 11 = True
|(x rem 2 == 0 || x rem 3 == 0 || x rem 5 == 0 || x rem 7 == 0 || x rem 11 == 0) = False
= True
//Still not sure about the solution, check later

//Start = is_prime 5 // True
//Start = is_prime 0 // False
//Start = is_prime 1 // False
//Start = is_prime 2 // True
Start = is_prime 2017 // True 
//Start = is_prime -5 // False
//Start = is_prime 121


// Write a function that takes Int argument and 
//checks if this number is a palindrome.
// Palindrome is a number that is the same when 
//we read from left to right or from right to left.

is_palindrome:: Int -> Bool
is_palindrome x
|x < 0 = False
|x < 10 = True
//| x == reverse x = True
= False


//Start = is_palindrome -49594

// Start = is_palindrome 0 // True
//Start = is_palindrome 55 // True
// Start = is_palindrome 49594 // True
// Start = is_palindrome 1337 // False


/*
Write a function that, given a grade as a Real,
will return the respective grade as an Int.
The grade cutoffs are as follows:
1: 0% - 50%
2: 50% - 60%
3: 61% - 70%
4: 71% - 85%
5: 86% - 100%
Return -1 for any invalid input (such as a negative grade).
*/
myGrade :: Real -> Int
myGrade x
| x > 0.0 && x < 50.0 = 1
| x > 49.9 && x < 60.0 = 2
| x > 59.9 && x < 70.0 = 3
| x > 69.9 && x < 85.0 = 4
| x > 84.9 && x < 101.0 = 5
= -1

//Start = myGrade 25.5 //1
//Start = myGrade 90.24 //5
//Start = myGrade -3.42 //-1
//Start = myGrade 49.7


//Define a function which finds the maximum of two numbers
maximum :: Int Int -> Int
maximum a b 
| a > b = a
= b

//Start = maximum 34 56
//Start = maximum 12 7

//Exercises lab 1

// 2. Define a function mini that has two arguments that delivers the minimum of the two.
mini :: Int Int -> Int
mini a b 
| a > b = b
= a

//Start = mini 33 55

// 3. Triple a number.
triple :: Int -> Int
triple x = x*x*x

//Start = triple 3

// 4. Check if a number is odd.
isoddnr :: Int -> Bool
isoddnr x
| x rem 2 == 1 = True
= False

//Start = isoddnr 7


// 5. Check if a number is the sum of two other given numbers.
issum :: Int Int Int -> Bool
issum a b c 
| a == b + c = True
= False

//Start = issum 10 6 4


// 6. Add 100 to a number.
add100 :: Int -> Int
add100 x = 100 + x

//Start = add100 5


// 7. Check if a number is multiple of 10.
ismult10 :: Int -> Bool
ismult10 x = x rem 10 == 0

//Start = ismult10 25

// 8. Add the numbers from 1..N in a recursive function.
addn :: Int -> Int
addn x 
| x == 0 = 0
= x + addn (x - 1)


//Start = addn 1


// 9. Compute the cube of a number
cube :: Int -> Int
cube x = x*x*x

//Start = cube 4


// 10. Check if an integer is even - in two ways. To divide integer use /, for remainder use rem
even1 :: Int -> Bool
even1 x
| x rem 2 == 0 = True
= False

//Start = even1 34
//Start = even1 45

//version 2.
even2 :: Int -> Bool
even2 x 
| (x/2)*2 == x = True
= False

//Start = even2 34
//Start = even2 45


// 11. Add the digits of a number e.g. for 123 is 6
isum :: Int -> Int
isum x 
| x == 0 = 0
= x rem 10 + isum (x/10)

//Start = isum 1234

// Given Integer, find last digit
//120 -> 0
//124 -> 4
//-10 -> 0
//5 -> 5

lastDigit :: Int -> Int
lastDigit x = x rem 10

//Start = lastDigit 146
//Start = lastDigit -10