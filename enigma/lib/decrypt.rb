require './lib/decryptor'
require './lib/key'
require './lib/enigma_date'

class Decrypt
  attr_accessor :key, :date, :message

  def initialize
    @key = Key.new("#{ARGV[2]}")
    @date = EnigmaDate.new("#{ARGV[3]}")
    @message = File.read("./lib/#{ARGV[0]}").chomp
  end

  def do_it
    encryption = Decryptor.new(@message, @key, @date)
    File.open("./lib/#{ARGV[1]}", "w") { |file| file.write(encryption.decrypt)}
    puts "Created #{ARGV[1]} with the key #{encryption.key.key} and date #{encryption.date.value}."
  end
end

brett = Decrypt.new
brett.do_it
