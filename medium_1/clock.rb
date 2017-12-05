class Clock
  attr_accessor :time
  def initialize(hours, mins)
    @time = Time.new(2017, 12, 1, hours, mins)
  end

  def self.at(hours, mins = 0)
    new(hours, mins)
  end

  def +(mins)
    @time += 60 * mins
    self
  end

  def -(mins)
    @time -= 60 * mins
    self
  end

  def ==(other_clock)
    @time == other_clock.time
  end

  def to_s
    "#{"%02d" % @time.hour}:#{"%02d" % @time.min}"
  end
end