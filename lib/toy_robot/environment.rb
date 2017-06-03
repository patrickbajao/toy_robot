module ToyRobot
  class Environment
    def initialize(robot = Robot.new, table = Table.new)
      @robot = robot
      @table = table
    end

    def start
      puts 'Welcome to Toy Robot Simulator!'
      print '> '

      catch(:exit) do
        while input = gets.chomp
          CommandExecutor.new(@robot, @table).execute(input)

          print '> '
        end
      end
    end
  end
end
