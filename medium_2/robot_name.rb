class Robot
  @@used_names = []

  attr_accessor :name

  def initialize
    reset
  end

  def reset
    self.name = random(2, "A".."Z") + random(3, "0".."9")
    reset if @@used_names.include?(name)
    @@used_names << name
  end

  private

  def random(n, range)
    str = ""
    n.times { str << range.to_a.sample }
    str
  end
end