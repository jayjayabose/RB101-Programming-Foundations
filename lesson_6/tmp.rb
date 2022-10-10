require 'pry'

def double_num(num)
  num * 2
  binding.pry
end

arr = [1, 2, 3].map do |num|
  double_num(num)
  
end

p arr