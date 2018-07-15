require 'minitest/autorun'
require './lib/robot'

class RobotTest < Minitest::Test
  def setup
    @robot = Robot.new
  end

  def test_place_puts_robot_in_correct_place_if_valid_coordinates_are_given
    @robot.place(3, 4, 'SOUTH')

    assert_equal @robot.x, 3
    assert_equal @robot.y, 4
    assert_equal @robot.direction, 'SOUTH'
  end

  def test_place_doesnot_change_place_if_invalid_direction_is_given
    @robot.place(3, 4, 'INVALID')

    assert_equal @robot.x, 0
    assert_equal @robot.y, 0
    assert_equal @robot.direction, 'NORTH'
  end

  def test_place_doesnot_change_place_if_invalid_x_is_given
    @robot.place(10, 4, 'SOUTH')

    assert_equal @robot.x, 0
    assert_equal @robot.y, 0
    assert_equal @robot.direction, 'NORTH'
  end

  def test_place_doesnot_change_place_if_invalid_y_is_given
    @robot.place(4, 14, 'SOUTH')

    assert_equal @robot.x, 0
    assert_equal @robot.y, 0
    assert_equal @robot.direction, 'NORTH'
  end

  def test_move_moves_the_robot_in_north_direction_if_direction_north
    @robot.place(2, 3, 'NORTH')
    @robot.move

    assert_equal @robot.x, 2
    assert_equal @robot.y, 4
    assert_equal @robot.direction, 'NORTH'
  end

  def test_move_moves_the_robot_in_north_direction_if_direction_south
    @robot.place(2, 1, 'SOUTH')
    @robot.move

    assert_equal @robot.x, 2
    assert_equal @robot.y, 0
    assert_equal @robot.direction, 'SOUTH'
  end

  def test_move_moves_the_robot_in_north_direction_if_direction_east
    @robot.place(2, 1, 'EAST')
    @robot.move

    assert_equal @robot.x, 3
    assert_equal @robot.y, 1
    assert_equal @robot.direction, 'EAST'
  end

  def test_move_moves_the_robot_in_north_direction_if_direction_west
    @robot.place(2, 1, 'WEST')
    @robot.move

    assert_equal @robot.x, 1
    assert_equal @robot.y, 1
    assert_equal @robot.direction, 'WEST'
  end

  def test_move_doesnot_falls_robot_off_the_table_from_top_edge
    @robot.place(3, 4, 'NORTH')
    @robot.move

    assert_equal @robot.x, 3
    assert_equal @robot.y, 4
    assert_equal @robot.direction, 'NORTH'
  end

  def test_move_doesnot_falls_robot_off_the_table_from_right_edge
    @robot.place(4, 3, 'EAST')
    @robot.move

    assert_equal @robot.x, 4
    assert_equal @robot.y, 3
    assert_equal @robot.direction, 'EAST'
  end

  def test_move_doesnot_falls_robot_off_the_table_from_bottom_edge
    @robot.place(3, 0, 'SOUTH')
    @robot.move

    assert_equal @robot.x, 3
    assert_equal @robot.y, 0
    assert_equal @robot.direction, 'SOUTH'
  end

  def test_move_doesnot_falls_robot_off_the_table_from_right_edge
    @robot.place(0, 3, 'WEST')
    @robot.move

    assert_equal @robot.x, 0
    assert_equal @robot.y, 3
    assert_equal @robot.direction, 'WEST'
  end

  def test_left_turns_robot_in_anti_clockwise_direction
    @robot
    assert_equal @robot.direction, 'NORTH'

    @robot.left
    assert_equal @robot.direction, 'WEST'
  end

  def test_right_turns_robot_in_clockwise_direction
    @robot
    assert_equal @robot.direction, 'NORTH'

    @robot.right
    assert_equal @robot.direction, 'EAST'
  end

  def test_report_returns_current_position_of_robot
    @robot
    assert_equal @robot.report, '0,0,NORTH'

    @robot.place(3, 4, 'SOUTH')
    assert_equal @robot.report, '3,4,SOUTH'
  end

  def test_direction_valid_returns_true_for_valid_direction
    assert_equal @robot.direction_valid?('NORTH'), true
    assert_equal @robot.direction_valid?('SOUTH'), true
    assert_equal @robot.direction_valid?('EAST'), true
    assert_equal @robot.direction_valid?('WEST'), true
  end

  def test_direction_valid_returns_false_for_invalid_direction
    assert_equal @robot.direction_valid?('NORTHH'), false
  end

  def test_coordinate_valid_returns_true_for_valid_coordinates
    assert_equal @robot.coordinate_valid?(2, 3), true
  end

  def test_coordinate_valid_returns_false_for_invalid_coordinates
    assert_equal @robot.coordinate_valid?(5, 3), false
  end

end
