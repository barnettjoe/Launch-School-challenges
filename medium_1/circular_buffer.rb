require 'pry'

class CircularBuffer

  class BufferEmptyException < StandardError
  end

  class BufferFullException < StandardError
  end

  attr_reader :size
  attr_accessor :arr

  def initialize(size)
    @size = size
    @arr = Array.new(size)
  end

  def read
    raise BufferEmptyException if arr.all?(&:nil?)
    (1..size).each do |pos|
      el = arr[-pos]
      if el
        arr[-pos] = nil
        return el
      end
    end
  end

  def write(el)
    raise BufferFullException unless arr[-1] == nil
    write!(el)
  end

  def write!(el)
    return if el.nil?
    @arr.rotate!(-1)
    arr[0] = el
  end

  def clear
    arr.map!{}
  end
end

# binding.pry