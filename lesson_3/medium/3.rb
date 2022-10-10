def factors(number)
  divisor = number
  factors = []
  #begin
  while divisor > 0
    # break if divisor == 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  # end until divisor == 0
  end
  factors
end

p factors 24
p factors 0