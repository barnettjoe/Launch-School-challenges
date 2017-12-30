class Cipher
  ALPHABET = ("a".."z").to_a
  attr_reader :key
    
  def initialize(str = nil)
    if str
      raise ArgumentError unless str[/\A[a-z]+\z/]
      @key = str
    else
      @key = ""    
      10.times { @key << ALPHABET.sample }
    end
  end
  
  def encode(plaintext, reverse: false)
    dir = reverse ? :- : :+
    plain_indices, shifts = alph_indices(plaintext), alph_indices(key)
    plain_indices.map.with_index do |pos, idx| 
      ALPHABET.rotate(0.send(dir, shifts[idx]))[pos] 
    end.join
  end
  
  def decode(code)
    encode(code, reverse: true)
  end
  
  def alph_indices(str)
    str.chars.map { |letter| ALPHABET.index(letter) }  
  end
end
