module Progress_task_3

import StdEnv



/*1. Given the list of lists of integers, modify it in a following way:
I. For each list, remove all numbers which are multiple of 3
II. Sort remaining list in descending order
*/

/*decsend :: [Int] -> [Int]
decsend [] = []
decsend [x:xs] 
| x > hd[x:xs] = [x]++decsend xs
= decsend xs
Start = decsend [3,5,7,2,9,5]*/

antiThrees :: [[Int]] -> [[Int]]
antiThrees [] = []
antiThrees [x:xs]
| x rem 3 == 0 = [sort(antiThrees xs)]
= [sort([x]) ++ antiThrees xs]


/*antiThrees :: [[Int]] -> [[Int]]
antiThrees [] = []
antiThrees [x:xs]
|x == [x rem 3 == 0] = antiThrees xs
= [x: antiThrees xs]*/


Start = antiThrees [[4,3,2],[3,6,1], [6,5,8,3,2]] // [[4,2],[1], [8,5,2]]
//Start = antiThrees [[1..6],[], [3,6,9,12]] // [[5,4,2,1],[],[]]
//Start = antiThrees [] // []
 