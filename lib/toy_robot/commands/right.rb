module ToyRobot
  module Commands
    class Right < Base
      def execute(*args)
        check_robot_placement

        @robot.position.bearing = ((@robot.position.bearing + 90) + 360) % 360
      end
    end
  end
end
