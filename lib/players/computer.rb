require_relative '../player.rb'

class Player::Computer < Player
  def initialize(token)
		@token = token
    @type = :cpu
	end

  def move(board)
    move = optimal_move(board, 1)
    puts "CPU selected position #{move}"
    move
	end

  def opponent_token
    @token=="X" ? "O" : "X"
  end

  def optimal_move(game_board, depth)
    cpu_board=CPU_Board.new(game_board.cells)
    results = ai_starter(cpu_board, depth)
    puts results.to_s
  end

  def ai_starter(cpu_board, depth)
    #  make array of (possible_moves.length) entries of (current board with token in potential move slot) called possible_moves_boards
    possible_moves=cpu_board.possible_moves
    possible_moves_boards = possible_moves.collect do |move_position|
      new_cpu_board = cpu_board.clone
      new_cpu_board.update(move_position, self)
      new_cpu_board
    end
    #  simulate execution of each possible move of current_player
    return_value=[]
    possible_moves_boards.each_with_index{|board, index| return_value << {ai(board, depth, false) => index}}
    return_value
  end


  def ai(cpu_board, depth, cpus_turn=true) #warning: recursion may occur :P -  https://youtu.be/Mv9NEXX1VHc
    optimality=50
    token=""
    cpus_turn ? token=@token : token=opponent_token
    #  return optimality for following values for potential cases:
    return 100 if cpu_board.winner==@token
    return 25 if cpu_board.draw?
    #return default value if a draw
    return optimality if depth<=0
    #  make array of possible moves
    possible_moves=cpu_board.possible_moves
    #  make array of (possible_moves.length) entries of (current board with token in potential move slot) called possible_moves_boards
    possible_moves_boards = possible_moves.collect do |move_position|
      new_cpu_board = cpu_board.clone
      new_cpu_board.update_by_token(move_position, token)
      new_cpu_board
    end
    puts "got here"
    puts "#{possible_moves.to_s} - possible_moves"
    #  simulate execution of each possible move of current_player
    sub_moves = possible_moves_boards.map{|board| ai(board, depth-1, !cpus_turn)}
    sub_moves_sum = sub_moves.reduce :+
    return (optimality+sub_moves_sum)/2

  end



end