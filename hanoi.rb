class Poll
  attr_accessor :arr, :name

  def initialize(name)
    @arr = []
    @name = name
  end

  def push n
    raise "cannot push #{n}!" if !@arr.empty? && @arr.last <= n
    @arr.push n
  end

  def pop
    return @arr.pop
  end

  def to_s
    @arr.join(' ')
  end
      
end

class Hanoi
  attr_accessor :polls
  
  def initialize number = 3
    @n = number
    @no = 0
    @polls = {
      'S' => Poll.new('S'),
      'G' => Poll.new('G'),
      'B' => Poll.new('B')
    }
    @n.times do |i|
      @polls['S'].push(@n-i)
    end
  end

  def move(from, to)
    to.push(from.pop)
  end

  def dump
    puts "No: #{ @no }"
    @no += 1
    @polls.each do | key, value |
      puts(key + " : " + value.to_s)
    end
    puts ""
  end

  def dumpHanoi
    hanoi(@n, @polls['S'], @polls['G'], @polls['B'])
    dump
  end
  
  def hanoi(n, start, goal, buffer)
    return if n == 0
    hanoi(n-1, start, buffer, goal)
    dump
    move(start, goal)
    hanoi(n-1, buffer, goal, start)
  end

  def calcHanoi(trans_times, circle_num)
    moved_num = get_available_move_num(trans_times)
    if moved_num >= circle_num
      puts "You cannot move " + circle_num.to_s + " circles in " + trans_times.to_s + " times.\n" + "Minimum requirement number is " + (moved_num+1).to_s + "."
      return
    end
    calc(trans_times, circle_num, @polls['S'], @polls['G'], @polls['B'])
  end

  def calc(trans_times, circle_num , start, goal, buffer)
    # 移動できる円盤の個数を計算
    moved_num = get_available_move_num(trans_times)
    # moveNum個の円盤の移動が完了してからtrans_times回移動したものが次に求めるべきもの
    # n個の円盤の移動を完了させるには2**n - 1 回必要
    trans_times = trans_times - (2**moved_num- 1)
    # 現在ある円盤の個数と移動が完了した後の円盤の個数によって移動する場所が変わる
    if (circle_num + moved_num) % 2 == 0
      return moveDump(moved_num + 1, start, buffer) if trans_times == 1
      calc(trans_times-1, moved_num, goal, buffer, start)
    else
      return moveDump(moved_num + 1, start, goal) if trans_times == 1
      calc(trans_times-1, moved_num, buffer, goal, start)
    end
  end

  # 与えられたtrans_timesの内、移動が完了できるものの回数を取得。
  # ex) 1000の場合
  # 2**n - 1 < 1000       < n**(n+1) - 1
  # 2**n     < 1001       < 2**(n+1)
  # n        < log2(1000) < n + 1
  # log2(1000) = log(n) / log(2)
  def get_available_move_num(trans_times)
    return (Math.log(trans_times) / Math.log(2)).to_i
  end
  
  def moveDump(nHanoi, from, to)
    puts "#{nHanoi}th circle moved from #{from.name} to #{to.name}"
    return [nHanoi, from.name , to.name]
  end
end

