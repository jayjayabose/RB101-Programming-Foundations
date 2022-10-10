# PROBLEM

# Given the following data structure 
# use a combination of methods, including either the select or reject method, 
# to return a new array identical in structure to the original but containing only the integers that are multiples of 3.

# input: two-level nested array
# output: new two-level nested array
# rules: 
#   Explicit
#   - output contains only integers that are multiples of three

# EXAMPLES / TEST CASES

# arr = [[2], [3, 5, 7], [9], [11, 13, 15]] # ==> arr = [[], [3], [9], [15]]

# DATA STRUCTURES

# 2-level nested array

# ALGORITHM

# loop through level 1 array [.map]
# - loop through each element (level 2 array) [.select]
#   - select eleements divisible by three


arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

arr_new = arr.map do |array_level_2|
  array_level_2.select do |element| 
    element % 3 == 0
  end    
end  

p arr_new