require_relative '../player.rb'

class Player::Computer < Player
  def move(board)
    "1"
    #optimal_move(board, 1)
	end

  def optimal_move(board, depth)
    move_predictions=ai_starter(board, depth)
    move_predictions.sort.to_h.keys.last
  end

  def ai_starter(board, depth)
    #
    #  make array of possible_moves
    #  make array of (possible_moves.length) entries of (current board with token in potential move slot) called potential_boards
    #  simulate execution of each possible move of current_player
    #
    #  potential_boards.each do |board|
    #    ai(board, depth)
    #


    def ai(board, depth) #warning: recursion may occur :P
    #  make array of possible moves
    #  simulate execution of each possible move of current_player
    #  set optimality following values for potential cases: ai won(optimality=100%), opponent won(optimality=0%), draw(optimality=25%)
    #  return optimality
    #

    #returns hash of optimality(%) => move_position
  end



end