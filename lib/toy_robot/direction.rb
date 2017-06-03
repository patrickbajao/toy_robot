module ToyRobot
  class Direction
    BEARINGS = {
      north: 0,
      south: 180,
      east: 90,
      west: 270
    }.freeze

    attr_reader :key
    attr_accessor :bearing

    def initialize(direction)
      @bearing = BEARINGS[direction.to_s.downcase.to_sym]
    end

    def valid?
      @bearing != nil
    end

    def to_s
      @key.to_s.upcase
    end
  end
end
