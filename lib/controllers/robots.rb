# Responsible for passing commands to robot
#
# Author:: Niroj Shrstha (mailto:nexus.niroj@gmail.com)
#
require './lib/models/table'
require './lib/models/robot'

class Robots
  VALID_COMMANDS = [ :place, :move, :left, :right, :report ]

  def initialize(table_row: nil, table_col: nil)
    @robot = Robot.new(Table.new(row: table_row, column: table_col))
  end

  # Calls command against robot instance
  # Params:
  # +command+:: command to execute
  #
  # Returns: current position<string> if command is report else nil<nil>
  def execute(command)
    return 'Not Placed' unless place_command?(command) || @robot.placed
    command, args = command.split(' ')
    command = command.to_s.downcase.to_sym
    args = args ? args.split(',') : []

    result = @robot.send(command, *args) if VALID_COMMANDS.include?(command)
    result if report_command?(command)
  end


  # parses command file and calls each valid line against robot instance
  # Params:
  # +command+:: command to execute
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

  # Checks if command is place command
  # Params:
  # +command+:: command to test
  def place_command?(command)
    !!(command =~ /^place/i)
  end

  # Checks if command is report command
  # Params:
  # +command+:: command to test
  def report_command?(command)
    !!(command =~ /^report/i)
  end
end
