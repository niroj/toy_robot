require './lib/models/table'
require './lib/models/robot'

class Robots
  VALID_COMMANDS = [ :place, :move, :left, :right, :report ]

  def initialize(table_x: nil, table_y: nil)
    @robot = Robot.new(Table.new(row: table_x, column: table_y))
  end

  def execute(command)
    return 'Not Placed' unless place_command?(command) || @robot.placed
    command, args = command.split(' ')
    command = command.to_s.downcase.to_sym
    args = args ? args.split(',') : []

    result = @robot.send(command, *args) if VALID_COMMANDS.include?(command)
    result if report_command?(command)
  end

  def execute_file(file)
    commands = File.read(file).split("\n")
    output = []
    return 'File in incorrect format.' unless place_command?(commands[0])

    commands.each do |command|
      output << command
      result = execute(command)
      output << "\n#{result}" if report_command?(command)
    end

    output
  end

  def place_command?(command)
    !!(command =~ /^place/i)
  end

  def report_command?(command)
    !!(command =~ /^report/i)
  end
end
