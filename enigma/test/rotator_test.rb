require 'minitest'
require 'minitest/autorun'
require 'minitest/emoji'
require './lib/rotator'
require './lib/key'
require './lib/enigma_date'
require './lib/combiner'

class RotatorTest < Minitest::Test

  def setup
    @combo = Combiner.new(Key.new("11111"), EnigmaDate.new("111111"))
  end

  def test_splits_message_shorter_than_4
    roto = Rotator.new("yep", @combo)
    assert_equal ["yep"], roto.cut_up("yep")
  end

  def test_splits_message_into_4_chunk_chars
    roto = Rotator.new(@combo)
    assert_equal ["eat ", "me"], roto.cut_up("eat me")
  end

  def test_proccesses_1_string_forward
    roto = Rotator.new("test", @combo)
    assert_equal "8s55", roto.rotate_forward
  end

  def test_processes_1_string_backward
    roto = Rotator.new("8s55", @combo)
    assert_equal "test", roto.rotate_backward
  end

  def test_processes_3_length_string_forward
    roto = Rotator.new("tes", @combo)
    assert_equal "8s5", roto.rotate_forward
  end

  def test_processes_3_length_string_backward
    roto = Rotator.new("8s5", @combo)
    assert_equal "tes", roto.rotate_backward
  end

  def test_long_string_forward
    roto = Rotator.new("long train running", @combo)
    assert_equal "020sm74mx1k3910u2u", roto.rotate_forward
  end

  def test_long_string_backward
    roto = Rotator.new("020sm74mx1k3910u2u", @combo)
    assert_equal "long train running", roto.rotate_backward
  end
end
