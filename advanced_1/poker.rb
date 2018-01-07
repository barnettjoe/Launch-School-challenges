class Poker
  attr_reader :hands

  HAND_RANKS = [:straight_flush,
                :four_of_kind,
                :full_house,
                :flush,
                :straight,
                :three_of_a_kind,
                :two_pair,
                :one_pair,
                :high_card]

  CARD_SEQ = %w[A 2 3 4 5 6 7 8 9 T J Q K A]

  def initialize(hands)
    @hands = hands.map { |arr| Hand.new(arr) }
  end

  def best_hand
    winning_type = hands.map(&:type).min_by { |x| HAND_RANKS.index(x) }
    poss_winners = hands.select { |hand| hand.type == winning_type }
    top = poss_winners.max_by(&:score_arr)
    poss_winners.select do |hand|
      hand.type == top.type && hand.score_arr == top.score_arr
    end.map(&:to_a)
  end
end

class Hand
  attr_reader :cards, :type
  def initialize(cards)
    @cards = cards.map { |str| Card.new(str) }
    @type = find_type
  end

  def find_type
    Poker::HAND_RANKS.each do |type|
      return type if send(type)
    end
  end

  def straight_flush
    flush && straight
  end

  def four_of_kind
    value_count == [1, 4]
  end

  def full_house
    value_count == [2, 3]
  end

  def flush
    suit_count.size == 1
  end

  def straight
    Poker::CARD_SEQ.each_cons(5).any? do |seq|
      seq.sort == cards.map(&:value).sort
    end
  end

  def three_of_a_kind
    value_count == [1, 1, 3]
  end

  def two_pair
    value_count == [1, 2, 2]
  end

  def one_pair
    value_count.size == 4
  end

  def high_card
    value_count.size == 5
  end

  def suit_count
    counts(%w[C D H S], :suit)
  end

  def value_count
    counts(Poker::CARD_SEQ[0...-1], :value)
  end

  def counts(arr, aspect)
    arr.map { |x| cards.count { |card| card.send(aspect) == x } }.reject(&:zero?).sort
  end

  def to_a
    cards.map(&:to_s)
  end

  def score_arr
    arr = cards.map { |card| Poker::CARD_SEQ[1..-1].index(card.value) }
    reps, kickers = arr.partition { |x| arr.count(x) > 1 }
    reps.sort_by { |x| [-arr.count(x), -x] }.uniq + kickers.sort.reverse
  end
end

class Card
  attr_reader :value, :suit
  def initialize(str)
    @str = str
    @value = str[0]
    @suit  = str[1]
  end

  def to_s
    @str
  end
end