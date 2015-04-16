class Key
  attr_reader :key

  def initialize(key_string=randomize)
    @key = key_string
  end

  def offsets
    @key.chars.each_cons(2).map(&:join).map(&:to_i)
  end

  def valid?
    @key.to_s.size == 5 && @key != 0
  end

  def randomize
    (1..5).to_a.map { rand(9).to_s }.join
  end

end
