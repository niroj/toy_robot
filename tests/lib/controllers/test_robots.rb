require 'minitest/autorun'
require 'mocha/minitest'
require './lib/controllers/robots'
require './lib/models/robot'

class RobotsTest < Minitest::Test
  def setup
    @robots = Robots.new
    @robots.execute('place 0,0,NORTH')
  end

  def test_execute_place_corresponding_place_in_robot
    Robot.any_instance.expects(:place).with('2', '3', 'NORTH')
    @robots.execute('place 2,3,NORTH')
  end

  def test_execute_move_corresponding_move_in_robot
    Robot.any_instance.expects(:move)
    @robots.execute('move')
  end

  def test_execute_report_corresponding_report_in_robot
    Robot.any_instance.expects(:report)
    @robots.execute('report')
  end

  def test_execute_left_corresponding_left_in_robot
    Robot.any_instance.expects(:left)
    @robots.execute('left')
  end

  def test_execute_right_corresponding_right_in_robot
    Robot.any_instance.expects(:right)
    @robots.execute('right')
  end

  def test_execute_file_return_correct_output_for_example_a
    output = @robots.execute_file('./tests/fixtures/example_a')
    assert_equal output.last, "\n0,1,NORTH"
  end

  def test_execute_file_return_correct_output_for_example_b
    output = @robots.execute_file('./tests/fixtures/example_b')
    assert_equal output.last, "\n0,0,WEST"
  end

  def test_execute_file_return_correct_output_for_example_c
    output = @robots.execute_file('./tests/fixtures/example_c')
    assert_equal output.last, "\n3,3,NORTH"
  end

  def test_report_command_is_true_for_report_command
    assert_equal @robots.report_command?('report'), true
  end

  def test_report_command_is_false_for_other_commands
    assert_equal @robots.report_command?('place'), false
    assert_equal @robots.report_command?('move'), false
  end

  def test_place_command_is_true_for_place_command
    assert_equal @robots.place_command?('place 0,0,north'), true
  end

  def test_place_command_is_false_for_other_commands
    assert_equal @robots.place_command?('report'), false
    assert_equal @robots.place_command?('move'), false
  end
end
