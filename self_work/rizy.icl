module rizy
import StdEnv

/* pt5:
    Given a list of tuples and an integer number, each tuple contains a name and a list of real numbers representing
    the marks of the student optained in a subject.
    Return the names of the  students whose average of grades is greter than or equal to a given integer. 
*/
first :: (String,[Real]) -> String
first tup = fst tup



PT5Aux :: (String,[Real]) Int -> [String]
PT5Aux tup n 
| avg[x \\ x <- snd tup] >= toReal(n) = [first tup]
Start = PT5Aux ("Abood", [22.83,94.6,86.7,88.9,88.9])

//PT5 :: [(String,[Real])] Int -> [String]
//PT5 tupList n = map PT5Aux tupList n

//Start = PT5 [("Abood" , [22.83,94.6,86.7,88.9,88.9]) , ("Abdullah" , [52.3,54.6,6.7,8.9,8.9])] 50 // "Abood"
// Start = pt5 [("Abood" , [22.83,94.6,86.7,88.9,88.9]) , ("Abdullah" , [52.3,54.6,6.7,8.9,8.9]) ,  ("Ranya" , [92.3,74.6,77.7,77.9,8.9])] 50 // ["Abood","Ranya"]
// Start = pt5 [] 50 // []