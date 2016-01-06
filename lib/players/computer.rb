require_relative '../player.rb'

class Player::Computer < Player
  def move(board)
    optimal_move(board)
	end

  def optimal_move(board)
    "1"
  end
end