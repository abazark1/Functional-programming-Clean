module listGen

import StdEnv



listGen :: Int -> [Int]
listGen x
| x <= 0 = []
| x == 1 = [1]
= (listGen(x-1)++[x])
Start = listGen 10