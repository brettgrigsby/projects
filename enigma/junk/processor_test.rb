require 'minitest'
require 'minitest/autorun'
require 'minitest/emoji'
require './lib/processor'
require './lib/key'
require './lib/enigma_date'

class EncryptorTest < Minitest::Test

  def test_accepts_key_date_and_message
    endo = Processor.new
    key = Key.new
    date = EnigmaDate.new
    endo.input(key, date, "test message")
    assert_equal 5, endo.key.key_value.size
    assert_equal 6, endo.date.value.size
    assert_equal "test message", endo.message
  end

  def test_uses_enigma_date_to_transform_date
    endo = Processor.new
    key = Key.new("41521")
    date = EnigmaDate.new("020415")
    endo.input(key, date, "test message")
    assert_equal [2, 2, 2, 5], endo.date.last_four
  end

  def test_uses_key_to_tranform_key_input
    endo = Processor.new
    key = Key.new("41521")
    date = EnigmaDate.new("020415")
    endo.input(key, date, "test message")
    assert_equal ["41", "15", "52", "21"], endo.key.get_pairs
  end

  def test_combines_transformed_key_and_date
    endo = Processor.new
    key = Key.new("41521")
    date = EnigmaDate.new("020415")
    endo.input(key, date, "test message")
    assert_equal [43, 17, 54, 26], endo.combo
  end

  def test_can_return_chopped_message
    endo = Processor.new
    key = Key.new("41521")
    date = EnigmaDate.new("020415")
    endo.input(key, date, "test message")
    assert_equal ["test", " mes", "sage"], endo.slice
  end

  def test_process_everything_and_spit_it_out
    endo = Processor.new
    key = Key.new("41521")
    date = EnigmaDate.new("020415")
    endo.input(key, date, "test message")
    assert_equal [[43,17,54,26],["test", " mes", "sage"]], endo.process_all
  end

end
