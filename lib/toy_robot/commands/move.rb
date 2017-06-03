module ToyRobot
  module Commands
    class Move < Base
      def execute(*args)
        check_robot_placement

        current_position = @robot.position
        new_position = current_position.dup

        case @robot.position.bearing
        when 0
          new_position.y += 1
        when 180
          new_position.y -= 1
        when 90
          new_position.x += 1
        when 270
          new_position.x -= 1
        end

        raise PositionOutOfBounds if new_position.outside?(@table.boundary)

        @robot.position = new_position
      end
    end
  end
end
