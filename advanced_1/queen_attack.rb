class Queens
  attr_reader :white, :black, :white_x, :white_y, :black_x, :black_y

  def initialize(white: [0, 3], black: [7, 3])
    @white_x, @white_y = white
    @black_x, @black_y = black
    raise ArgumentError unless valid_positions?(white, black)
    @white = white
    @black = black
  end
  
  def valid_positions?(white, black)
    valid_coord?(white) && valid_coord?(black) && black != white
  end
  
  def valid_coord?(coord)
    coord.size == 2 &&
    coord.all? { |pos| pos.is_a?(Integer) && pos.between?(0, 7) }
  end
  
  def to_s
    board = [] 
    8.times { board << ["_"] * 8 }
    board[white_x][white_y] = "W"
    board[black_x][black_y] = "B"
    board.map { |row| row.join(" ") }.join("\n")   
  end
  
  def attack?
    (white_x - white_y).abs == (black_x - black_y).abs   ||    # diagonal attack
    white_x == black_x                                   ||    # same row
    white_y == black_y                                         # same column             
  end
end
