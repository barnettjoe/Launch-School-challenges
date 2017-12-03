class BeerSong
  def verse(n)
    ([ZeroBeers, OneBeer, TwoBeers][n] || ManyBeers).new.verse(n)
  end

  def verses(start, finish)
    (start.downto finish).map { |x| verse(x) }.join("\n")
  end

  def lyrics
    verses(99, 0)
  end
end

class ZeroBeers
  def verse(n)
    "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
  end
end

class OneBeer
  def verse(n)
    "1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n"
  end
end

class TwoBeers
  def verse(n)
    "2 bottles of beer on the wall, 2 bottles of beer.\nTake one down and pass it around, 1 bottle of beer on the wall.\n"
  end
end

class ManyBeers
  def verse(n)
    "#{n} bottles of beer on the wall, #{n} bottles of beer.\nTake one down and pass it around, #{n - 1} bottles of beer on the wall.\n"
  end
end