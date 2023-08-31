// Write a function that takes Int argument and 
//checks if this number is a palindrome.
// Palindrome is a number that is the same when 
//we read from left to right or from right to left.

module isPal
import StdEnv

sum :: Int Int -> Int
sum x i
| x < 10 = x
= (x rem 10)*i + sum (x/10) (i*i)

is_palindrome:: Int -> Bool
is_palindrome x = sum x 1 == x


//Start = is_palindrome 44

// Start = is_palindrome 0 // True
//Start = is_palindrome 55 // True
// Start = is_palindrome 49594 // True
// Start = is_palindrome 1337 // False