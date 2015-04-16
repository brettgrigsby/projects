require 'minitest'
require 'minitest/autorun'
require 'minitest/emoji'
require './lib/slicer'

class SlicerTest < Minitest::Test

  def test_can_accept_string
    sly = Slicer.new
    sly.load_text("test string")
    assert sly.unsliced
  end

  def test_chops_4_character_string_into_1_element_array
    sly = Slicer.new
    sly.load_text("test")
    assert_equal ["test"], sly.chopper
  end

  def test_chops_8_chr_string_into_2_element_array
    sly = Slicer.new
    sly.load_text("rubytest")
    assert_equal ["ruby", "test"], sly.chopper
  end

  def test_chops_strings_with_spaces_and_symbols
    sly = Slicer.new
    sly.load_text("rub me!!")
    assert_equal ["rub ", "me!!"], sly.chopper
  end

  def test_can_handle_messages_with_remainder
    sly = Slicer.new
    sly.load_text("rubytestbro")
    assert_equal ["ruby", "test", "bro"], sly.chopper
  end
end
