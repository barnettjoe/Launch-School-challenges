class OCR
  hsh = {"     |  |"=>"1",
         " _  _||_ "=>"2",
         " _  _| _|"=>"3",
         "   |_|  |"=>"4",
         " _ |_  _|"=>"5",
         " _ |_ |_|"=>"6",
         " _   |  |"=>"7",
         " _ |_||_|"=>"8",
         " _ |_| _|"=>"9",
         " _ | ||_|"=>"0" }
         
  NUMS = Hash.new("?").merge(hsh)
   
  def initialize(text)
    @text = text
  end

  def interpret(str)
    length = str.split("\n").map(&:size).max
   
    numbers = str.split("\n").map do |str|
      str.ljust(length).chars.each_slice(3).to_a 
    end.transpose.map(&:join)
    
    numbers.map { |x| NUMS[x] }.join
  end
  
  def convert
    @text.split("\n\n").map { |chunk| interpret(chunk)  }.join(",")
  end
end
