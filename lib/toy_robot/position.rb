module ToyRobot
  class Position
    BEARINGS = {
      north: 0,
      south: 180,
      east: 90,
      west: 270
    }.freeze

    attr_accessor :x, :y, :bearing

    def initialize(x, y, bearing)
      @x = x.to_i
      @y = y.to_i
      @bearing = bearing.to_i
    end

    def outside?(boundary)
      x < boundary.min_x || x > boundary.max_x || y < boundary.min_y || y > boundary.max_y
    end

    def direction
      BEARINGS.find { |key, value| value == @bearing }.first
    end

    def to_s
      "#{x},#{y},#{direction.to_s.upcase}"
    end
  end
end
