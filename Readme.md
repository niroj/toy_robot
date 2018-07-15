# Toy Robot Simulator

## Prerequisites

* Ruby 2.5.0 (Change .ruby-version if you want a different version.)

## Installation

* Clone this project to you local repository and change directory to it.
* Run `bundle install`

## Usage
* Initiate robot command line with following command and start entering robot commands
```    
./robot
```
* Use -f or --file to give path to command file
```
./robot -f <file_path>

examples:
./robot -f ./tests/fixtures/example_a
./robot -f ./tests/fixtures/example_b
./robot -f ./tests/fixtures/example_c
```

* To set row and column of table use -r/--row and -c/--col option
```
./robot -r 10 -c 10
```

## Valid Commands
* PLACE X,Y,DIRECTION
    - places robot in <X>, <Y> position facing in <DIRECTION> direction
* MOVE
    - moves 1 step in the direction robot is facing
* RIGHT
    - turns robot 90 degrees clockwise
* LEFT
    - turns robot 90 degrees anti-clockwise
* REPORT
    - prints out current position of robot

## Tests
* run test using `rake tests`

## Credits
[Niroj Shrestha](mailto:nexus.niroj@gmail.com)
