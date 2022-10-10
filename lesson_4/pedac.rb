## GIVEN
# PROBLEM:

# Given a string, write a method change_me which returns the same
# string but with all the words in it that are palindromes uppercased.

# change_me("We will meet at noon") == "We will meet at NOON"
# change_me("No palindromes here") == "No palindromes here"
# change_me("") == ""
# change_me("I LOVE my mom and dad equally") == "I LOVE my MOM and DAD equally"


## PRODUCED BY ME
# input: string
# output: string (not the same object)
# rules:
#       Explicit Requirements
#          - every palindrom in the string converted to upper case
#          - palindroms are case sensitive

#       Implicit Requirements
#          - if input is empty string, return empty string
#          - the returned string should not be the same string object 


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# PROBLEM:

# Given a string, write a method `palindrome_substrings` which returns
# all the substrings from a given string which are palindromes. Consider
# palindrome words case sensitive.

# Test cases:

# palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
# palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
# palindrome_substrings("palindrome") == []
# palindrome_substrings("") == []


#: input: string
#: output: array (of strings)
#: rules
#       Explicit Requirements
#          - palindromes are case senstive
#          - 

#       Implicit Requirements
#          - return an array of strings (palindromes)
#          - do not repeat -- each array element is unique
#          - empty array is returned if input is an empty string


def palindrome_substrings(str)
  result = []
  substrings_arr = substrings(str)
  substrings_arr.each do |substring|
    result << substring if is_palindrome?(substring)
  end
  result
end  
