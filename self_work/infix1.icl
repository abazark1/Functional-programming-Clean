module infix1
import StdEnv
/*1. Create a toInt instance for the Person record. An integer representation of a person
 is the sum of the length of its firstName, their age and height.
*/
::Person={firstName::String, age::Int, height::Int}
Rose::Person
Rose={firstName="Rose",age=23,height=172}
Jack::Person
Jack={firstName="Jack",age=25,height=193}
Emilia::Person
Emilia={firstName="Emilia",age=15,height=160}
Leo::Person
Leo={firstName="Leo",age=16,height=175}
Grace::Person
Grace={firstName="Grace",age=35,height=165}
Harry::Person
Harry={firstName="Harry",age=42,height=180}
Emilia2::Person
Emilia2={firstName="Emilia",age=15,height=180}
// TO DO instance
// TO DO instance

//len :: Person -> Int
//len x = length[ c \\ c<-: x.firstName]

instance toInt Person
where
  toInt x = len + x.age + x.height
  where
  	len = length[ c \\ c<-: x.firstName]
  
//instance
//Start = toInt Rose // 199
//Start = toInt Leo // 194
//Start = toInt Grace // 205