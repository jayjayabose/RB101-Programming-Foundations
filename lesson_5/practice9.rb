# PROBLEM

# Given this data structure, 
# return a new array of the same structure 
# but with the sub arrays being ordered (alphabetically or numerically as appropriate) in descending order.

# DATA STRUCTURE

# two level array
# strings, integers

# ALGORITYM
# loop through outer arra
# - sort inner array. destructive

arr = [ ['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green'] ]

new_arr = arr.map do | element |
  element.sort do |a, b|
    b <=> a
  end
end  

p new_arr