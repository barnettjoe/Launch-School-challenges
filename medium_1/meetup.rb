require 'date'

class Meetup
  attr_reader :month, :year

  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(weekday, week)
    arr = DateArray.new
    correct_weekday = days_in_month.select do |day|
                        selector(weekday).call(day)
                      end
    correct_weekday.each { |x| arr << x }
    arr.send(week)
  end

  private

  def selector(weekday)
    Proc.new { |x| x.send("#{weekday}?".to_sym) }
  end

  def days_in_month
    day_1 = Date.new(year, month)
    (day_1...day_1.next_month)
  end
end

class DateArray < Array
  def second
    slice(1)
  end

  def third
    slice(2)
  end

  def fourth
    slice(3)
  end

  def teenth
    find { |date| (13..19).include? date.day }
  end
end