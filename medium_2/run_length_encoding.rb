class RunLengthEncoding
  def self.encode(input)
    input.chars.chunk { |x| x }.map do |id, els|
      [els.size == 1 ? nil : els.size, id]
    end.join
  end

  def self.decode(input)
    lets = input.scan(/\D/)
    input.scan(/\d*\D/).map.with_index do |n, i|
      n.to_i == 0 ? lets[i] : lets[i] * n.to_i
    end.join
  end
end