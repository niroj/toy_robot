#!/usr/bin/env ruby
#/ Usage: robot [options]
#/ -f, --file  path to the command file
#/ -r, --row   row of table the robot is placed, default: 5
#/ -c, --col   col of table the robot is placed, default: 5


$stdout = STDOUT
require 'optparse'
require './lib/controllers/robots'

#default options
file = nil
row = 5
col = 5

ARGV.options do |opts|
  opts.on('-f', '--file')       { file = ARGV[0] }
  opts.on('-r', '--row')        { row = ARGV[0] }
  opts.on('-c', '--col')        { col = ARGV[0] }
  opts.on_tail('-h', '--help')  { exec "grep ^#/<'#{__FILE__}'|cut -c4-" }
  opts.parse!
end

# initialize classes
robots = Robots.new(table_row: row, table_col: col)

if file
  puts robots.execute_file(file)
else
  puts "Ready. What do you want to do? Type 'exit' to quit"
  command = STDIN.gets
  while command != "exit\n" do
    result = robots.execute(command)
    puts result if result
    command = STDIN.gets
  end
end
