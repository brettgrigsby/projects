require './lib/rotator'
require './lib/combiner'


class Encryptor
  attr_reader :message, :key, :date

  def initialize(message, key, date)
    @message = message
    @key = key
    @date = date
  end

  def encrypt
    combo = Combiner.new(@key, @date)
    roto = Rotator.new(@message, combo)
    roto.rotate_forward
  end

end
