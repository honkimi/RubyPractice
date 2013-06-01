
class Output

  def initialize sudoku
    @sudoku = sudoku
  end

  def write
    horizontal_line
    3.times do |i|
      3.times do |i2|
        nums = @sudoku.get_right_line_num(i*3, i2*3)
        vertical_line
        nums.each do |num|
          print num ? " #{num} " : "   "
          vertical_line
        end
        puts ""
        horizontal_line
      end
    end
    puts ""
  end

  private
  def horizontal_line
    37.times do
      print '-'
    end
    puts ""
  end

  def vertical_line
    print "|"
  end
end
