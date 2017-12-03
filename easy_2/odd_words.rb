# easy version

# def scramble(sentence)
#   sentence.split.map.with_index { |x, i| i.even? ? x : x.reverse }.join(" ")
# end

# bonus

def scramble(sentence)
  result = ""
  sentence_idx = 0
  word_idx = 0
  sentence.chars.each do |char|
    if char == " "
      next if result[-1] == " "
      sentence_idx += 1
      word_idx = 0
    else
      word_idx += 1
    end
    if sentence_idx.even? || char == " "
      result << char
    else
      result.insert(-word_idx, char)
    end
  end
  result
end

puts scramble("whats         the     matter with    kansa    ") #== "whats eht matter htiw kansas   "