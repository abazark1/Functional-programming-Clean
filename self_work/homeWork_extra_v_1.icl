module homeWork_extra_v_1
import StdEnv




/*1-Closest avg
    * Given a list of lists of real numbers, for every sublist find the item in the sublist which is closest 
    * to the average of the sublist.
    * e.g [[1.3, 5.2, 7.7, -2.3, 23.45] , [3.0,8.4] ] ->  avg of [1.3, 5.2, 7.7, -2.3, 23.45]  is 7.07 
    * so the closest value from the list is  7.7
    * similarly  avg of [3.0,8.4] is 5.7  so the closest value from the list is 3.0
*/
closestToAvg :: [[Real]] -> [Real]


//Start = closestToAvg [[1.3, 5.2, 7.7, -2.3, 23.45] , [3.0,8.4] ] //  [7.7,3] 
//Start = closestToAvg [[2.4 ,4.5 ,6.7 ,6.6 ,7.7] , [5.6 , 6.8 ,4.8 , 4.1] , [5.5,5.1] , [5.0] , [7.8] ] // [6.6,5.6,5.5,5,7.8]
//Start = closestToAvg [[1.3]] // [1.3]





/*1. Smallest subArray
    * Given a list of integer numbers and an integer, find the smallest consecutive
    * subarray the sum of which is greater than the given integer.
    * Example :
            Integer =  97
            Smallest subarray in  [ 1, 5, 20, 70, 8] whose sum is greater than 97 is  [20, 70, 8]
            the output should be [20, 70, 8]  
*/
// lengthOfSmallestSubArray ::  [Int] Int -> [Int]


// Start = lengthOfSmallestSubArray [1, 5, 20, 70, 8] 97 // [20, 70, 8]
// Start = lengthOfSmallestSubArray [1..100] 56 // [28,29]
// Start = lengthOfSmallestSubArray [1..23] 275 // [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23]
