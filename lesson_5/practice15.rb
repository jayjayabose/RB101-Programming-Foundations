# PROBLEM

# Given this data structure write some code to 
# return an array 
# which contains only the hashes where all the integers are even.

# input: hash
# output: array
# rules
#   Explicit
#   - only output hashes where all integers are even

# EXAMPLE / TEST CASES

# [{e: [8], f: [6, 10]}]

# DATA STRUCTURE

# array containing three hashes
# hashes: keys are symbols, values are arrays of integefers

# ALGORITHM

# loop through array [select / reject]
# - loop through values (arrays)
#   - loop through array
#     - if value is odd return false
# - return true

# CODE WITH INTENT

require 'pry'

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

arr_2 = arr.select do |hash|
# binding.pry
  include_hash = true

  hash.values.each do |array|
    # binding.pry    
    array.each do |num|
      include_hash = false if num.odd?
      #return false if odd is found
    end
  end  
  include_hash
end  

p arr_2 == [{e: [8], f: [6, 10]}]