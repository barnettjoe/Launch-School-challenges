class Board
  def self.transform(inp)
    check_board_valid(inp)
    inp.map.with_index do |row, y|
      row_with_nums(inp, row, y)
    end
  end
  
  def self.row_with_nums(inp, row, y)
    row.chars.map.with_index do |el, x|
      el == " " ? number_of_mines(inp, y, x) : el
    end.join
  end
  
  def self.number_of_mines(inp, y, x)
    n = vicinity(inp, y, x).count("*")  
    n.zero? ? " ": n.to_s
  end
  
  def self.vicinity(inp, y, x)
    slice(inp, y).map { |row| slice(row, x) }.join
  end
  
  def self.slice(arr, idx)
    arr[idx - 1, 3]
  end
  
  def self.check_board_valid(inp)
    all_rows_same_size = inp.map(&:size).uniq.size == 1
    raise ValueError unless all_rows_same_size                 &&
                            valid_horizontal_border(inp.first) && 
                            valid_horizontal_border(inp.last)  &&
                            inp[1...-1].all? { |row| valid_row(row) }
  end
  
  def self.valid_horizontal_border(str)
    !!str[/\A\+-+\+\z/]
  end
  
  def self.valid_row(str)
    !!str[/\A\|[\s*]+\|\z/]      
  end
end

class ValueError < ArgumentError 
end
