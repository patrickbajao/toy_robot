require_relative 'toy_robot/environment'
require_relative 'toy_robot/command_executor'
require_relative 'toy_robot/table'
require_relative 'toy_robot/robot'
require_relative 'toy_robot/position'
require_relative 'toy_robot/commands'

module ToyRobot
  def self.environment
    Environment.new
  end
end
