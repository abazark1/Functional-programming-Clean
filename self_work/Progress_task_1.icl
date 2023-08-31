module Progress_task_1

import StdEnv 

/*
The function decimal takes a real number and returns the decimal part of the number,
write the implementation of the function.
*/

decimal :: Real -> Real
decimal x 
| x > toReal(toInt(x)) = x - toReal(toInt x)
= x - toReal(toInt x) + 1.0



//Start = decimal 1.5 // 0.5
Start = decimal 36.355 // 0.35
//Start = decimal 4.6 // 0.6
