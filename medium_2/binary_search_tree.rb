class Bst
  attr_accessor :data, :left, :right
  def initialize(data)
    @data = data
  end
  
  def insert(num)
    branch = (num <= data ? :@left : :@right)
    unless instance_variable_get(branch)
      instance_variable_set(branch, Bst.new(num))
    else
      instance_variable_get(branch).insert(num)
    end
  end
  
  def all_nodes
    arr = []
    arr += left.all_nodes  if left
    arr << data
    arr += right.all_nodes if right
    arr
  end
  
  def each(&block)
    all_nodes.each(&block)
  end
end
