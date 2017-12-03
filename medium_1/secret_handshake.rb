class SecretHandshake
  SIGNS = ["wink", "double blink", "close your eyes", "jump"]

  def initialize(n)
    @bin_signs = n.is_a?(Numeric) ? n.to_s(2) : n
  end

  def commands
    reverse = (@bin_signs.size == 5)
    actions = (@bin_signs.chars.reverse.zip SIGNS).select do |k, sign|
                k == "1" && sign
              end.map(&:last)
    reverse ? actions.reverse : actions
  end
end