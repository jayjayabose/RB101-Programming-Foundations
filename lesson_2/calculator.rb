require "pry"

def prompt(msg)
  puts '==> ' + msg
end

def valid?(num)
  num.to_i != 0
end

def operation_to_msg(operator)
  case (operator)
  when '+' then "Adding"
  when '-' then "Subtracting"
  when '*' then 'Multiplying'
  when '/' then 'Dividing'
  end
end
prompt 'welcome to calculator!'

name = ''
loop do
  prompt 'enter your name'
  name = gets.chomp
  if name.empty?
    prompt 'be sure to enter a valid name'
  else
    break
  end
end
binding.pry
prompt "Hi, #{name}! Here we go..."

loop do # main loop
  first_number = ''
  loop do
    prompt 'enter first numnber'
    first_number = gets.chomp.to_i
    if valid? first_number
      break
    else
      prompt 'invalid number'
    end
  end

  second_number = ''
  loop do
    prompt 'enter second numnber'
    second_number = gets.chomp.to_i
    if valid? second_number
      break
    else
      prompt 'invalid number'
    end
  end

  operation = ''
  oeprator_prompt = <<-MSG
    What operation would you like to perform?
    +) add
    -) subtract
    *) multiply
    /) devide 
  MSG
  loop do
    prompt oeprator_prompt
    operation = gets.chomp
    if %w(+ - * /).include? operation
      break
    else
      prompt 'enter a valid operation'
    end
  end

  prompt "#{operation_to_msg(operation)} the two numbers ..."
  result = case operation
           when '+' then first_number + second_number
           when '-' then first_number - second_number
           when '*' then first_number * second_number
           when '/' then first_number / second_number.to_f
           end

  puts "The result is #{result}"

  prompt 'perform another calcuation?'
  repeat = gets.chomp
  break unless repeat.downcase.start_with? 'y'
end
prompt 'we\'re done, then. thanks'
