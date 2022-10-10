def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  # return false if dot_separated_ip_address.size != 3
  retun false unless dot_separated_ip_address == 3

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end

  true
  # return true
end