module ToyRobot
  class Table
    class Boundary < Struct.new(:min_x, :min_y, :max_x, :max_y) ; end

    attr_accessor :boundary

    def initialize(boundary = Boundary.new(0, 0, 4, 4))
      @boundary = boundary
    end
  end
end
