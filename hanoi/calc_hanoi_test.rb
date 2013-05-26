require 'test/unit'
require './hanoi'

# calc_hanoi Test.
# I checked this value using the following android app.
# https://play.google.com/store/apps/details?id=com.honkimi.hanoi
class TestHanoi  < Test::Unit::TestCase
  def setup
    @hanoi = Hanoi.new
  end

  def test_11
    ret = @hanoi.calcHanoi(1, 1)
    assert_equal(1, ret[0])
    assert_equal('S', ret[1])
    assert_equal('G', ret[2])
  end

  def test_12
    ret = @hanoi.calcHanoi(1, 2)
    assert_equal(1, ret[0])
    assert_equal('S', ret[1])
    assert_equal('B', ret[2])
  end

  def test_22
    ret = @hanoi.calcHanoi(2, 2)
    assert_equal(2, ret[0])
    assert_equal('S', ret[1])
    assert_equal('G', ret[2])
  end

  def test_23
    ret = @hanoi.calcHanoi(2, 3)
    assert_equal(2, ret[0])
    assert_equal('S', ret[1])
    assert_equal('B', ret[2])
  end

  def test_32
    ret = @hanoi.calcHanoi(3, 2)
    assert_equal(1, ret[0])
    assert_equal('B', ret[1])
    assert_equal('G', ret[2])
  end

  def test_33
    ret = @hanoi.calcHanoi(3, 3)
    assert_equal(1, ret[0])
    assert_equal('G', ret[1])
    assert_equal('B', ret[2])
  end

  def test_43
    ret = @hanoi.calcHanoi(4, 3)
    assert_equal(3, ret[0])
    assert_equal('S', ret[1])
    assert_equal('G', ret[2])
  end

  def test_44
    ret = @hanoi.calcHanoi(4, 4)
    assert_equal(3, ret[0])
    assert_equal('S', ret[1])
    assert_equal('B', ret[2])
  end

  def test_53
    ret = @hanoi.calcHanoi(5, 3)
    assert_equal(1, ret[0])
    assert_equal('B', ret[1])
    assert_equal('S', ret[2])
  end

  def test_54
    ret = @hanoi.calcHanoi(5, 4)
    assert_equal(1, ret[0])
    assert_equal('G', ret[1])
    assert_equal('S', ret[2])
  end

  def test_63
    ret = @hanoi.calcHanoi(6, 3)
    assert_equal(2, ret[0])
    assert_equal('B', ret[1])
    assert_equal('G', ret[2])
  end

  def test_64
    ret = @hanoi.calcHanoi(6, 4)
    assert_equal(2, ret[0])
    assert_equal('G', ret[1])
    assert_equal('B', ret[2])
  end

  def test_73
    ret = @hanoi.calcHanoi(7, 3)
    assert_equal(1, ret[0])
    assert_equal('S', ret[1])
    assert_equal('G', ret[2])
  end

  def test_74
    ret = @hanoi.calcHanoi(7, 4)
    assert_equal(1, ret[0])
    assert_equal('S', ret[1])
    assert_equal('B', ret[2])
  end

  def test_84
    ret = @hanoi.calcHanoi(8, 4)
    assert_equal(4, ret[0])
    assert_equal('S', ret[1])
    assert_equal('G', ret[2])
  end

  def test_85
    ret = @hanoi.calcHanoi(8, 5)
    assert_equal(4, ret[0])
    assert_equal('S', ret[1])
    assert_equal('B', ret[2])
  end

  def test_94
    ret = @hanoi.calcHanoi(9, 4)
    assert_equal(1, ret[0])
    assert_equal('B', ret[1])
    assert_equal('G', ret[2])
  end

  def test_95
    ret = @hanoi.calcHanoi(9, 5)
    assert_equal(1, ret[0])
    assert_equal('G', ret[1])
    assert_equal('B', ret[2])
  end

  def test_104
    ret = @hanoi.calcHanoi(10, 4)
    assert_equal(2, ret[0])
    assert_equal('B', ret[1])
    assert_equal('S', ret[2])
  end

  def test_105
    ret = @hanoi.calcHanoi(10, 5)
    assert_equal(2, ret[0])
    assert_equal('G', ret[1])
    assert_equal('S', ret[2])
  end

  def test_114
    ret = @hanoi.calcHanoi(11, 4)
    assert_equal(1, ret[0])
    assert_equal('G', ret[1])
    assert_equal('S', ret[2])
  end

  def test_115
    ret = @hanoi.calcHanoi(11, 5)
    assert_equal(1, ret[0])
    assert_equal('B', ret[1])
    assert_equal('S', ret[2])
  end

  def test_124
    ret = @hanoi.calcHanoi(12, 4)
    assert_equal(3, ret[0])
    assert_equal('B', ret[1])
    assert_equal('G', ret[2])
  end

  def test_125
    ret = @hanoi.calcHanoi(12, 5)
    assert_equal(3, ret[0])
    assert_equal('G', ret[1])
    assert_equal('B', ret[2])
  end

  def test_134
    ret = @hanoi.calcHanoi(13, 4)
    assert_equal(1, ret[0])
    assert_equal('S', ret[1])
    assert_equal('B', ret[2])
  end

  def test_135
    ret = @hanoi.calcHanoi(13, 5)
    assert_equal(1, ret[0])
    assert_equal('S', ret[1])
    assert_equal('G', ret[2])
  end
end
