require 'minitest'
require 'minitest/autorun'
require 'minitest/emoji'
require './lib/combiner'
require './lib/key'
require './lib/enigma_date'

class CombinerTest < Minitest::Test

  def test_accepts_and_adds_2_arrays
    key = Key.new("12345")
    date = EnigmaDate.new("121215")
    combo = Combiner.new(key, date)
    assert_equal [18, 25, 36, 50], combo.offsets
  end

  def test_adds_values_starting_with_zero
    key = Key.new("02345")
    date = EnigmaDate.new("020415")
    combo = Combiner.new(key, date)
    assert_equal [4, 25, 36, 50], combo.offsets
  end

  def test_can_generate_values_to_combine
    combo = Combiner.new
    assert combo.offsets
  end

end
