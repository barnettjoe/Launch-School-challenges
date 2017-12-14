class Diamond
  ALPHABET = ("A".."Z").to_a
  def self.top(idx)
    pad = 2 * idx - 1
    return ["A"] if idx.zero? 
    top(idx - 1) << (ALPHABET[idx] + (" " * pad) + ALPHABET[idx])
  end
  
  def self.make_diamond(letter)
    idx = ALPHABET.index(letter)
    pad = 2 * idx + 1
    a = top(idx).map { |str| str.center(pad) }
    (a + a.reverse[1..-1]).join("\n") + "\n"
  end
end
