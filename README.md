# Toy Robot

A simple but awesome toy robot simulator. Robot will be simulated on a 5x5 table.

## Setup

If you have RVM installed, this project will automatically create a gemset for you. You'll need to install `bundler` if it is not yet installed: `$ gem install bundler`.

If `bundler` is already installed, install the gems by running `bundle install`.

## How To Run

There's a ruby script in the root directory called `simulate.rb`. Run that like a normal shell script: `$ ./simulate.rb`. It'll prompt you to enter commands.

The following commands are accepted:

- `PLACE` - Places robot on the table based on given position. Requires parameters in this format: `x,y,direction`. Example: `PLACE 1,3,NORTH`.
- `MOVE` - Moves the robot 1 unit depending on where the robot is currently facing.
- `LEFT` - Rotates the robot 90 degrees to the left.
- `RIGHT` - Rotates the robot 90 degrees to the right.
- `REPORT` - Prints out current position of the robot.
- `EXIT` - Exits the simulator.

`MOVE`, `LEFT`, `RIGHT`, and `REPORT` commands will be ignored if the `PLACE` command has never been entered. The robot can be re-placed by inputting `PLACE` command again. Commands that will make the robot fall off the table will also be ignored.

## Tests

You can run the unit tests by executing `bundle exec rspec`. Acceptance test can be run by executing `bundle exec cucumber`.

# Additional section for testing PR

This is just additional content to test comments on PR.

Another line just for testing.

Also this one.
