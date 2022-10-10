# PROBLEM

# without modifying the original array, 
# use the map method to return a new array identical in structure to the original 
# but where the value of each integer is incremented by 1.

#DATAT STRUCGTURE

# array containing hashes

#ALGORITHM

# loop through array via map -- returns new array
# - duplicate element (hash)
#   - loop through hash values
#   - increment hash values
#   - return hash to map


arr_1 = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

arr_2 = arr_1.map do |hash| 
  hash_dup = hash.dup
  hash_dup.each do |key, value|
    hash_dup[key] = value + 1
  end
  hash_dup
end  

p arr_1
p arr_2