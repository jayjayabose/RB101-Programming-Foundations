a = "forty two"
b = "forty two"
c = a

puts a.object_id # ==> 
puts b.object_id # ==> 
puts c.object_id # ==> 

puts a.object_id == b.object_id # ==> false
puts a.object_id == c.object_id # ==> true
puts b.object_id == c.object_id # ==> false

p a.inspect