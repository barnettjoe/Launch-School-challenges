class Element
  attr_accessor :datum, :next    
  def initialize(value, follower = nil)
    @datum = value
    @next  = follower
  end
  
  def tail?
    @next.nil?
  end
end

class SimpleLinkedList
  attr_accessor :head, :size
  def initialize
    @head = nil
    @size = 0
  end
  
  def empty?
    size.zero?
  end
  
  def push(x)
    self.head = Element.new(x, head)
    self.size += 1
  end
  
  def pop
    x = head.datum
    self.head = head.next
    self.size -= 1
    x
  end
  
  def peek
    head ? head.datum : nil
  end
  
  def self.from_a(arr)
    return new unless arr
    a = new
    arr.reverse.each { |x| a.push(x)  }
    a
  end
  
  def to_a
    arr = []
    el = head
    while el
      arr << el.datum
      el = el.next
    end
    arr
  end
  
  def reverse
    self.class.from_a(to_a.reverse)
  end
end
