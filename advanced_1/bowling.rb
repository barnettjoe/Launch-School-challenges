class Game
  attr_reader :frames

  def initialize
    @frames = [Frame.new]
  end

  def roll(score)
    raise RuntimeError, 'Pins must have a value from 0 to 10' unless score.between?(0, 10)
    raise RuntimeError, 'Should not be able to roll after game is over' if game_over?
    record score
  end

  def roll_n_times(n, *scores)
    n.times { scores.each { |score| roll(score) } }
  end

  def record(score)
    @frames << Frame.new if @frames.last.finished?
    raise RuntimeError, 'Pin count exceeds pins on the lane' unless score.between?(0, @frames.last.remaining_pins)
    @frames.last.add(score)
  end

  def score
    raise RuntimeError, 'Score cannot be taken until the end of the game' unless game_over?
    frames[0, 10].map.with_index do |frame, idx|
      following_scores = frames.map(&:scores)[idx + 1..-1].flatten
      case frame.type
      when :open   then frame.scores.reduce(:+)
      when :spare  then 10 + following_scores[0]
      when :strike then 10 + following_scores[0, 2].reduce(:+)
      end
    end.reduce(:+)
  end

  def game_over?
    case frames.size
    when (0..9) then return false
    when 10
      return false if (!frames.last.finished? || !(frames.last.type == :open))
    when 11
      return false if more_fill_balls_required?
    end
    true
  end

  def more_fill_balls_required?
    return false if frames[9].type == :spare
    return false if frames[9].type == :strike && frames[10].scores.size == 2 && frames[10].type == :open
    true
  end
end

class Frame
  attr_accessor :scores, :remaining_pins

  def initialize
    @scores = []
    @remaining_pins = 10
  end

  def add(score)
    scores << score
    @remaining_pins -= score
  end

  def finished?
    scores == [10] || scores.size == 2
  end

  def type
    if scores == [10]
      :strike
    elsif scores.reduce(:+) == 10
      :spare
    else
      :open
    end
  end
end
