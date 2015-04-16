require 'minitest'
require 'minitest/autorun'
require 'minitest/emoji'
require './lib/enigma_date'

class EnigmaDateTest < Minitest::Test

  def test_can_return_entered_date
    date = EnigmaDate.new("020415")
    assert_equal 20415, date.value
  end

  def test_can_return_current_date
    date = EnigmaDate.new
    # !!!change to today's date!!!
    assert_equal 150415, date.value
  end

  def test_can_square_the_date
    date = EnigmaDate.new("020415")
    assert_equal 416772225, date.square_the_date
  end

  def test_value_remains_after_squaring
    date = EnigmaDate.new("020415")
    assert_equal 416772225, date.square_the_date
    assert_equal 20415, date.value
  end

  def test_creates_an_array_of_last_4_of_square
    date = EnigmaDate.new("020415")
    assert_equal [2, 2, 2, 5], date.offsets
  end

end
