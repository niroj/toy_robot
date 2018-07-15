require './lib/models/table'

class Robot

  DIRECTIONS = { north: 0, east: 1, south: 2, west: 3 }

  attr_reader :x, :y, :direction, :placed

  MOVES = {
    0 => [0, 1],
    1 => [1, 0],
    2 => [0, -1],
    3 => [-1, 0]
  }

  def initialize(table = Table.new)
    @x = 0
    @y = 0
    @d = 0
    @table = table
  end

  def place(x, y, direction)
    return 'Direction Invalid' unless direction_valid?(direction)
    return 'Coordinate is Invalid.' unless coordinate_valid?(x, y)

    @x = x.to_i
    @y = y.to_i
    @placed = true
    @d = DIRECTIONS[direction.downcase.to_sym]
  end

  def move
    move_factor = MOVES[@d]
    if coordinate_valid?(temp_x = @x + move_factor[0], temp_y = @y + move_factor[1])
      @x = temp_x
      @y = temp_y
    end
  end

  def left
    @d = @d == 0 ? 3 : @d - 1
  end

  def right
    @d = @d == 3 ? 0 : @d + 1
  end

  def report
    "#{@x},#{@y},#{direction}"
  end

  def direction
    DIRECTIONS.invert[@d].to_s.upcase
  end

  def direction_valid?(direction = @direction)
    DIRECTIONS.keys.include?(direction.to_s.downcase.to_sym)
  end

  def coordinate_valid?(x, y)
    @table.is_valid_coordinates?(x, y)
  end

end
