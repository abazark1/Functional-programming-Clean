module kdjfvfak

import StdEnv

/*2- Given two real numbers decide whether  the sum of the two numbers after the decimal points  of the two numbers is Even or not
assume there is only one number after the decimal point  
Hint : You can use (toInt) function .  */

decimal :: Real -> Real
decimal x 
| x > toReal(toInt(x)) = toReal(toInt x)
= toReal(toInt x) - 1.0

isEvenDecimal :: Real Real -> Bool
isEvenDecimal x y = isEven(toInt((x+y)-(decimal(x+y))*10.0))
 
//Start = isEvenDecimal 5.3 4.6 // False
//Start = isEvenDecimal 4.1 4.6 // False
Start = isEvenDecimal 1.2 6.6 // True

