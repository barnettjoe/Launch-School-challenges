class Matrix
  attr_reader :rows
  
  def initialize(str)
    @rows = str.split("\n").map { |row| row.split.map(&:to_i) }  
  end
  
  def columns
    rows.transpose
  end
  
  def saddle_points
    find_min_max_coords
    @x_y_coords_of_column_minima & @x_y_coords_of_row_maxima
  end
  
  private
  
  def find_min_max_coords
    @x_y_coords_of_column_minima = extreme_indices(columns, :min)
    @x_y_coords_of_row_maxima    = extreme_indices(rows, :max).map(&:reverse)
  end
  
  def extreme_indices(arr, ext)
    first_coords = arr.map do |sub_arr|
      (0...sub_arr.size).select { |idx| sub_arr[idx] == sub_arr.send(ext) } 
    end
    full_coords(first_coords)
  end
  
  def full_coords(first_coords)
    first_coords.flat_map.with_index { |x, i| x.product [i] }
  end      
end
