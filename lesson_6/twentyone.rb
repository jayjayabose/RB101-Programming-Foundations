# TODO
# x show one dealer card
# x cmopute winner
# x handle aces - implement handleAceValues!
# x fix winner bugs
# x check logic vs refeerence implementation
# x improve UX

require 'pry'

POINTS_TARGET = 21
DEALER_MIN_POINTS = 17

SEPARATOR = "* * * * * * *"
def prompt(msg)
  puts "==> #{msg}"
end

def print_separator
  puts SEPARATOR
  puts ''
end

def create_deck
  # let's not bother with suit
  new_deck = []
  ranks = ('2'..'10').to_a + %w(J Q K A)
  values = (2..10).to_a + [10, 10, 10, 11]

  4.times do
    ranks.each_with_index do |rank, index|
      new_deck.push({ rank: rank, value: values[index] })
    end
  end
  new_deck.shuffle
end

def deal_in!(player_dealer, deck)
  2.times { deal_one_card!(player_dealer, deck) }
end

def deal_one_card!(player_dealer, deck)
  player_dealer[:hand] << deck.pop
  hand_over_target = hand_value(player_dealer) > POINTS_TARGET
  hand_has_aces = hand_cards(player_dealer).include?('A')

  reduce_aces! player_dealer if hand_over_target && hand_has_aces
end

def hand_value(player_dealer)
  player_dealer[:hand].map { |hash| hash[:value] }.sum
end

def reduce_aces!(player_dealer)
  hand = player_dealer[:hand]
  high_aces_arr = hand.select { |card| card[:rank] == 'A' && card[:value] == 11 }
  if high_aces_arr.size > 0
    ace_card = high_aces_arr.pop
    ace_card[:value] = 1
  end
=begin
found an edge case: I think i could fix via recurssion

  Player has: 21
  Player is holding: 10, A
  Would you like to hit or stay?
  * * * * * * *

  ==> Type 'h' to 'hit or 's' to 'stay'
  h
  Player hits
  * * * * * * *

  Player has: 22
  Player is holding: 10, A, A
  Bad News, Player is busted
=end
end

def hand_cards(player_dealer)
  player_dealer[:hand].map { |card| card[:rank] }
end

def busted?(player_dealer)
  hand_value(player_dealer) > POINTS_TARGET
end

def print_hand_details(player_dealer)
  name = player_dealer[:name]
  points = hand_value(player_dealer)
  cards = hand_cards(player_dealer).join(', ')
  puts "#{name} has: #{points}, holding: #{cards}"
end

def print_game_end(plr, dlr)
  game_outcome = return_game_outcome(plr, dlr)
  game_status = if game_outcome[0] == 'push'
                  'The game is a push'
                else
                  "#{game_outcome[1]} is the winner!"
                end

  puts game_status
  print_hand_details plr
  print_hand_details dlr
end

def return_game_outcome(plr, dlr)
  either_busted = (busted? plr) || (busted? dlr)
  both_busted = (busted? plr) && (busted? dlr)
  plr_score = hand_value plr
  dlr_score = hand_value dlr

  # Outcome is push if both both bust or score is tied
  if both_busted || (plr_score == dlr_score)
    ['push', nil]
  # If either is busted, other is the winner
  elsif either_busted
    (busted? dlr) ? ['win', 'Player'] : ['win', 'Dealer']
  # Higher score is winner
  else
    plr_score > dlr_score == true ? ['win', 'Player'] : ['win', 'Dealer']
  end
end

# game loop
loop do
  # initialize game
  deck = create_deck
  player = { hand: [], name: 'Player' }
  dealer = { hand: [], name: 'Dealer' }
  deal_in!(player, deck)
  deal_in!(dealer, deck)
  dealer[:show_card] = dealer[:hand].sample

  # game beginning messages
  puts SEPARATOR
  puts "WELCOME TO TWENTY ONE"
  print_separator
  puts 'Cards have been dealt'
  puts "Dealer is showing: #{dealer[:show_card][:rank]}"
  puts "You play first"
  print_separator

  # player turn loop
  loop do
    print_hand_details(player)
    if busted?(player)
      puts "Bad News, Player is busted"
      print_separator
      break
    else
      # input loop: hit or stay
      hit_or_stay = ''
      loop do
        puts "Would you like to hit or stay?"
        print_separator
        prompt("Type 'h' to 'hit or 's' to 'stay'")
        hit_or_stay = gets.chomp.downcase
        if hit_or_stay == 'h' || hit_or_stay == 's'
          break
        end
        puts "'#{hit_or_stay}' is not a valid choice"
      end

      if hit_or_stay == 'h'
        puts "Player hits"
        print_separator
        deal_one_card!(player, deck)
      elsif hit_or_stay == 's'
        puts "Player stays"
        print_separator
        break
      end
    end
  end

  puts "Dealer plays next"
  print_separator

  # dealer turn loop
  loop do
    # puts "Dealer plays"
    print_hand_details(dealer)
    if busted?(dealer)
      puts "Good news for you, Dealer is busted"
      print_separator
      break
    elsif hand_value(dealer) < DEALER_MIN_POINTS
      puts "Dealer hits"
      print_separator
      deal_one_card!(dealer, deck)
    else
      puts "Dealer stays"
      print_separator
      break
    end
  end

  print_separator
  puts "Game over."
  print_game_end(player, dealer)

  # input loop: play again or quit?
  play_again = ''
  loop do
    print_separator
    puts 'Would you like to play again, or quit?'
    prompt "type 'p' to play again, or type 'q' to quit"
    play_again = gets.chomp.downcase
    break if play_again == 'p' || play_again == 'q'
    puts "'#{play_again}' is not a valid choice"
  end

  break if play_again == 'q'
end

puts "Thanks for playing!"
