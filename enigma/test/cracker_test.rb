require 'minitest'
require 'minitest/autorun'
require 'minitest/emoji'
require './lib/cracker'
require './lib/key'

# ruby ./test/crack_test.rb encrypted.txt cracked.txt 150415

class CrackerTest < Minitest::Test

  def test_real_encryption
    skip
    crack = Cracker.new
    crack.message = "nh.scqz 5h6c5b"
    crack.do_it
    assert_equal 70172, File.read("./lib/#{ARGV[1]}").chomp
  end

  def test_correct_end_of_message
    skip
    crypt = Cracker.new("nh.scqz 5h6c5b","150415")
    assert_equal " 5h6c5b", crypt.end_of_message
  end

  def test_initial_key_arg
    skip
    crypt = Cracker.new("nh.scqz 5h6c5b","150415")
    assert_equal "00000", crypt.key_arg
  end

  def test_with_correct_numbers
    skip
    crypt = Cracker.new("nh.scqz 5h6c5b","150415")
    crypt.key = 70102
    assert crypt.key_found?
  end



end
