class PigLatin
  NON_VOWELS = %w[thr sch th .?qu sh ch [^aeiou]].join("|")

  def self.pigify(word)
    return word + "ay" if word[/\A([aeiou]|((x|y)[^aeiou]))/]
    word.gsub(/(\A#{NON_VOWELS})(.*)/, '\2\1ay')
  end

  def self.translate(sentence)
    sentence.split.map { |word| pigify(word) }.join(" ")
  end
end