1. what is != and where should you use it?
  comparison operator; not equal
  useful where you need a condition (e.g. if (condition))

2. put ! before something, like !user_name  
  negation operator
  gives the inverse of user_name.  if it s a truty value will evaluate to false

3 put ! after something, like words.uniq!
  it is part of the method user_name
  typically methods named with ! at the end will mutate the caller
  
4. put ? before something
  can be use as a ternary operator but that requires a condition and then :

5. put ? after something

6. put !! before something, like !!user_name
 convert to user_name to booelan based on it's truthiness and doble negate it, so not change the boolean value
