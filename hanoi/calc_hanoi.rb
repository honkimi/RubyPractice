require './hanoi'

if ARGV[0].nil? || ARGV[1].nil?
  puts "USAGE: ruby calc_hanoi.rb {How many times?} {How many Circles?}"
  exit
end

hanoi = Hanoi.new
hanoi.calcHanoi(ARGV[0].to_i, ARGV[1].to_i)
