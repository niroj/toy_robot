require 'minitest/autorun'
require './lib/table'

class TableTest < Minitest::Test
  def setup
    @table = Table.new
  end

  def test_is_valid_coordinates_return_true_for_2_2
    assert_equal @table.is_valid_coordinates?(2, 2), true
  end

  def test_is_valid_coordinates_return_true_for_0_0
    assert_equal @table.is_valid_coordinates?(0, 0), true
  end

  def test_is_valid_coordinates_return_true_for_3_4
    assert_equal @table.is_valid_coordinates?(3, 4), true
  end

  def test_is_valid_coordinates_return_false_for_5_4
    assert_equal @table.is_valid_coordinates?(5, 4), false
  end

  def test_is_valid_coordinates_return_false_for_negative_1_3
    assert_equal @table.is_valid_coordinates?(-1, 3), false
  end
end
