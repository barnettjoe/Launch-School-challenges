class PhoneNumber
  def initialize(str)
    @str = str
  end

  def number
    if  @str[/\A\W*1?\W*(\d\W*){10}\z/]
      return @str.scan(/\d/).join[-10..-1]
    else
      return "0000000000"
    end
  end

  def to_s
    no_punc = number
    "(#{no_punc[0, 3]}) #{no_punc[3, 3]}-#{no_punc[6, 4]}"
  end

  def area_code
    number[0, 3]
  end
end