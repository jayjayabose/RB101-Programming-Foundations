number_of_pets = {
  'dogs' => 2,
  'cats' => 4,
  'fish' => 1
}
pets = number_of_pets.keys
counter = 0

loop do
  break if counter >= pets.size
  pet_type = pets[counter]
  number =  number_of_pets[pet_type]
  puts "I have #{number} #{pet_type}"
  counter += 1
end  