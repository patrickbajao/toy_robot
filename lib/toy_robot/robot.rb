module ToyRobot
  class Robot
    attr_accessor :table, :position

    def on_table?
      table != nil
    end
  end
end
