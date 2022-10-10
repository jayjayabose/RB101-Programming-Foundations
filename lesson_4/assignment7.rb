#PROBLEM

# select the key-value pairs where the value is 'Fruit'.
# input: hash
# output: hash. new. only KV pairs where value is Fruit
# rules:
#     Explicit requirements
#     - select the key-value pairs where the value is 'Fruit'.
#     - return a new hash

# EXAMPLE / TEST CASES

# select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}

# DATA STRUCURES

# hash

# ALGORITHM

# create output hash
# loop through input has
#   - if value == Fruit, add to outuput hash
# return output hash


# CODE WITH INTENT

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

def select_fruit(input_hash, produce_type)
  output_hash = {}
  keys = input_hash.keys

  while keys.length > 0
    key = keys.pop
    #output_hash[key] = produce_type if input_hash[key] == produce_type
    output_hash[key] = produce_type if input_hash[key] == produce_type
  end
  output_hash
end  

p select_fruit(produce, 'Fruit') # => {"apple"=>"Fruit", "pear"=>"Fruit"}
p select_fruit(produce, 'Vegetable')
p select_fruit(produce, 'Meat')