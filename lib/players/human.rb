require_relative '../player.rb'

class Player::Human < Player
  def move(useless_arr=[])
    gets("#{@token}: Enter your move. ")
	end
end