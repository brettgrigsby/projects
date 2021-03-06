require './lib/encryptor'
require './lib/key'
require './lib/enigma_date'

class Encrypt
  attr_accessor :key, :date, :message

  def initialize
    @key = Key.new
    @date = EnigmaDate.new
    @message = File.read("./lib/#{ARGV[0]}").chomp
  end

  def do_it
    encryption = Encryptor.new(@message, @key, @date)
    File.open("./lib/#{ARGV[1]}", "w") { |file| file.write(encryption.encrypt)}
    puts "Created #{ARGV[1]} with the key #{encryption.key.key} and date #{encryption.date.value}."
  end
end

brett = Encrypt.new
brett.do_it
