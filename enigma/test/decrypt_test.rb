require 'minitest'
require 'minitest/autorun'
require 'minitest/emoji'
require './lib/decrypt'
require './lib/key'
require './lib/enigma_date'

# ruby test/decrypt_test.rb encrypted.txt decrypted.txt 11111 111111

class EncryptTest < Minitest::Test

  def test_single_letter
    crypt = Decrypt.new
    crypt.message = "8"
    crypt.do_it
    assert_equal "t", File.read("./lib/#{ARGV[1]}").chomp
  end

  def test_simple_encrypt
    crypt = Decrypt.new
    crypt.message = "8s55"
    crypt.do_it
    assert_equal "test", File.read("./lib/#{ARGV[1]}").chomp
  end

  def test_longer_string
    crypt = Decrypt.new
    crypt.message = "8s55x1tj72zqm7uu2u5j386"
    crypt.do_it
    assert_equal "testing some things out", File.read("./lib/#{ARGV[1]}").chomp
  end

end
