require 'minitest'
require 'minitest/autorun'
require 'minitest/emoji'
require './lib/character_map'


class CharacterMapTest < Minitest::Test
  def test_its_a_thing
    c_map = CharacterMap.new
    assert c_map.character_map
  end

  def test_returns_chars_from_index
    c_map = CharacterMap.new
    assert_equal "d", c_map.character_map[3]
  end

  def test_returns_index_values
    c_map = CharacterMap.new
    assert_equal 5, c_map.character_map.index("f")
  end

end
