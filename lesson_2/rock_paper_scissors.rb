VALID_CHOICES = ['rock', 'paper', 'scissors']
def prompt(msg)
  puts "==> #{msg}"
end

def win?(player1, player2)
  if (player1 == 'rock' && player2 == 'scissors') ||
     (player1 == 'paper' && player2 == 'rock') ||
     (player1 == 'scissors' && player2 == 'paper')
    true
  end
end

def display_result(player, computer)
  if win?(player, computer)
    prompt 'Yon win!'
  elsif win?(computer, player)
    prompt 'Computer wins!'
  else
    prompt 'Tie!'
  end
end

loop do
  choice = ''
  loop do
    prompt "Choose one: #{VALID_CHOICES.join(', ')}"
    choice = gets.chomp
    if VALID_CHOICES.include? choice
      break
    else
      prompt 'that was not a valid choice'
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt "You chose: #{choice}; Computer chose: #{computer_choice}"

  display_result(choice, computer_choice)

  prompt 'Want to play again? '
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt 'Thanks you for playing. Good bye!'
