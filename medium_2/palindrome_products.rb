class Palindromes
  def initialize(max_factor: nil, min_factor: 1)
    @max_factor = max_factor
    @min_factor = min_factor
  end

  def generate
    @palin_pairs =
      @min_factor.upto(@max_factor).to_a.repeated_combination(2).select do |a, b|
        str = (a * b).to_s
        str == str.reverse
      end
  end

  def min_or_max(sym_op)
    @palin_pairs.map { |a, b| (a * b) }.send(sym_op)
  end

  def largest
    largest_or_smallest(:max)
  end

  def smallest
    largest_or_smallest(:min)
  end

  def largest_or_smallest(sym_op)
    @pairs = PairsList.new
    @palin_pairs.select { |a, b| (a * b) == min_or_max(sym_op) }.each { |pair| @pairs << pair }
    @pairs
  end
end

class PairsList < Array
  def value
    first.reduce(:*)
  end

  def factors
    self
  end
end