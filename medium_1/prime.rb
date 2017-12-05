class Prime
  @@primes = [2]
  def self.grow_list
    val = @@primes.last
    val += 1
    val += 1 until @@primes.take_while { |x| x <= val**0.5 }.none? { |x| val % x == 0 }
    @@primes << val
  end

  def self.nth(n)
    grow_list until @@primes.size >= n
    @@primes[n - 1]
  end
end