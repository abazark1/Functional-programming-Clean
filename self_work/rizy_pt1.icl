module rizy_pt1

import StdEnv

/*
    Given a three digit number, check 
    if the middle digit of this number is odd or even;
    E.g:
        154  : the middile digit is 5 and it is odd => output should be "Odd"
        545 :  the middile digit is 4 and it is even => output should be "Even"
*/
checkAux :: Int -> Bool
checkAux x = isEven((x/10)/10)
//Start = checkAux 154

check :: Int -> String
check x 
|x == checkAux x = "Even"
="Odd"

//Start = check 154 // "Odd"
//Start = check 222 // "Even"
//Start = check 111 // "Odd"
//Start = check 545 // "Even"


