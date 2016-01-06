require_relative '../player.rb'

class Player::Human < Player
	def move(board)
    gets("Enter your move: ")
	end
end