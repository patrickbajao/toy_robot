module ToyRobot::Commands
  class UnknownDirection < StandardError
    def message
      'Unknown direction.'
    end
  end

  class PositionOutOfBounds < StandardError
    def message
      'Robot will fall off the table.'
    end
  end

  class RobotNotOnTable < StandardError
    def message
      'Robot is not on the table yet.'
    end
  end

  class Base
    def initialize(robot, table)
      @robot = robot
      @table = table
    end

    def execute(*args)
      raise "#{__method__} not implemented, override in subclass."
    end

    def check_robot_placement
      raise RobotNotOnTable unless @robot.on_table?
    end
  end
end

Dir[File.expand_path('../commands/*.rb', __FILE__)].each do |file|
  require file
end
