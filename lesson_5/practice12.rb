# PROBLEM

# Given the following data structure, and without using the Array#to_h method,
# return a hash 
# where the key is the first item in each sub array
# and the value is the second item.

# input: array: two level, second level arrays all contain two elements
# output: hash
# rules
#   Explicit
#   - array[n][0] => key
#   - array[n][1] => value

# EXAMPLES / TEST CASES

# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

# DATA STRUCTURES

# two-level array, second level arrays each contain two elements

# ALGORITHM

# loop through level-1 array [each with object]
# - set new hash
# - set new hash key [0]
# - set new hash value [01]
# - add hash to object

# CODE WITH INTENT

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

result = arr.each_with_object({}) do |element, hash|
  hash[element[0]] = element[1]
end  

p result == {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}