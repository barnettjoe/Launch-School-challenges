class Luhn
  def initialize(n)
    @num_arr = n.to_s.chars.map(&:to_i)
  end

  def addends(arr = @num_arr)
    arr.reverse.map.with_index do |x, i|
      if i.even?
        x
      else
        x * 2 - (x > 4 ? 9 : 0)
      end
    end.reverse
  end

  def checksum
    addends.reduce(:+)
  end

  def valid?
    checksum % 10 == 0
  end

  def self.create(n)
    remainder = Luhn.new(n * 10).checksum % 10
    new_dig = remainder == 0 ? 0 : 10 - remainder
    (n * 10) + new_dig
  end
end