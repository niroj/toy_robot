# Responsible for the Robot and its movements
#
# Author:: Niroj Shrstha (mailto:nexus.niroj@gmail.com)
#

require './lib/models/table'

class Robot
  attr_reader :x, :y, :direction, :placed

  DIRECTIONS = { north: 0, east: 1, south: 2, west: 3 }

  MOVES = {
    0 => [0, 1],  # move north
    1 => [1, 0],  # move east
    2 => [0, -1], # move south
    3 => [-1, 0]  # move west
  }

  def initialize(table = Table.new)
    @x = 0
    @y = 0
    @d = 0
    @table = table
  end

  # places robot in table
  # Params:
  # +x+:: position in x axis
  # +y+:: position in y axis
  # +direciton+:: direction if robot face
  def place(x, y, direction)
    return 'Direction Invalid' unless direction_valid?(direction)
    return 'Coordinate is Invalid.' unless coordinate_valid?(x, y)

    @x = x.to_i
    @y = y.to_i
    @placed = true
    @d = DIRECTIONS[direction.downcase.to_sym]
  end

  # moves robot one step in the direction its facing
  def move
    move_factor = MOVES[@d]
    if coordinate_valid?(temp_x = @x + move_factor[0], temp_y = @y + move_factor[1])
      @x = temp_x
      @y = temp_y
    end
  end

  # turns robot left
  def left
    @d = @d == 0 ? 3 : @d - 1
  end

  # turns robot right
  def right
    @d = @d == 3 ? 0 : @d + 1
  end

  # reports current position of robot
  def report
    "#{@x},#{@y},#{direction}"
  end

  # current direction of robot is facing
  def direction
    DIRECTIONS.invert[@d].to_s.upcase
  end

  # checks if given direction is valid
  def direction_valid?(direction = @direction)
    DIRECTIONS.keys.include?(direction.to_s.downcase.to_sym)
  end

  # checks if give coordinate is valid
  def coordinate_valid?(x, y)
    @table.is_valid_coordinates?(x, y)
  end

end
