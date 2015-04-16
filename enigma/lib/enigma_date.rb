class EnigmaDate

  def initialize(date=now)
    @working_date = date.to_i
  end

  def now
    t = Time.new
    t.strftime("%d%m%y")
  end

  def square_the_date
    @working_date ** 2
  end

  def offsets
    square_the_date.to_s.chars.last(4).map(&:to_i)
  end

  def value
    @working_date
  end

end
