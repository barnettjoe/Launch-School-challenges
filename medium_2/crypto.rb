class Crypto
  def intialize(str)
    @str = str
  end

  def normalize_plaintext
    @str.scan(/\w/).join.downcase
  end
end