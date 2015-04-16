require './lib/key'
require './lib/enigma_date'

class Combiner

  def initialize(key=Key.new, date=EnigmaDate.new)
    @key = key
    @date = date
  end

  def offsets
    @key.offsets.map.with_index do |num, index|
      num + @date.offsets[index]
    end
  end

end
