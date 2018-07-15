#!/usr/bin/env ruby
#/ Usage: robot [options]
#/ -f   path to the command file

$stdout = STDOUT
require 'optparse'
require './lib/robot'

ARGV.options do |opts|
  opts.on('-f')                 { file = ARGV[0] }
  opts.on_tail('-h', '--help')  { exec "grep ^#/<'#{__FILE__}'|cut -c4-" }
  opts.parse!
end

# initialize classes
robot = Robot.new

puts "Ready. What do you want to do? Type 'exit' to quit"
command = STDIN.gets
while command != "exit\n" do
  puts robot.execute(command)
  command = STDIN.gets
end
