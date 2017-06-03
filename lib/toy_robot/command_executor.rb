module ToyRobot
  class CommandExecutor
    def initialize(robot, table)
      @robot = robot
      @table = table
    end

    def execute(input)
      command, args = input.split(' ')
      args = args.split(',') if args

      begin
        command_class = Object.const_get("::ToyRobot::Commands::#{command.to_s.split('_').map(&:capitalize).join}")
      rescue NameError
        puts "invalid command: #{command}"
        return
      end

      begin
        command_class.new(@robot, @table).execute(*args)
      rescue Commands::UnknownDirection, Commands::PositionOutOfBounds, Commands::RobotNotOnTable => e
        puts "Ignored. #{e.message}"
      rescue ArgumentError => e
        puts e.message
      end
    end
  end
end
