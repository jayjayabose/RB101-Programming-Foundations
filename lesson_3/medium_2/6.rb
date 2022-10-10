def color_valid(color) 
  color == "blue" || color == "green"    
end

puts color_valid("blue") == true
puts color_valid("green") == true
puts color_valid("red") == false