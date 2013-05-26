require './hanoi'

num = ARGV[0].to_i
if num > 10
  puts "It will take too much time to calculate.\nPlease set under 10."
  exit
end
hanoi = Hanoi.new(num)
hanoi.dumpHanoi
