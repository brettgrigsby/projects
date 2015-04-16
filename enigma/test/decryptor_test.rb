require 'minitest'
require 'minitest/autorun'
require 'minitest/emoji'
require './lib/decryptor'
require './lib/key'
require './lib/enigma_date'

class EncryptorTest < Minitest::Test

  def setup
    @key = Key.new("11111")
    @date = EnigmaDate.new("111111")
  end

  def test_short_string
    crypt = Decryptor.new("8s55", @key, @date)
    assert_equal "test", crypt.decrypt
  end

  def test_string_shorter_than_4
    crypt = Decryptor.new("8s", @key, @date)
    assert_equal "te", crypt.decrypt
  end

  def test_longer_string
    crypt = Decryptor.new("8s55m7uu7l6tx1tj386", @key, @date)
    assert_equal "test this thing out", crypt.decrypt
  end

  def test_decrypt_with_random_values
    crypt = Decryptor.new("test this thing out", Key.new, EnigmaDate.new)
    assert_equal 19, crypt.decrypt.size
  end

end
