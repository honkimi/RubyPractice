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
  N = 3
  def initialize
    @polls = {
      'S' => Poll.new('S'),
      'G' => Poll.new('G'),
      'B' => Poll.new('B')
    }
    N.times do |i|
      @polls['S'].push(N-i)
    end
  end

  def move(from, to)
    to.push(from.pop)
  end

  def dump
    @polls.each do | key, value |
      puts(key + " : " + value.to_s)
    end
    puts ""
  end

  def dumpHanoi
    hanoi(3, @polls['S'], @polls['G'], @polls['B'])
    dump
  end
  
  def hanoi(n, start, goal, buffer)
    return if n == 0
    hanoi(n-1, start, buffer, goal)
    dump
    move(start, goal)
    hanoi(n-1, buffer, goal, start)
  end

  def calcHanoi(nNum, nHanoi)
    getCircleCondition(nNum, nHanoi, @polls['S'], @polls['G'], @polls['B'])
  end
  
  #nNum: n回目の移動, nNum: 円盤数,  start: 移動元, goal: 移動先, buffer:移動のためのバッファ
  def getCircleCondition(nNum, nCircle, start, goal, buffer)
    # 一番下のを移動する回数にあたった時
    if nNum == 0
        moveDump(nCircle + 1, buffer, goal) 
        return
    end
    if nNum == 1
      if nCircle % 2 == 0
        moveDump(1, start, buffer) 
      else
        moveDump(1, start, goal) 
      end
      return
    end
    #何個の円盤の移動が完了しているか計算
    movedNum = (Math.log(nNum) / Math.log(2)).to_i
    if movedNum >= nCircle
      puts "You cannot move " + nCircle.to_s + " circles in " + nNum.to_s + " times.\n" + "Minimum requirement number is " + (movedNum+1).to_s + "."
      return
    end
    #moveNum個の円盤の移動が完了してから、nNum回移動したものが次に求めるべきもの
    nNum = nNum - (2**movedNum- 1)
    getCircleCondition(nNum-1, movedNum, buffer, goal, start)
  end

  def moveDump(nHanoi, from, to)
    puts "#{nHanoi}th ciecle moved from #{from.name} to #{to.name}"
  end
end

