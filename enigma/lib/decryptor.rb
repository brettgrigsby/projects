require './lib/rotator'
require './lib/combiner'


class Decryptor
  attr_reader :message, :key, :date

  def initialize(message, key, date)
    @message = message
    @key = key
    @date = date
  end

  def decrypt
    combo = Combiner.new(@key, @date)
    roto = Rotator.new(@message, combo)
    roto.rotate_backward
  end

end
