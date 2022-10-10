str = "The Flintstones Rock!"
10.times do
  puts str
  str.prepend(' ')  
end  

# 10.times { |number| puts (" " * number) + "The Flintstones Rock!" }