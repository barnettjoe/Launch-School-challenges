require 'pry'

class School
  attr_accessor :students

  def initialize
    @students = Hash.new
  end

  def add(name, grade)
    students[grade] = [] unless students[grade]
    students[grade] << name
  end

  def grade(n)
    students[n] || []
  end

  def to_h
    students.map { |k, v| [k, v.sort] }.sort.to_h
  end
end

#binding.pry