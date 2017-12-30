class Robot
  CARDINALS =  [:north, :east, :south, :west]
  attr_accessor :bearing, :coordinates
  
  def orient(dir)
    raise ArgumentError unless CARDINALS.include? dir
    @bearing = dir
  end
  
  def at(*coords)
    self.coordinates = coords 
  end
  
  def advance
    case bearing
    when :north then self.coordinates[1] += 1
    when :east  then self.coordinates[0] += 1
    when :south then self.coordinates[1] -= 1
    when :west  then self.coordinates[0] -= 1
    end
  end
  
  def turn_left
    3.times { turn_right }
  end
  
  def turn_right
    new_bearing = CARDINALS.rotate[CARDINALS.index(bearing)]
    orient(new_bearing)
  end
end

class Simulator
  def instructions(str)
    str.chars.map do |letter|
      case letter
      when "L" then :turn_left
      when "R" then :turn_right
      when "A" then :advance
      else raise ArgumentError 
      end
    end
  end

  def place(robot, x: 0, y: 0, direction: :north)
    robot.at(x, y)
    robot.orient(direction)
  end
  
  def evaluate(robot, str)
    instructions(str).each do |action|
      robot.send(action)
    end
  end
end
