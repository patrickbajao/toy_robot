module ToyRobot::Commands
  class Report < Base
    def execute(*args)
      check_robot_placement

      puts @robot.position.to_s
    end
  end
end
