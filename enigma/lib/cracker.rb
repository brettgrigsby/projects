require './lib/decryptor'
require './lib/enigma_date'
require './lib/key'

class Cracker
  attr_accessor :key, :message

  def initialize
    @message = File.read("./lib/#{ARGV[0]}").chomp
    @date = EnigmaDate.new(ARGV[2])
    @key = 0
  end

  def key_arg
    @key.to_s.rjust(5,'0')
  end

  def key_found?
    iteration = Decryptor.new(@message, Key.new(key_arg), @date)
    iteration.decrypt[-7..-1] == "..end.."
  end

  def brute
    until key_found?
      raise("key has reached #{@key}") if @key > 99998
      @key += 1
    end
    @key
  end

  def do_it
    brute
    decryption = Decryptor.new(@message, Key.new(key_arg), @date)
    File.open("./lib/#{ARGV[1]}", "w") { |file| file.write(decryption.decrypt)}
    puts "Created '#{ARGV[1]}' with the cracked key #{@key} and date #{@date.value}"
  end

end

crack = Cracker.new
crack.do_it

