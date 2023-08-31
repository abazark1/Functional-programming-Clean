module Extra 
import StdEnv 

:: Tree a = Node a (Tree a) (Tree a) 
          | Leaf
          
myTree =  Node 10 (Node 8 (Node 4 (Node 3 Leaf Leaf) Leaf) (Node 7 Leaf Leaf) ) (Node 7 (Node 6 Leaf Leaf) (Node 5 Leaf (Node 4 Leaf Leaf)))
tree1 = Node 2 (Node 5 (Node 3 (Node 24 Leaf Leaf) Leaf) (Node 6 Leaf (Node 7 Leaf Leaf))) (Node 8 (Node 15 Leaf (Node 10 Leaf (Node 14 Leaf Leaf))) (Node 13 Leaf (Node 16 Leaf Leaf)))
tree2 = Node "abc" (Node "ghi" (Node "func" (Node "zyh" Leaf Leaf) Leaf) (Node "tional" Leaf (Node "haha" Leaf Leaf))) (Node "xyz" (Node "program" Leaf (Node "zyx" Leaf Leaf)) (Node "ming" Leaf (Node "cba" Leaf Leaf)))


/*1-
	Given a tree and an integer, if the given integer is odd, return all the elements at odd levels of the tree,
    otherwise, return all the elements at even levels of the tree. 
    The returned list of elements should be sorted. 
    Example:
    Given the following tree and number 7: 
					 10
				   /    \
				  8      7
				 / \    / \
				4   7  6   5
			   / \ / \/ \ / \
			  3   LL LL LL   4
    
    returned list should be [4,5,6,7,10] because 7 is an odd number 
    and the elements at odd levels in the tree are 4,5,6,7,10.

*/

task1 ::  (Tree a) Int -> [a] | Ord a
task1 (Node x le ri) num
|	

Start = task1 myTree 7    // [4,5,6,7,10]
// Start = task1 myTree 2    // [3,4,7,8]
// Start = task1 tree1 2     // [5,7,8,10,16,24]
// Start = task1 tree1 51    // [2,3,6,13,14,15]
// Start = task1 tree2 2     // ["cba","ghi","haha","xyz","zyh","zyx"]
// Start = task1 tree2 51    // ["abc","func","ming","program","tional"]



::Movie = {
			title::String,
			casts::[Cast],
			year::Int,
			rating::Real,
			country::String
			}
::Gender = Male | Female
::Cast = {
			name::String,
			gender::Gender
			}

cast1 = { name="Jackie Chan", gender= Male}
cast2 = { name="Jet Li", gender= Male }
cast3 = { name="Millie Bobby Brown", gender=Female}
cast4 = { name="Chris Hemsworth", gender=Male }
cast5 = { name="Zendaya", gender=Female }
cast6 = { name="Emma Stone", gender=Female }
cast7 = { name="Emma Watson", gender = Female }
cast8 = { name="Sandra Bullock", gender = Female}
cast9 = { name="Chris Evans", gender= Male}
cast10 = { name="Tom Holland", gender=Male}
cast11 = { name="Tobey Maguire", gender=Male}
cast12 = { name="Bae Suzy", gender=Female}
cast13 = { name="Park Seo Joon", gender=Male}

movie1 = { title="MOVIE I.", casts=[cast1, cast6, cast10], year=2019, rating=8.5, country="USA"}
movie2 = { title="MOVIE II.", casts=[cast4, cast8, cast7], year=2020, rating=8.0, country="Spain"}
movie3 = { title="MOVIE III.", casts=[cast13, cast12, cast9], year=2019, rating=9.0, country="Korea"}
movie4 = { title="MOVIE IV.", casts=[cast3, cast11, cast8], year=2021, rating=6.5, country="India"}
movie5 = { title="MOVIE V.", casts=[cast2, cast4, cast10], year=2022, rating=7.4, country="Hungary"}
movie6 = { title="MOVIE VI.", casts=[cast3, cast5, cast8], year=2022, rating=7.4, country="Hungary"}


movieList = [movie1,movie2,movie3,movie4,movie5, movie6]



/*2- 
	Given a list of "Movie"s, 
	task1: Return the count of movies where all the cast are of same gender.
	task2: Return the name of the movie that has the lowest rating.
*/


// task1
// sameGender:: [Movie] -> Int

// task2
// movieMinRating:: [Movie] -> String


// Start = sameGender movieList 	// 2
// Start = movieMinRating movieList	// "MOVIE IV."