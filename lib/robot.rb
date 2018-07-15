require './lib/table'

class Robot

  DIRECTIONS = { north: 0, east: 1, south: 2, west: 3 }
  VALID_COMMANDS = [ :place, :move, :left, :right, :report ]

  attr_reader :x, :y, :direction, :placed

  MOVES = {
    0 => [0, 1],
    1 => [1, 0],
    2 => [0, -1],
    3 => [-1, 0]
  }

  def initialize
    @x = 0
    @y = 0
    @d = 0
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
    return 'Not Placed' unless placed

    move_factor = MOVES[@d]
    if coordinate_valid?(temp_x = @x + move_factor[0], temp_y = @y + move_factor[1])
      @x = temp_x
      @y = temp_y
      "Moved one step in #{direction} direction"
    else
      "Cannot move further in #{direction} direction"
    end
  end

  def left
    return 'Not Placed' unless placed

    @d = @d == 0 ? 3 : @d - 1

    "Turned Left to face #{direction}"
  end

  def right
    return 'Not Placed' unless placed

    @d = @d == 3 ? 0 : @d + 1

    "Turned Right to face #{direction}"
  end

  def report
    return 'Not Placed' unless placed

    "#{@x},#{@y},#{direction}"
  end

  def execute(command)
    command, args = command.split(' ')
    command = command.to_s.downcase.to_sym
    args = args ? args.split(',') : []
    if VALID_COMMANDS.include?(command)
      self.send(command, *args)
    end
  end

  def direction_valid?(direction = @direction)

    DIRECTIONS.keys.include?(direction.to_s.downcase.to_sym)
  end

  def coordinate_valid?(x, y)
    Table.new.is_valid_coordinates?(x, y)
  end

  def direction
    DIRECTIONS.invert[@d].to_s.upcase
  end
end
