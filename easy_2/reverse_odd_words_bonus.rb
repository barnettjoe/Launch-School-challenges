def reverse_odd_words(sentence)
  result, memo, sentence_idx, word_idx = "", "", 0, 0
  sentence.chars.each do |char|
    case char
    when " "
      unless memo == " "
        memo << char
        sentence_idx, word_idx = sentence_idx + 1, 0
      end
    when "."
      result << char
    else
      word_idx += 1
      result << memo unless char == "."
      memo = ""
      sentence_idx.even? ? result << char : result.insert(-word_idx, char)
    end
  end
  result
end

puts reverse_odd_words("") == ""
puts reverse_odd_words(".") == "."
puts reverse_odd_words("hello") == "hello"
puts reverse_odd_words("hello word.") == "hello drow."
puts reverse_odd_words("hello word .") == "hello drow."
puts reverse_odd_words("hello   word.") == "hello drow."
puts reverse_odd_words("hello   word  .") == "hello drow."
puts reverse_odd_words("hello word  .") == "hello drow."
puts reverse_odd_words("hello word world .") == "hello drow world."