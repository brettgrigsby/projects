require 'minitest'
require 'minitest/autorun'
require 'minitest/emoji'
require './lib/key'

class KeyTest < Minitest::Test

  def test_valid_key
    key = Key.new("11111")
    assert key.valid?
  end

  def test_invalid_key
    key = Key.new("pri436")
    refute key.valid?
  end

  def test_can_split_a_number_into_4_pairs
    key = Key.new("12345")
    assert_equal [12,23,34,45], key.offsets
  end

  def test_splits_with_0_at_beginning
    key = Key.new("02345")
    assert_equal [2,23,34,45], key.offsets
  end

  def test_can_generate_a_random_5_digit_string_that_is_valid
    key = Key.new
    assert_equal 5, key.key.to_s.size
    assert key.valid?
  end

  def test_can_accept_a_number_starting_with_0
    key = Key.new("01111")
    assert_equal "01111", key.key
  end

end
