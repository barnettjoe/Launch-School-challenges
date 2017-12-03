def reverse_odd_words(sentence)
  a = sentence[/(\w|\s)*/].split.map.with_index do |x, i|
        i.even? ? x : x.reverse
      end.join(" ")
  a + (sentence.end_with?(".") ? "." : "")
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