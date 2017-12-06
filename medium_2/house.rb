class House
  def self.recite
    new.recite
  end

  def recite
    (1..pieces.size).map { |n| "This is #{verse(n)}." }.join("\n\n") + "\n"
  end

  def verse(n)
    return pieces[-1][0] if n == 1
    "#{pieces[-n].join("\n")} #{verse(n - 1)}"
  end

  private

  def pieces
    [
      ['the horse and the hound and the horn', 'that belonged to'],
      ['the farmer sowing his corn', 'that kept'],
      ['the rooster that crowed in the morn', 'that woke'],
      ['the priest all shaven and shorn', 'that married'],
      ['the man all tattered and torn', 'that kissed'],
      ['the maiden all forlorn', 'that milked'],
      ['the cow with the crumpled horn', 'that tossed'],
      ['the dog', 'that worried'],
      ['the cat', 'that killed'],
      ['the rat', 'that ate'],
      ['the malt', 'that lay in'],
      ['the house that Jack built']
    ]
  end
end