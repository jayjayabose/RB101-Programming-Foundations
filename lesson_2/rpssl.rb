VALID_CHOICES = ['r', 'p', 'sc', 'sp', 'l']
CHOICES_FULL_WORDS = {
  'r' => 'Rock',
  'p' => 'Paper',
  'sc' => 'Scissors',
  'sp' => 'Spock',
  'l' => 'Lizard'
}

def prompt(msg)
  puts "==> #{msg}"
end

def win?(player1, player2)
  if (player1 == 'r' && (player2 == 'l' || player2 == 'sc')) ||
     (player1 == 'p' && (player2 == 'r' || player2 == 'sp')) ||
     (player1 == 'sc' && (player2 == 'p' || player2 == 'l')) ||
     (player1 == 'l' && (player2 == 'sp' || player2 == 'p')) ||
     (player1 == 'sp' && (player2 == 'sc' || player2 == 'r'))
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

loop do # main loop
  user_score = 0
  computer_score = 0

  while user_score < 3 && computer_score < 3
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

    prompt "You chose: #{CHOICES_FULL_WORDS[choice]}; Computer chose: #{CHOICES_FULL_WORDS[computer_choice]}"

    display_result(choice, computer_choice)
    user_score += 1 if win?(choice, computer_choice)
    computer_score += 1 if win?(computer_choice, choice)

    prompt "*SCORE* user: #{user_score} computer: #{computer_score}"
  end

  prompt 'Want to play again?'
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt 'Thanks you for playing. Good bye!'
