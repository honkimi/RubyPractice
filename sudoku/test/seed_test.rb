require 'test/unit'
require './data/seed'

class SeedTest < Test::Unit::TestCase

  def setup
    @ret = Seed.getSeed
  end

  def test_seed_data
    assert_equal(@ret[0][0], 4)
    assert_equal(@ret[0][1], 9)
    assert_equal(@ret[0][2], nil)
    assert_equal(@ret[1][0], nil)
    assert_equal(@ret[1][2], 7)
  end

  def test_seed_length
    assert_equal(@ret.length, 9)
    @ret.each_with_index do |r, i|
      assert_equal(r.length, 9)
    end
  end
end
