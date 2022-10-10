str = 'To be or not to be'

def string_lengths(sentence)
  strings = sentence.split
  lengths = []
  counter = 1

  until counter == strings.size do
    word_length = strings[counter - 1].length
    lengths.push(word_length)
    counter += 1
  end

  lengths
end


p string_lengths(str)


#1: check
#2: uncheck: expect it will return strings
#3: check
#4: uncheck. loop exits before last elemebnt is processed