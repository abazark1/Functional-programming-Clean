module vector
import StdEnv

getLen :: Vector3 -> Real
getLen {x = a, y = b, z = c} = a^2.0 + b^2.0 + c^2.0

class *== a
where
    (*==) :: !a !a -> Bool
    (*==) x y = x == y
/*
    (!=) infix 4 :: a a -> Bool
    (!=) x y := x <> y

    (*<) infix 4 :: a a -> Bool
    (*<) x y := x < y
    
    (*>) infix 4 :: a a -> Bool
    (*>) x y := x > y
    
    (*<=) infix 4 :: a a -> Bool
    (*<=) x y := x <= y
    
    (*>=) infix 4 :: a a -> Bool
    (*>=) x y := x >= y
    */
    
::Vector3 = { x :: Real, y :: Real, z :: Real}

instance *== Vector3
where
    (*==) :: !Vector3 !Vector3 -> Bool
    (*==) x y = len_x == len_y/*
    (!=) x y = not (len_x == len_y)
    (*<) x y = len_x < len_y
    (*>) x y = len_x > len_y
    (*<=) x y = len_x <= len_y
    (*>=) x y = len_x >= len_y*/
    where
        len_x = getLen x
        len_y = getLen y

  
//Start = {x = 1.0, y = 1.0, z = 1.0} *== {x = 1.0, y = 1.0, z = 1.0} // True
//Start = {x = 3.0, y = 4.0, z = 10.0} *== {x = 5.0, y = 0.0, z = 10.0} // True
//Start = {x = 1.0, y = 1.0, z = 1.0} != {x = 2.0, y = 1.0, z = 1.0} // True
//Start = {x = 1.0, y = 1.0, z = 1.0} *< {x = 2.0, y = 1.0, z = 1.0} // True
//Start = {x = 1.0, y = 1.0, z = 1.0} *> {x = 2.0, y = 1.0, z = 1.0} // True
//Start = {x = 1.0, y = 1.0, z = 1.0} *<= {x = 1.0, y = 1.0, z = 1.0} // True
//Start = {x = 1.0, y = 1.0, z = 1.0} *>= {x = 1.0, y = 1.0, z = 1.0} // True