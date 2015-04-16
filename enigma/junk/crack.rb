require './lib/key'
require './lib/enigma_date'
require './lib/cracker'

class Crack
  attr_accessor :date, :message

  def initialize
    @date = EnigmaDate.new("#{ARGV[2]}")
    @message = File.read("./lib/#{ARGV[0]}").chomp
  end

  def do_it
    crack = CrackerNot.new(@message, @date)
    File.open("./lib/#{ARGV[1]}", "w") { |file| file.write(crack.decrypt)}
    puts "Created #{ARGV[1]} with the cracked key #{crack.key.key} and date #{crack.date.value}."
  end
end

brett = Crack.new
brett.do_it
