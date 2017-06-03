module ToyRobot::Commands
  class Exit < Base
    def execute(*args)
      puts 'Thanks for using Toy Robot Simulator. Have a nice day! :)'
      throw :exit
    end
  end
end
