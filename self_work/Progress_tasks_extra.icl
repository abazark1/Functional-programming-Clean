module Progress_tasks_extra
import StdEnv

/*1- Write a function which removes all characters from a string except numbers.
    Assume that all the numbers in the string are positive integer numbers. 
*/


removeChars :: String ->  String
removeChars str  = toString array
where
	array = [t \\ t <-: str | (t == toChar(toInt t))]


//ls = [t \\ t<-: stb | not (isMember t la)]



//Start = removeChars "Hello123jf5j539" //  "1235539"
//Start = removeChars "1234tt" //  "1234"
// Start = removeChars "h44kjm" //  "44"
// Start = removeChars "Hello " //  ""



:: Tree a = Node a (Tree a) (Tree a) | Leaf

bestTree :: (Tree Int)
bestTree = Node 10(Node 6(Node 1 Leaf(Node 5(Node 2 Leaf(Node 4(Node 3 Leaf Leaf)Leaf))Leaf))Leaf)(Node 14(Node 11 Leaf(Node 13(Node 12 Leaf Leaf)Leaf))(Node 17(Node 15 Leaf(Node 16 Leaf Leaf))(Node 19(Node 18 Leaf Leaf)(Node 20 Leaf Leaf))))
ourTree :: (Tree Int)
ourTree = Node 15(Node 3(Node 1 Leaf Leaf)(Node 10(Node 7 Leaf (Node 8 Leaf Leaf))(Node 13 (Node 11 Leaf Leaf) Leaf)))(Node 20 (Node 18 Leaf (Node 19 Leaf Leaf)) (Node 21 Leaf (Node 26 (Node 24 Leaf Leaf) (Node 28 Leaf Leaf))))
shortTree :: (Tree Int)
shortTree = Node 14(Node 11 Leaf(Node 13 Leaf Leaf))(Node 17(Node 15 Leaf Leaf)Leaf)
noTree :: (Tree Int)
noTree = Leaf
unitTree :: (Tree Int)
unitTree = Node 1337 Leaf Leaf

/* 2-
    Write a function that takes a tree as an argument and counts "left-only"
    nodes. A node is "left-only" if it has non-leaf node as a left child and
    leaf node as a right child.
*/

leftOnly :: (Tree Int) -> Int
leftOnly Leaf = 0
leftOnly (Node x Leaf Leaf) = 0
leftOnly (Node x Leaf r) = leftOnly r
leftOnly (Node x l Leaf) = 1 + leftOnly l
leftOnly (Node x l r) = leftOnly l + leftOnly r


//Start = leftOnly bestTree // 4
//Start = leftOnly ourTree // 3
//Start = leftOnly shortTree // 1
//Start = leftOnly unitTree // 0
//Start = leftOnly noTree // 0