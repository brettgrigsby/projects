require 'minitest'
require 'minitest/autorun'
require 'minitest/emoji'
require './lib/encrypt'
require './lib/key'
require './lib/enigma_date'

class EncryptTest < Minitest::Test

  def test_single_letter
    crypt = Encrypt.new
    crypt.key = Key.new("11111")
    crypt.date = EnigmaDate.new("111111")
    crypt.message = "t"
    crypt.do_it
    assert_equal "8", File.read("./lib/#{ARGV[1]}").chomp
  end

  def test_simple_encrypt
    crypt = Encrypt.new
    crypt.key = Key.new("11111")
    crypt.date = EnigmaDate.new("111111")
    crypt.message = "test"
    crypt.do_it
    assert_equal "8s55", File.read("./lib/#{ARGV[1]}").chomp
  end

  def test_longer_string
    crypt = Encrypt.new
    crypt.key = Key.new("11111")
    crypt.date = EnigmaDate.new("111111")
    crypt.message = "testing some things out"
    crypt.do_it
    assert_equal "8s55x1tj72zqm7uu2u5j386", File.read("./lib/#{ARGV[1]}").chomp
  end

  def test_random_values
    crypt = Encrypt.new
    crypt.key = Key.new
    crypt.date = EnigmaDate.new
    crypt.message = "testing some things out"
    crypt.do_it
    assert_equal 23, File.read("./lib/#{ARGV[1]}").chomp.size
  end

end
