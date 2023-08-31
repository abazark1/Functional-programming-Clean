module tree_pr
import StdEnv

// Binary tree: https://www.geeksforgeeks.org/binary-tree-data-structure/
// Binary search tree: https://www.geeksforgeeks.org/tag/binary-tree/

// Examples
:: Tree a = Node a (Tree a) (Tree a) 
          | Leaf

// Tree1 see link: http://graphonline.ru/en/?graph=RDODcKkbEjpzIbIh
Tree1 :: Tree Int
Tree1 = Node 7 Leaf Leaf

// Tree2 see link: http://graphonline.ru/en/?graph=apYgfCbqYeaQRHNL
Tree2 :: Tree Int
Tree2 = Node 0 (Node 1 (Node 3 Leaf Leaf) (Node 4 Leaf Leaf))  (Node 2 (Node 5 Leaf Leaf) (Node 6 Leaf Leaf)) 
//Start = Tree2

// Tree3 see link: http://graphonline.ru/en/?graph=YMMkGtZycajcoXEU
Tree3 :: Tree Int
Tree3 = Node 0 (Node 1 (Node 3 Leaf (Node 8 Leaf Leaf)) Leaf)  (Node 2 Leaf Leaf)



// 1. Given a tree, find the number of its nodes (non leaves).
sizeT :: (Tree a) -> Int
sizeT Leaf = 0
sizeT (Node x l r) = 1 + sizeT l + sizeT r


//Node a l r ->a(value/key), l(left subtree->Tree a), r(right subtree->Tree a)
/*
=1 + sizeT (Node 1 (Node 3 Leaf Leaf) (Node 4 Leaf Leaf)) 
   + sizeT (Node 2 (Node 5 Leaf Leaf) (Node 6 Leaf Leaf))
=1 + 1 + sizeT (Node 3 Leaf Leaf) + sizeT (Node 4 Leaf Leaf)
   + 1 + sizeT (Node 5 Leaf Leaf) + sizeT (Node 6 Leaf Leaf)
=1 + 1 + (1 + sizeT Leaf + sizeT Leaf) + (1 + sizeT Leaf + sizeT Leaf)
   + 1 + (1 + sizeT Leaf + sizeT Leaf) + (1 + sizeT Leaf + sizeT Leaf)
=1 + 1 + (1+0+0) + (1+0+0)
   + 1 + (1+0+0) + (1+0+0)
=7
*/
//Start = sizeT Tree1
//Start = sizeT Tree2
//Start = sizeT Tree3



// 2. Given a tree, find its depth.
depth :: (Tree a) -> Int
depth Leaf = 0
depth (Node x l r) = (max (depth l) (depth r)) + 1


//Start = depth Tree1 // 1
//Start = depth Tree2 // 3
//Start = depth Tree3 // 4

//Given a tree with key of type Int, find the sum of its nodes (leaf is 0)
sumT :: (Tree Int)->Int
sumT Leaf = 0
sumT (Node x l r) = x + sumT l + sumT r

//Start = sumT Tree1
//Start = sumT Tree2
//Start = sumT Tree3



// 3. Tree traversal (different ways of converting a given tree into a list):
// Create a tree and write the elements of it in 3 ways: 
// inorder, preorder, postorder

//atree1 :: Tree Int
//Start = atree1

//atree2 :: Tree Int
//Start = atree2


// a. Inorder: Left, Root, Right
inorder :: (Tree a) -> [a] 
inorder Leaf = []
inorder (Node x l r) = inorder l ++ [x] ++ inorder r


//Start = inorder Tree2
// inorder: []++[1]++[]++[2]++[]++[3]++[] = [1,2,3]
//Start = inorder atree2
// inorder: []++[1]++[]++[2]++[]++[3]++[]++[4]++[] = [1,2,3,4]
//Start = inorder Tree3


// b. Preorder: Root, Left, Right
preorder :: (Tree a) -> [a] 
preorder Leaf = []
preorder (Node x l r) = [x] ++ preorder l ++ preorder r


//Start = preorder atree1
// preorder: [2]++[1]++[]++[]++[3]++[]++[] = [2,1,3]
//Start = preorder Tree2


// c. Postorder: Left, Right, Root
postorder :: (Tree a) -> [a] 
postorder Leaf = []
postorder (Node x l r) = postorder l ++ postorder r ++ [x]


//Start = postorder atree1
// postorder: []++[]++[1]++[]++[]++[3]++[2] = [1,3,2]
//Start = postorder Tree2



// 4. Given a (Tree Int), and a list of integers.
// Check if every element from the list is in the tree.

contain :: Int [Int] -> Bool
contain n [] = False
contain n [x:xs] = n == x || contain n xs 

//Start = contain 8 [1, 5, 5]

task1 :: (Tree Int) [Int] -> Bool
task1 (Node x l r) [] = True
task1 (Node x l r) [y:ys] =  contain y (inorder (Node x l r)) && task1 (Node x l r) ys

//Start = task1 Tree2 [1..4] // True
//Start = task1 Tree2 [1..10]// False
//Start = task1 Tree3 [1..10] // False



// 5. Given a (Tree Int) and an integer, 
// write a function which counts how many times
// the given number occurs in the tree.



task2 :: (Tree Int) Int -> Int
task2 Leaf n = 0
task2 (Node x l r) n 
| n == x = 1 + (task2 l n) + (task2 r n)
= (task2 l n) + (task2 r n)

//task21 :: (Tree Int) Int-> Int

abctree :: Tree Int
abctree = Node 2(Node 3(Node 2 Leaf Leaf) (Node 2 Leaf Leaf)) (Node 4(Node 5 Leaf Leaf)Leaf)

//Start = task21 Tree3fiveTimes 3 // 5
//Start = task2 Tree2 (-10) // 0
//Start = task2 abctree 2



// 6. Given a (Tree Int), write a function which gives back a list of triple tuples,
// where each tuple contains the value of the node, the left and the rigth child 
// of only the odd numbers from the tree in preorder traversal
// Leaf is considered to have value of -1.
extract :: (Tree Int) -> Int
extract Leaf = -1
extract (Node x l r) = x

task3 :: (Tree Int) -> [(Int,Int,Int)]
task3 Leaf = []
task3 (Node x l r)
| isOdd(x) = [(x, extract l, extract r)] ++ task3 l ++ task3 r
= task3 l ++ task3 r


//Start = task3 Tree2 // [(1,3,4),(3,-1,-1),(5,-1,-1)]
//Start = task3 Tree3 // [(1,3,-1),(3,-1,8)]
//Start = task3 abctree



// 7. Given a (Tree Int) and an integer, write a function which
// searches the value in the tree. 

searchT :: (Tree Int) Int -> Bool
searchT Leaf n = False
searchT (Node x l r) n 
| n == x = True 
= searchT l n || searchT r n


//Start = searchT Tree2 10 // False
//Start = searchT Tree2 1 // True

//a :: {Int}
//a = {1,2,3}
//Start=[e \\ e <-: a]