WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

board = [" "," "," "," "," "," "," "," "," "]
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  input .to_i - 1
end

def move(board, index, character)

  board[index] = character
end

def position_taken?(board, index)
(board[index] ==  " " || board[index] == "" || board[index] == nil) ?
false : true
end

def valid_move?(board, index)
 !position_taken?(board, index) && index.between?(0, 8) ?
true : false
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  character = current_player(board)
  if valid_move?(board, index)
    move(board, index, character)
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
    counter = 0
board.each do | turn |
if turn == "X" || turn == "O"
  counter +=1
end
end
counter
end

def current_player(board)
  turn_count(board).even? ?
"X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.detect do | win_combo |
    board[win_combo[0]] == board[win_combo[1]] && board[win_combo[1]] == board[win_combo[2]] &&
    position_taken?(board, win_combo[0])
end
end

def full?(board)
  board.all?{|token| token == "X" || token == "O"}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  if winning_combo = won?(board)
    board[winning_combo[0]]
  end
end

def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    winning_combo = won?(board)
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cat's Game!"
end
end
