# PROBLEM
# Using the each method, write some code to output all of the vowels from the strings.

# input: hash
# output: all vowels from all strings

# DATA STRUCTURE

# hash: keys are symbols, values are arrays with strings elements

# ALGORITHM

# loop through values in hash (araays)
# - loop through each arra

# method: output vowels
# parameber: string
# return: nill
# output; print volwes

# ALGORITHM

# set vowels array
# loop through chars
#  - if char is in vowes array, puts char

def print_vowels(string)
  vowels = %w[a e i o u]
  string.chars.each do |letter|
    puts letter if vowels.include? letter
  end    
end

hsh = { first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog'] }

hsh.each_value do |value|
  value.each { |word| print_vowels(word) }
end  

