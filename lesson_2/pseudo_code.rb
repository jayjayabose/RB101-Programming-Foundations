=begin
1. a method that returns the sum of two integers
# informal 
return the sum of argument 1 and argument 2

#formal
Start

End

2. a method that takes an array of strings, and returns a string that is all those strings concatenated together
##informal
loop through array
concatenate current element to output
return output

##formal
concatenate(array)
START
SET output = nil
array.each
  SET output += current element

PRINT output

3. a method that takes an array of integers, and returns a new array 
with every other element from the original array, starting with the first element. 
For instance: everyOther([1,4,7,2,5]) # => [1,7,5]

##informal
#loop through array
#save every other to new array
#print new array

##formal
everyOther(array)
START
SET output = []
array.each
  output << element if i.odd

RETURN output
END

=end

def everyOther(array)
  output = []
  array.each_index do |x| 
    output << array[x] if x.even?
  end
  output
end  

p everyOther([1,4,7,2,5]) # => [1,7,5]

def sum(first, second)
  first + second
end 

puts sum(2,3) == 5

def concatenate(array)
  output = ''
  array.each do |element|
    output += element
  end
  output
end

puts concatenate(['this', ' ', 'did', ' ', 'work!'])


