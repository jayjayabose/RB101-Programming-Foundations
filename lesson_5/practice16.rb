# PROBLEM

# Write a method that returns one UUID when called with no parameters.

# input: none
# output: string
# rules:
#   Explicit
#   - length = 36 // 8-4-4-4-12 
#   - each position containes a hexadecimal character

# EXAMPLES / TEST CASES

# "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

# DATA STRUCTURES

# ALGORITHM

# SET output string
# 32.times generate randoom+ append to string
# positions = [8, 13, 18, 22]
# loop over postions and insert '-'

characters = [] 
(0..9).each {|digit| characters << digit.to_s}
('a'..'f').each {|letter| characters << letter}

output = ''
sections = [8,4,4,4,12]

sections.each_with_index do |section, index|
  section.times { output += characters.sample }
  output += '-' unless index >= sections.size - 1
end

p output

