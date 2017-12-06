class WordProblem
  REPLACEMENTS = { "plus"          => "+",
                   "minus"         => "-",
                   "divided by"    => "/",
                   "multiplied by" => "*"  }

  CHUNK = /-?\d+\s(#{REPLACEMENTS.keys.join("|")})\s-?\d+/

  def initialize(str)
    @str = str[8...-1] # strip "What is " and "?"
  end

  def answer
    interpret!
    raise ArgumentError unless @str.to_i.to_s == @str
    @str.to_i
  end

  def interpret!
    @str.sub!(@str[CHUNK], interpret_chunk(@str[CHUNK])) while @str[CHUNK]
  end

  def interpret_chunk(chk)
    eval(chk.sub(Regexp.new(REPLACEMENTS.keys.join("|")), REPLACEMENTS)).to_s
  end
end