require 'spec_helper'

module ToyRobot
  describe CommandExecutor do
    let(:robot) { double }
    let(:table) { double }

    subject { described_class.new(robot, table) }

    describe '#execute' do
      let(:place_cmd) { double }

      it 'instantiates command class and calls #execute on it' do
        expect(Commands::Place).to receive(:new).with(robot, table) { place_cmd }
        expect(place_cmd).to receive(:execute).with(*['1', '1', 'NORTH'])
        subject.execute('PLACE 1,1,NORTH')
      end

      it 'prints out a message saying that the command is invalid when command is unknown' do
        expect(STDOUT).to receive(:puts).with('invalid command: UNKNOWN')
        subject.execute('UNKNOWN')
      end

      it 'prints out a message when ArgumentError is raised on command execution' do
        expect(Commands::Place).to receive(:new).with(robot, table) { place_cmd }
        expect(place_cmd).to receive(:execute).with(*['1', '1']).and_raise(ArgumentError.new('invalid arguments'))
        expect(STDOUT).to receive(:puts).with('invalid arguments')
        subject.execute('PLACE 1,1')
      end
    end
  end
end
