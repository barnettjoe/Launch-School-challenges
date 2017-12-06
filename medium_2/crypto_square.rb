class Crypto
  def initialize(str)
    @str = str
  end

  def normalize_plaintext
    @str.scan(/\w/).join.downcase
  end

  def plaintext_segments
    chunk(normalize_plaintext)
  end

  def size
    (normalize_plaintext.size**0.5).ceil
  end

  def ciphertext
    cipher_array.join
  end

  def normalize_ciphertext
    cipher_array.join(" ")
  end

  private

  def cipher_array
    arr = plaintext_segments.map(&:chars)
    arr.last << nil until arr.last.size == arr.first.size
    arr.transpose.map(&:join)
  end

  def chunk(str)
    str.chars.each_slice(size).map(&:join)
  end
end