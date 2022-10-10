# PROBLEM
# figure out the total age of just the male members of the family.

# input: hash
# output: integer

#ALGORITHM

# loop family members in hash
# total = 0
# - total += if ['gender'] == 'mail'

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

total = 0
munsters.each do |_, info| 
  total += info['age'] if info['gender'] == 'male'
end
puts total