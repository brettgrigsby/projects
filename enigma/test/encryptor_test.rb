require 'minitest'
require 'minitest/autorun'
require 'minitest/emoji'
require './lib/encryptor'
require './lib/key'
require './lib/enigma_date'

class EncryptorTest < Minitest::Test

  def setup
    @key = Key.new("11111")
    @date = EnigmaDate.new("111111")
  end

  def test_short_string
    crypt = Encryptor.new("test", @key, @date)
    assert_equal "8s55", crypt.encrypt
  end

  def test_string_shorter_than_4
    crypt = Encryptor.new("te", @key, @date)
    assert_equal "8s", crypt.encrypt
  end

  def test_longer_string
    crypt = Encryptor.new("test this thing out", @key, @date)
    assert_equal "8s55m7uu7l6tx1tj386", crypt.encrypt
  end

  def test_encrypt_with_random_values
    crypt = Encryptor.new("test this thing out", Key.new, EnigmaDate.new)
    assert_equal 19, crypt.encrypt.size
  end

end
