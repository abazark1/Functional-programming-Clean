module consultation
import StdEnv

myfun :: [Int] [Int] -> Bool
myfun l1 l2 = l1 < l2


//Start = myfun [2,8,9] [2,3]

// / Examples
// :: Tree a = Node a (Tree a) (Tree a) //type tree of 2 constructors Node and Leaf . (Tree a) and (Tree a) are calls
//           | Leaf



// // Tree1 see link: http://graphonline.ru/en/?graph=RDODcKkbEjpzIbIh
// Tree1 :: Tree Int
// Tree1 = Node 7 Leaf Leaf



// // Tree2 see link: http://graphonline.ru/en/?graph=apYgfCbqYeaQRHNL
// Tree2 :: Tree Int
// Tree2 = Node 0 (Node 1 (Node 3 Leaf Leaf) (Node 4 Leaf Leaf)) (Node 2 (Node 5 Leaf Leaf) (Node 6 Leaf Leaf))



// // Tree3 see link: http://graphonline.ru/en/?graph=YMMkGtZycajcoXEU
// Tree3 :: Tree Int
// Tree3 = Node 0 (Node 1 (Node 3 Leaf (Node 8 Leaf Leaf)) Leaf)  (Node 2 Leaf Leaf)


// // 2. Given a tree, find its depth.
// depth :: (Tree a) -> Int
// depth Leaf = 0
// depth (Node _ le ri) = (max (depth le) (depth ri)) + 1    //We don't care about Nodes here



//Start = depth Tree1 // 1                
//Start = depth Tree2 // 3
//Start = depth Tree3 // 4



:: Point newType = { x :: newType , y :: newType }

distance :: (Point newType) (Point newType) -> Real | toReal newType
distance a b = sqrt(((toReal a.x ) - (toReal b.x))^2.0 + ((toReal a.y ) - (toReal b.y))^2.0)
// where 
//     x1 = toReal a.x 
//     x2 = toReal b.x 
//     y1 = toReal a.y 
//     y2 = toReal b.y

p1 :: (Point Int)
p1 = {x = 3, y = 4}

p2 :: (Point Real)
p2 = {x = 8.0, y = 1.0}

p3 :: (Point Real)
p3 = {x = 7.0, y = 0.0}

p4 :: (Point Int)
p4 =  {x = 3, y = 4}

//Start = distance p1 p4

origin :: (Point Int)
origin = {x = 0, y = 0}


instance + (Point newType) | + newType
where (+) a b = {x = a.x + b.x , y = a.y + b.y}
//Start = p1 + p2


instance - (Point k) | - k
where (-) a b = {x = a.x - b.x , y = a.y - b.y}
//Start = p1 - p2

instance zero (Point newType) | zero newType
where zero = {x = zero , y = zero}

// sum :: [a] -> a | + , zero a
// for sum we need a zero instance
//Start = sum[p1, p2, origin]

instance == (Point newType) | Eq newType
where (==) a b = a.x == b.x && a.y == b.y 
//Start = isMember {x = 7 , y = 6} [p1, p2, origin]




:: Circle a = { center :: (Point a) , radius :: a }

c1 :: (Circle Int)
c1 = {center = origin , radius = 4}

c2 :: (Circle Real)
c2 = {center = p2 , radius = 3.0}

c3 :: (Circle Real)
c3 = {center = p3 , radius = 4.0}


// overlap :: (Circle a) (Circle a) -> Bool | Eq a
// overlap a b = r2 >= (sqrt(distance point1 point2) + r1)
// where 
//     point1 =(a.center)
//     point2 =(b.center)
//     r1 = if toReal (a.radius)
//     r2 = toReal (b.radius)
// // Start = overlap c1 c1


//usage of if in clean
myfunn :: Int -> String
myfunn x = if (x>0) "Bigger than 0" "Smaller"

//Start = myfunn -6

/* Three lists are given. The first list contains chars to represent functions
The second list contains the argument of those functions, and the third list is where you have to implement these
Go through the first and the second list and implement the functions on each element of the third list.
You can assume that the 1st and second list's length is the same. But the third list have arbitrary number of elements.




For example: 1st list (5 possible values): ['+', '*', '/', '^', '%'] + - add * multiply / integer division ^ power % remainder
             2nd list : [2,5,3]
             3rd list : [45, 24]
             
             
Result would be: [(((45 + 2) * 5) / 3), (((24 + 2) * 5) / 3)]  



Try to use higher order function if possible. */


selectoperator :: Int Char Int  -> Int
selectoperator x o y 
| o == '+' = x + y
| o == '-' = x - y
| o == '*' = x * y
| o == '/' = x / y
| o == '^' = x ^ y
| o == '%' = x rem y
= 0

xyfun :: [Char] [Int] Int -> Int
xyfun _ [] updatedValue = updatedValue
xyfun [] _  updatedValue = updatedValue 
xyfun [o:os] [v:vs] updatedValue = xyfun os vs (selectoperator updatedValue o v)


calc :: [Char] [Int] [Int] -> [Int]
calc operators values list = map (xyfun operators values) list


//Start = calc ['*', '*'] [3,4] [1,2,3,4,5,6,9] // [12, 24, 36, 48, 60, 72, 108]
//Start = calc [] [] [24,341,35,56,74] //= [24, 341, 35, 56, 74]
//Start = calc ['+', '^', '%'] [1, 2, 3] [2, 56, 78, 47, 4] // [0, 0, 1, 0, 1]


isPrime :: Int -> Bool
isPrime n = isEmpty [1 \\ x<-[2..n-1] | (n rem x) == 0]
//Start = isPrime 5

divisorr n = [x \\ x<-[1..n] | (n rem x )== 0]

Start = divisorr 20