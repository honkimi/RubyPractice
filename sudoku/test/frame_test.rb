require 'test/unit'
require './sudoku/cell'
require './sudoku/frame'

# ruby test/frame_test.rb
class FrameTest < Test::Unit::TestCase
  def setup
    cellvals = [nil, 3, 5, nil, nil, 7, 1, nil, 9]
    cells = []
    cellvals.each do |v|
      cells << Cell.new(v)
    end
    @frame = Frame.new(cells)
  end

  def test_get_right_line_top
    ret = @frame.get_right_line(1)
    assert_equal(3, ret[0])
    assert_equal(5, ret[1])
    assert_nil(ret[2])
  end

  def test_get_right_line_center
    ret = @frame.get_right_line(4)
    assert_nil(ret[0])
  end

  def test_get_right_line_bottom
    ret = @frame.get_right_line(8)
    assert_equal(9, ret[0])
    assert_equal(1, ret[1])
    assert_nil(ret[2])
  end

  def test_get_below_line_left
    ret = @frame.get_below_line(0)
    assert_nil(ret[0])
  end

  def test_get_below_line_center
    ret = @frame.get_below_line(1)
    assert_equal(3, ret[0])
    assert_nil(ret[1])
  end

  def test_get_below_line_right
    ret = @frame.get_below_line(2)
    assert_equal(5, ret[0])
    assert_equal(7, ret[1])
    assert_equal(9, ret[2])
  end
end
