#!/usr/bin/env ruby
#/ Usage: robot [options]
#/ -f   path to the command file

$stdout = STDOUT
require 'optparse'
require './lib/controllers/robots'

#default options
file = nil

ARGV.options do |opts|
  opts.on('-f')                 { file = ARGV[0] }
  opts.on_tail('-h', '--help')  { exec "grep ^#/<'#{__FILE__}'|cut -c4-" }
  opts.parse!
end

# initialize classes
robots = Robots.new

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
