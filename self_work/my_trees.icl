module my_trees
import StdEnv

 /* Create record `City`. It should contain 3 fields: name(String), area(Int)
and population(Int). Write `smallCityCount` function which takes list of Cities
and returns number of cities that have area less than 200 and population less than 300 000.
*/

:: City = {name :: String , area :: Int , population :: Int}

budapest={name="Budapest", area=525, population=1756000}
kutaisi={name="Kutaisi", area=67, population=147000}
debrecen={name="Debrecen", area=461, population=202000}
berlin={name="Berlin", area=891, population=3645000}
pisa={name="Pisa", area=185, population=90000}

smallCityCount :: [City] -> Int
smallCityCount [] = 0
smallCityCount [x:xs]
| x.population > 300000 = 1 + smallCityCount xs
 = smallCityCount xs


//Start = smallCityCount [] // 0
//Start = smallCityCount [budapest,kutaisi,debrecen,berlin,pisa] // 2
//Start = smallCityCount [budapest,berlin] // 0
//Start = smallCityCount [kutaisi] // 1


/*:: Tree a = Node a (Tree a) (Tree a) | Leaf

tree1 :: Tree Int
tree1 = (Node 4 (Node 10 (Node 6 Leaf Leaf)(Node 11 Leaf Leaf)) (Node 20 (Node 12 Leaf Leaf) Leaf))

tree2 :: Tree Int
tree2 = (Node 5 (Node 10 (Node 31 (Node 1 Leaf Leaf) Leaf) Leaf) (Node 17 (Node 31 (Node 14 (Node 12 Leaf Leaf) Leaf) Leaf) (Node 11 Leaf Leaf) ))

tree3 :: Tree Int
tree3 = (Node 12 (Node 11 (Node 11 (Node 32 Leaf Leaf) Leaf) Leaf) (Node 4 (Node 17 (Node 5 (Node 7 Leaf Leaf) Leaf) Leaf) (Node 3 Leaf (Node 4 Leaf Leaf)) ))

tree4 :: Tree Int
tree4 = (Node 7 (Node 11 tree1 tree2) (Node 5 tree3 tree2))

tree5 :: Tree Int
tree5 = Node 1 tree3 tree4*/

/* 1. Given the binary tree, count number of leaf nodes in the tree.*/

countLeaves :: (Tree a) -> Int
countLeaves (Leaf) = 1 
countLeaves (Node x l r)= countLeaves l + countLeaves r

//Start = countLeaves tree1 // 7
//Start = countLeaves tree2 // 10
//Start = countLeaves tree3 // 11
//Start = countLeaves tree4 // 38
//Start = countLeaves tree5 // 49

/* 3. Implement a function that interleaves three arrays. So for input arrays {1,2,3}, {4,5,6}
and {7,8,9} the function must return the array {1,4,7,2,5,8,3,6,9}. If an array is out of elements
we continue interleaving the remaining arrays.
Example: {1,2} {3,4,5,6} {7,8,9} -> {1,3,7,2,4,8,5,9,6}
*/
//toList :: [Int] [Int] [Int] -> [Int]
//toList l1 l2 l3 = flatten([x++y++z\\ x<-l1, y<-l2, z<-l3])
/*toList [] [] [] = []
toList [] [y:ys] [z:zs] = [y,z] ++ toList [] ys zs
toList [x:xs] [y:ys] [z:zs]  = [x,y,z] ++ toList xs ys zs*/
//Start = toList [1,2,3] [4,5,6] [7,8,9]

//interleave :: {Int} {Int} {Int} -> {Int}
//interleave ar1 ar2 ar3 = { a b c \\ a <-: ar1 & b <-: ar2 & c <-: ar3}

//Start = interleave {1,2,3} {4,5,6} {7,8,9} // {1,4,7,2,5,8,3,6,9}
//Start = interleave {1,2} {3,4,5,6} {7,8,9} // {1,3,7,2,4,8,5,9,6}
//Start = interleave {} {1,2,3} {4} // {1,4,2,3}
//Start = interleave {} {} {} // {}
//Start = interleave {1,2} {3,4,5} {6,7,8,9,10,11,12} // {1,3,6,2,4,7,5,8,9,10,11,12}


bestTree = Node 10(Node 6(Node 1 Leaf(Node 5(Node 2 Leaf(Node 4(Node 3 Leaf Leaf)Leaf))Leaf))Leaf)(Node 14(Node 11 Leaf(Node 13(Node 12 Leaf Leaf)Leaf))(Node 17(Node 15 Leaf(Node 16 Leaf Leaf))(Node 19(Node 18 Leaf Leaf)(Node 20 Leaf Leaf))))

//ourTree = Node 15(Node 3(Node 1 Leaf Leaf)(Node 10(Node 7 Leaf (Node 8 Leaf Leaf))(Node 13 (Node 11 Leaf Leaf) Leaf)))(Node 20 (Node 18 Leaf (Node 19 Leaf Leaf)) (Node 21 Leaf (Node 26 (Node 24 Leaf Leaf) (Node 28 Leaf Leaf))))

shortTree = Node 14(Node 11 Leaf(Node 13 Leaf Leaf))(Node 17(Node 15 Leaf Leaf)Leaf)

noTree = Leaf

unitTree = Node 1337 Leaf Leaf


/*
Define a type tree.

Write a function that takes a tree as a parameter

and returns a list of the numbers of the nodes whose children are both Leaf.

An empty tree will return [] and a single element tree will return a list of one element*/




//Start = leaves bestTree //[3,12,16,18,20]

//Start = leaves ourTree //[1,8,11,19,24,28]

//Start = leaves unitTree //[1337]

//Start = leaves noTree //[]

:: Tree a = Node a (Tree a) (Tree a) | Leaf

toList :: (Tree Int) -> [Int]
toList Leaf = []
toList (Node x l r) = toList l ++ [x] ++ toList r
//Start = toList ourTree

//5.Given a Binary search tree, return the middle element of the tree
// middle in value NOT in position 
ourTree :: (Tree Int)
ourTree = Node 15(Node 3(Node 1 Leaf Leaf)(Node 10(Node 7 Leaf (Node 8 Leaf Leaf))(Node 13 (Node 11 Leaf Leaf) Leaf)))(Node 20 (Node 18 Leaf (Node 19 Leaf Leaf)) (Node 21 Leaf (Node 26 (Node 24 Leaf Leaf) (Node 28 Leaf Leaf))))

thisTree :: (Tree Int)
thisTree = (Node 20 (Node 11 (Node 6 (Node 2 (Node 1 Leaf Leaf) (Node 3 Leaf Leaf)) (Node 8 (Node 7 Leaf Leaf) (Node 10 Leaf Leaf))) (Node 16 (Node 14 (Node 13 Leaf Leaf) (Node 15 Leaf Leaf)) (Node 19 (Node 18 Leaf Leaf) Leaf))) (Node 36 (Node 26 (Node 22 (Node 21 Leaf Leaf) (Node 24 Leaf Leaf)) (Node 30 (Node 28 Leaf Leaf) Leaf)) (Node 48 (Node 40 (Node 38 Leaf Leaf) (Node 42 Leaf Leaf)) (Node 56 (Node 52 Leaf Leaf) Leaf))))

middle :: (Tree Int) -> Int
middle here = list!!mid
where
	list = toList here
	mid = length(list)/2
	
//Start = middle ourTree
//Start = middle thisTree/
