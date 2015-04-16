require './lib/character_map'

class Rotator

  def initialize(message="eat me", combiner)
    @combiner = combiner
    @message = message
    @char_map = CharacterMap.new.character_map
  end

  def cut_up(string)
    string.chars.each_slice(4).to_a.map(&:join)
  end

  def rotate_forward
    cut_up(@message).map do |string|
      move_ahead(string)
    end.join
  end

  def move_ahead(string)
    string.chars.map.with_index do |char, index|
      @char_map[((@char_map.index(char) + @combiner.offsets[index]) % 39)]
    end.join
  end

  def rotate_backward
    cut_up(@message).map do |string|
      move_back(string)
    end.join
  end

  def move_back(string)
    string.chars.map.with_index do |char, index|
      @char_map[((@char_map.index(char) - @combiner.offsets[index]) % 39)]
    end.join
  end

end
