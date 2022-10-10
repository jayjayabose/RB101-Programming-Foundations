# PROBLEM

# Given the following data structure, 
# return a new array containing the same sub-arrays as the original 
# but ordered logically by only taking into consideration the odd numbers they contain.

# input: array
# output: new array
# rules:
#   Explicit
#   - reorder output array: 
#     - consider only odd integers in each sub array
#     - order in ascending 

# EXAMPLES / TEST CASES

# [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]] ==> [[1, 8, 3], [1, 5, 9], [6, 1, 7], [1, 6, 9]]
# [[1, 9], [1, 7], [1, 3], [1, 5, 9]]
# [1, 3], [1, 5, 9] [1, 7], [1, 9], 
# [1, 8, 3], [1, 5, 9], [6, 1, 7], [1, 6, 9]

# DATA STRUCTURES

# two-level array
# second level arrays contain three integers

# ALGORITHM
# sort_by 
# select for odd ellements

arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]
arr2 = arr.sort_by do |array|
  array.select do |element|
    element.odd?
  end
end

p arr2 == [[1, 8, 3], [1, 5, 9], [6, 1, 7], [1, 6, 9]]


