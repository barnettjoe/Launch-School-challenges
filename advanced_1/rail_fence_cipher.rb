class RailFenceCipher
  def self.encode(str, n)
    return str if n == 1
    gap = 2 * n - 2
    (0...n).map do |r|
      down, up = [r, (gap - r)].map { |x| x.step(str.size - 1, gap).to_a }
      (down. zip(up)).flatten.uniq
    end.flatten.compact.map { |idx| str[idx] }.join
  end

  def self.decode(str, n)
    return str if n == 1
    (str.chars.zip encode((0...str.size).map(&:chr), n).chars.map(&:ord))
    .sort_by(&:last)
    .map(&:first)
    .join
  end
end