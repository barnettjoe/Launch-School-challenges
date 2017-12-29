require 'matrix'

class Triplet
  BARNING_MATRICES = [Matrix[[ 1, -2,  2], [ 2, -1,  2], [ 2, -2,  3]],
                      Matrix[[ 1,  2,  2], [ 2,  1,  2], [ 2,  2,  3]],
                      Matrix[[-1,  2,  2], [-2,  1,  2], [-2,  2,  3]]]
  
  SEED_TRIPLET =      Matrix[[3], [4], [5]]
  
  def initialize(*sides)
    @sides = sides
  end
  
  def self.three_child_triplets(triplet)
    BARNING_MATRICES.map { |m| m * triplet }
  end
  
  def self.where(min_factor: 0, max_factor: nil, sum: nil)
    arr = base_triplets(max_factor)
    arrays = add_non_primitives(arr, max_factor)
      .select { |a| within_limits?(a, min_factor, max_factor) }
      .map { |array| new(*array) }
    if sum 
      arrays = arrays.select { |a| a.sum == sum }
    end
    arrays
  end
  
  def self.base_triplets(max_factor)
    arr = [SEED_TRIPLET]
    batch = arr
    loop do
      batch = new_triplets(batch)
      break if batch.all? { |m| exceeds?(m, max_factor) }
      arr += batch
    end
    arr.map { |m| m.to_a.flatten }
  end
  
  def self.within_limits?(arr, min, max)
    arr.all? { |side| side.between?(min, max) }
  end
  
  def self.exceeds?(m, max)
    m.to_a.flatten.any? { |side| side > max }
  end
  
  def self.new_triplets(arr)
    arr.flat_map { |triplet| three_child_triplets(triplet) }
  end
  
  def self.add_non_primitives(arrays, max)
    arrays.flat_map { |arr| 1.upto(max / arr.max).map { |x| arr.map { |side| side * x } } }
  end
  
  def sum 
    @sides.reduce(:+)
  end
  
  def product
    @sides.reduce(:*)
  end
  
  def pythagorean?
    @sides.max == (@sides.min(2).map(&:abs2).reduce(:+))**0.5
  end
end
  
