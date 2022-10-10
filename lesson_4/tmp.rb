# PROBLEM

# Modify the hash
# each member will have an additional "age_group" key
# value will be one of(kid, adult, or senior). 

# input: hash
# output: hash
# rules:
#   Explicit
#   - kid: 0 - 17; adult: 18 - 64; senior: 65+.

# EXAMPLES / TEST CASES

# { "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
#   "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
#   "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
#   "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
#   "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }

# DATA STRUCTURES

# hash (of hashes)
# key = string representing name
# value = hash of demographic key / values

# ALGORITHM

# loop through family members (keys)
# - if age >= 65: value = senior
# - else if >= 18: value = adult
# - else: value = kid 
# - add key value to hash

#print hash

#CODE WITH INTENT

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# munsters.keys.each do | family_member | 
#   age_group = if munsters[family_member]['age'] >= 65
#             'senior'
#           elsif munsters[family_member]['age'] >= 18
#             'adult'
#           else
#             'kid'
#           end
#   munsters[family_member]['age_group'] = age_group
# end  

munsters.each do |name, info| 
  case info['age']
  when (0..18)
    info['age_group'] = 'kid'
  when (19..64)
    info['age_group'] = 'adult'
  else
    info['age_group'] = 'senior'
  end
end  

puts munsters
