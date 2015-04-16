require './lib/enigma_date'
require './lib/key'
require './lib/rotator'
require './lib/slicer'
require './lib/combiner'

class Processor
  attr_reader :key, :date, :message

  def input(key, date, message)
    @key = key
    @date = date
    @message = message
  end

  def process_all
    output = []
    output << combo
    output << slice
  end


  def combo
  combiner = Combiner.new(@key.get_pairs, @date.last_four)
  combiner.combine
  combiner.combined
  end

  def slice
  sliced = Slicer.new
  sliced.load_text(@message)
  sliced.chopper
  end

  # def process_date
  #   @date.last_four
  # end
  #
  # def process_key
  #   @key.get_pairs
  # end
end
