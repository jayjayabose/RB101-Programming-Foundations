INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
                 [1, 4, 7], [2, 5, 8], [3, 6, 9],
                 [7, 5, 3], [1, 5, 9]]
WINS_TO_END_SERIES = 3

require 'pry'

def prompt(msg)
  puts "=> #{msg}"
end

def joinor(arr, delimeter=', ', logical_operator='or')
  return arr[0].to_s if arr.length == 1
  return arr[0].to_s + " #{logical_operator} " + arr[1].to_s if arr.length == 2

  arr[arr.size - 1] = "#{logical_operator} " + arr[arr.size - 1].to_s
  arr.join(delimeter.to_s)
end

# rubocop: disable Metrics/AbcSize:
def display_board(brd, score)
  system 'clear'
  puts "Player is X. Computer is 0."
  puts "First to #{WINS_TO_END_SERIES} wins the series."
  puts series_score_msg(score)
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop: enable Metrics/AbcSize:

# board methods
def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |key| brd[key] == INITIAL_MARKER }
end

# move methods
def current_player_places_piece!(brd, cur_plr)
  cur_plr == 'player' ? player_places_piece!(brd) : computer_places_piece!(brd)
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt("Choose an open square: #{joinor(empty_squares(brd))}")
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt('Sorry, that\'s not a valid choice')
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = if detect_last_square_in_winning_line(brd, COMPUTER_MARKER)
             detect_last_square_in_winning_line(brd, COMPUTER_MARKER)
           elsif detect_last_square_in_winning_line(brd, PLAYER_MARKER)
             detect_last_square_in_winning_line(brd, PLAYER_MARKER)
           elsif brd[5] == INITIAL_MARKER
             5
           else
             empty_squares(brd).sample
           end
  brd[square] = COMPUTER_MARKER
end

def detect_last_square_in_winning_line(brd, marker)
  WINNING_LINES.each do |line|
    line_values = brd.values_at(*line)
    if line_values.count(marker) == 2 && line_values.count(INITIAL_MARKER) == 1
      line_index = brd.values_at(*line).index(INITIAL_MARKER)
      square = line[line_index]
      return square
    end
  end
  nil
end

def alternate_player(cur_plr)
  cur_plr == 'player' ? 'computer' : 'player'
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    return 'Player' if brd.values_at(*line).all?(PLAYER_MARKER)
    return 'Computer' if brd.values_at(*line).all?(COMPUTER_MARKER)
  end
  nil
end

# series_score methods
def initialize_series_score
  { player: 0, computer: 0, player_moves_first: true }
end

def update_series_score(brd, score)
  case detect_winner(brd)
  when 'Player' then score[:player] += 1
  when 'Computer' then score[:computer] += 1
  end
end

def detect_series_winner(score)
  return 'Player' if score[:player] >= WINS_TO_END_SERIES
  return 'Computer' if score[:computer] >= WINS_TO_END_SERIES
  nil
end

def someone_won_series?(score)
  !!detect_series_winner(score)
end

def series_score_msg(score)
  "The series score is: Player: #{score[:player]} Computer: #{score[:computer]}"
end

# series loop
loop do
  series_score = initialize_series_score
  puts "Let's begin a new series! First to win #{WINS_TO_END_SERIES} games is the winner."
  prompt "Would you like to move first? (y or n)?"
  prompt "Type 'y' to play first; Type 'n' to let computer play first; Type'?' to let computer decide"
  first_answer = gets.chomp.downcase[0]
  # series_score[:player_moves_first] = false if first_answer == 'n'

  if first_answer == 'n'
    series_score[:player_moves_first] = false
  elsif first_answer == '?'
    series_score[:player_moves_first] = [true, false].sample
  end

  # game loop
  loop do
    board = initialize_board

    # set first player
    current_player = series_score[:player_moves_first] == true ? 'player' : 'computer'
    # player and computer moves loop (until game is won or booard is full)
    loop do
      display_board(board, series_score)
      current_player_places_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    # end of game
    display_board(board, series_score)
    if someone_won?(board)
      prompt "#{detect_winner(board)} is the winner"
      update_series_score(board, series_score)

      if someone_won_series?(series_score)
        prompt "#{detect_series_winner(series_score)} wins the series!"
        prompt series_score_msg(series_score).to_s
        break
      end
    else
      prompt "Tie game!"
    end

    # continue series?
    prompt('Would you like to continue this series? (y or n)')
    play_again = gets.chomp.downcase
    break if play_again[0] == 'n'
  end

  prompt('Would you like to begin a new series? (y or n)')
  another_series = gets.chomp.downcase
  break if another_series[0] == 'n'
end
prompt 'Alrighty then. Thanks for playing Tic Tac Toe!'
