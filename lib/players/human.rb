require_relative '../player.rb'

class Player::Human < Player
	def move
    gets("#{@token}: Enter your move. ")
	end
end