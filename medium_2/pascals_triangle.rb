class Triangle
  attr_reader :rows, :n

  def initialize(n)
    @rows = [[1]]
    @n = n
    build
  end

  private

  def next_row
    ([0] + rows.last + [0]).each_cons(2).map { |pair| pair.reduce(:+) }
  end

  def add_row
    rows << next_row
  end

  def build
    (n - 1).times { add_row }
  end
end