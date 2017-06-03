module ToyRobot
  module Commands
    class Place < Base
      def execute(*args)
        raise ArgumentError.new('invalid arguments for `PLACE` command') if args.empty? || args.size < 3

        x, y, direction = args

        bearing = bearing_of(direction)

        raise UnknownDirection if bearing.nil?

        position = Position.new(x, y, bearing)

        raise PositionOutOfBounds if position.outside?(@table.boundary)

        @robot.table = @table
        @robot.position = position
      end

      private

      def bearing_of(direction)
        Position::BEARINGS[direction.downcase.to_sym]
      end
    end
  end
end
