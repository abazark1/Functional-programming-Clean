module Progress_task_9


import StdEnv


/* Complete the record "Entry" that will have
 * 2 fields a string "key" and integer "value".
 * Write a function that takes a list of keys and
 * list of integers as arguments and converts them
 * to the list of entries, where first entry has first
 * key and first value, second entry has second key/value
 * and so on. 
 */
:: Entry = {
			key :: String,
			value :: Int
			}
			
instance +++ Entry
where
	(+++) a n = a.key +++ " " +++ toString(n.value)

group :: [String] [Int] -> [Entry]
group str int = [x +++ n\\ x <- str & n <- int]

Start = group ["A","B"] [1,2] // [(Entry "A" 1),(Entry "B" 2)]
//Start = group ["A","B"] [1,2,3] // [(Entry "A" 1),(Entry "B" 2)]
//Start = group [] [] // []